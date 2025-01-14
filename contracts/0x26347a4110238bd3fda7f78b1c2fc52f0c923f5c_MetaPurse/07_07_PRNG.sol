// SPDX-License-Identifier: MIT
// Copyright (c) 2021 Divergent Technologies Ltd (github.com/divergencetech)
pragma solidity >=0.8.9 <0.9.0;

library PRNG {
    /**
    @notice A source of random numbers.
    @dev Pointer to a 4-word buffer of {seed, counter, entropy, remaining unread
    bits}. however, note that this is abstracted away by the API and SHOULD NOT
    be used. This layout MUST NOT be considered part of the public API and
    therefore not relied upon even within stable versions
     */
    type Source is uint256;

    /// @notice Layout within the buffer. 0x00 is the seed.
    uint256 private constant COUNTER = 0x20;
    uint256 private constant ENTROPY = 0x40;
    uint256 private constant REMAIN = 0x60;

    /**
    @notice Returns a new deterministic Source, differentiated only by the seed.
    @dev Use of PRNG.Source does NOT provide any unpredictability as generated
    numbers are entirely deterministic. Either a verifiable source of randomness
    such as Chainlink VRF, or a commit-and-reveal protocol MUST be used if
    unpredictability is required. The latter is only appropriate if the contract
    owner can be trusted within the specified threat model.
     */
    function newSource(bytes32 seed) internal pure returns (Source src) {
        assembly {
            src := mload(0x40)
            mstore(0x40, add(src, 0x80))
            mstore(src, seed)
        }
        _refill(src);
    }

    /**
    @dev Hashes seed||counter, placing it in the entropy word, and resets the
    remaining bits to 256. Increments the counter ready for the next refill.
     */
    function _refill(Source src) private pure {
        assembly {
            mstore(add(src, ENTROPY), keccak256(src, 0x40))
            mstore(add(src, REMAIN), 256)
            let ctr := add(src, COUNTER)
            mstore(ctr, add(1, mload(ctr)))
        }
    }

    /**
    @notice Returns the specified number of bits <= 256 from the Source.
    @dev It is safe to cast the returned value to a uint<bits>.
     */
    function read(Source src, uint256 bits)
        internal
        pure
        returns (uint256 sample)
    {
        require(bits <= 256, "PRNG: max 256 bits");

        uint256 remain;
        assembly {
            remain := mload(add(src, REMAIN))
        }
        if (remain > bits) {
            return readWithSufficient(src, bits);
        }

        uint256 extra = bits - remain;
        sample = readWithSufficient(src, remain);
        assembly {
            sample := shl(extra, sample)
        }

        _refill(src);
        sample = sample | readWithSufficient(src, extra);
    }

    /**
    @notice Returns the specified number of bits, assuming that there is
    sufficient entropy remaining. See read() for usage.
     */
    function readWithSufficient(Source src, uint256 bits)
        private
        pure
        returns (uint256 sample)
    {
        assembly {
            let pool := add(src, ENTROPY)
            let ent := mload(pool)
            sample := and(ent, sub(shl(bits, 1), 1))

            mstore(pool, shr(bits, ent))
            let rem := add(src, REMAIN)
            mstore(rem, sub(mload(rem), bits))
        }
    }

    /// @notice Returns a random boolean.
    function readBool(Source src) internal pure returns (bool) {
        return read(src, 1) == 1;
    }

    /**
    @notice Returns the number of bits needed to encode n.
    @dev Useful for calling readLessThan() multiple times with the same upper
    bound.
     */
    function bitLength(uint256 n) internal pure returns (uint16 bits) {
        assembly {
            for {
                let _n := n
            } gt(_n, 0) {
                _n := shr(1, _n)
            } {
                bits := add(bits, 1)
            }
        }
    }

    /**
    @notice Returns a uniformly random value in [0,n) with rejection sampling.
    @dev If the size of n is known, prefer readLessThan(Source, uint, uint16) as
    it skips the bit counting performed by this version; see bitLength().
     */
    function readLessThan(Source src, uint256 n)
        internal
        pure
        returns (uint256)
    {
        return readLessThan(src, n, bitLength(n));
    }

    /**
    @notice Returns a uniformly random value in [0,n) with rejection sampling
    from the range [0,2^bits).
    @dev For greatest efficiency, the value of bits should be the smallest
    number of bits required to capture n; if this is not known, use
    readLessThan(Source, uint) or bitLength(). Although rejections are reduced
    by using twice the number of bits, this increases the rate at which the
    entropy pool must be refreshed with a call to keccak256().

    TODO: benchmark higher number of bits for rejection vs hashing gas cost.
     */
    function readLessThan(
        Source src,
        uint256 n,
        uint16 bits
    ) internal pure returns (uint256 result) {
        // Discard results >= n and try again because using % will bias towards
        // lower values; e.g. if n = 13 and we read 4 bits then {13, 14, 15}%13
        // will select {0, 1, 2} twice as often as the other values.
        for (result = n; result >= n; result = read(src, bits)) {}
    }

    /**
    @notice Returns the internal state of the Source.
    @dev MUST NOT be considered part of the API and is subject to change without
    deprecation nor warning. Only exposed for testing.
     */
    function state(Source src)
        internal
        pure
        returns (
            uint256 seed,
            uint256 counter,
            uint256 entropy,
            uint256 remain
        )
    {
        assembly {
            seed := mload(src)
            counter := mload(add(src, COUNTER))
            entropy := mload(add(src, ENTROPY))
            remain := mload(add(src, REMAIN))
        }
    }
}