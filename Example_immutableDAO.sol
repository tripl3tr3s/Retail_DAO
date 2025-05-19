// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";
import "@openzeppelin/contracts/governance/TimelockController.sol";
import "@openzeppelin/contracts/governance/Governor.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorTimelockControl.sol";

contract ImmutableGovernanceToken is ERC20Votes {
    uint256 public immutable maxSupply;

    constructor(uint256 _maxSupply)
        ERC20("ImmutableDAO", "IDAO")
        ERC20Permit("ImmutableDAO")
    {
        maxSupply = _maxSupply;
        _mint(msg.sender, _maxSupply);
    }

    function _afterTokenTransfer(address from, address to, uint256 amount)
        internal override(ERC20Votes)
    {
        super._afterTokenTransfer(from, to, amount);
    }

    function _mint(address to, uint256 amount)
        internal override(ERC20Votes)
    {
        require(totalSupply() + amount <= maxSupply, "Max supply reached");
        super._mint(to, amount);
    }

    function _burn(address account, uint256 amount)
        internal override(ERC20Votes)
    {
        super._burn(account, amount);
    }
}

contract ImmutableDAO is Governor, GovernorTimelockControl {
    constructor(IVotes _token, TimelockController _timelock)
        Governor("ImmutableDAO")
        GovernorTimelockControl(_timelock)
    {
        _token;
    }

    function votingDelay() public pure override returns (uint256) {
        return 1; // 1 block
    }

    function votingPeriod() public pure override returns (uint256) {
        return 45818; // ~1 week
    }

    function quorum(uint256 blockNumber) public pure override returns (uint256) {
        return 100000e18; // Example: 100,000 tokens
    }

    function getVotes(address account, uint256 blockNumber)
        public view override returns (uint256)
    {
        return super.getVotes(account, blockNumber);
    }

    function proposalThreshold() public pure override returns (uint256) {
        return 1000e18;
    }

    // Required overrides
    function state(uint256 proposalId)
        public view override(Governor, GovernorTimelockControl)
        returns (ProposalState)
    {
        return super.state(proposalId);
    }

    function propose(
        address[] memory targets,
        uint256[] memory values,
        bytes[] memory calldatas,
        string memory description
    )
        public override(Governor)
        returns (uint256)
    {
        return super.propose(targets, values, calldatas, description);
    }

    function _execute(
        uint256 proposalId,
        address[] memory targets,
        uint256[] memory values,
        bytes[] memory calldatas,
        bytes32 descriptionHash
    ) internal override(Governor, GovernorTimelockControl) {
        super._execute(proposalId, targets, values, calldatas, descriptionHash);
    }

    function _cancel(
        address[] memory targets,
        uint256[] memory values,
        bytes[] memory calldatas,
        bytes32 descriptionHash
    ) internal override(Governor, GovernorTimelockControl)
        returns (uint256)
    {
        return super._cancel(targets, values, calldatas, descriptionHash);
    }

    function _executor()
        internal view override(Governor, GovernorTimelockControl)
        returns (address)
    {
        return super._executor();
    }
}
