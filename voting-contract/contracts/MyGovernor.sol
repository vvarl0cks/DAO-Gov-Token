// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/governance/Governor.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorVotes.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorVotesQuorumFraction.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorCountingSimple.sol";

contract MyGovernor is Governor, GovernorVotes, GovernorCountingSimple, GovernorVotesQuorumFraction {
    constructor(IVotes _token)
        Governor("MyGovernor")
        GovernorVotes(_token)
        GovernorVotesQuorumFraction(4)
    {}

    // The functions below are overrides required by Solidity.

    function votingDelay() public pure override returns (uint256) {
        return 1; // 1 block
    }

    function votingPeriod() public pure override returns (uint256) {
        return 45818; // 1 week
    }

    function quorum(uint256 blockNumber) public view override(IGovernor, GovernorVotesQuorumFraction) returns (uint256) {
        return super.quorum(blockNumber);
    }

    function getVotes(address account, uint256 blockNumber) public view override(IGovernor, GovernorVotes) returns (uint256) {
        return super.getVotes(account, blockNumber);
    }

    function state(uint256 proposalId) public view override(Governor, GovernorCountingSimple) returns (ProposalState) {
        return super.state(proposalId);
    }

    function propose(address[] memory targets, uint256[] memory values, bytes[] memory calldatas, string memory description)
        public
        override(Governor, GovernorCountingSimple)
        returns (uint256)
    {
        return super.propose(targets, values, calldatas, description);
    }

    function _execute(address[] memory targets, uint256[] memory values, bytes[] memory calldatas, bytes32 descriptionHash)
        internal
        override(Governor, GovernorCountingSimple)
    {
        super._execute(targets, values, calldatas, descriptionHash);
    }

    function _countVote(uint256 proposalId, address account, uint8 support, uint256 weight)
        internal
        override(Governor, GovernorCountingSimple)
    {
        super._countVote(proposalId, account, support, weight);
    }
}
