// SPDX-License-Identifier: MIT
pragma solidity >0.5.0 <0.9.0;

/* Library Imports */
import { Lib_BVMCodec } from "../../libraries/codec/Lib_BVMCodec.sol";

/**
 * @title IStateCommitmentChain
 */
interface IStateCommitmentChain {
    /**********
     * Events *
     **********/

    event StateBatchAppended(
        uint256 indexed _batchIndex,
        bytes32 _batchRoot,
        uint256 _batchSize,
        uint256 _prevTotalElements,
        bytes _signature,
        bytes _extraData
    );

    event StateBatchDeleted(uint256 indexed _batchIndex, bytes32 _batchRoot);

    event DistributeTssReward(
        uint256 indexed _startBlockNumber,
        uint256 _length,
        uint256 indexed _batchTime,
        address[] _tssMembers
    );

    event RollBackL2Chain(uint256 indexed _startBlockNumber);

    /********************
     * Public Functions *
     ********************/

    /**
     * Retrieves the total number of elements submitted.
     * @return _totalElements Total submitted elements.
     */
    function getTotalElements() external view returns (uint256 _totalElements);

    /**
     * Retrieves the total number of batches submitted.
     * @return _totalBatches Total submitted batches.
     */
    function getTotalBatches() external view returns (uint256 _totalBatches);

    /**
     * Retrieves the timestamp of the last batch submitted by the sequencer.
     * @return _lastSequencerTimestamp Last sequencer batch timestamp.
     */
    function getLastSequencerTimestamp() external view returns (uint256 _lastSequencerTimestamp);

    /**
     * Appends a batch of state roots to the chain.
     * @param _batch Batch of state roots.
     * @param _shouldStartAtElement Index of the element at which this batch should start.
     * @param _signature tss group signature of state batches.
     */
    function appendStateBatch(bytes32[] calldata _batch, uint256 _shouldStartAtElement, bytes memory _signature) external;

    /**
     * Deletes all state roots after (and including) a given batch.
     * @param _batchHeader Header of the batch to start deleting from.
     */
    function deleteStateBatch(Lib_BVMCodec.ChainBatchHeader memory _batchHeader) external;

    /**
     * Verifies a batch inclusion proof.
     * @param _element Hash of the element to verify a proof for.
     * @param _batchHeader Header of the batch in which the element was included.
     * @param _proof Merkle inclusion proof for the element.
     */
    function verifyStateCommitment(
        bytes32 _element,
        Lib_BVMCodec.ChainBatchHeader memory _batchHeader,
        Lib_BVMCodec.ChainInclusionProof memory _proof
    ) external view returns (bool _verified);

    /**
     * Checks whether a given batch is still inside its fraud proof window.
     * @param _batchHeader Header of the batch to check.
     * @return _inside Whether or not the batch is inside the fraud proof window.
     */
    function insideFraudProofWindow(Lib_BVMCodec.ChainBatchHeader memory _batchHeader)
    external
    view
    returns (bool _inside);

    /**
     * Emit event to notify sequencers to roll back.
     * @param _shouldRollBack roll back to should start .
     * @param _shouldStartAtElement Index of the element at which this batch should start
     * @param _signature signature of rollback message
     */
    function rollBackL2Chain(uint256 _shouldRollBack,uint256 _shouldStartAtElement, bytes memory _signature) external;

}