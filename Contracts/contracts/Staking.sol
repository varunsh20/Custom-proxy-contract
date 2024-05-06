// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract Staking {
    mapping(address => uint256) public stakes;

    function stake(uint256 amount,address _from) external {
        require(amount > 0, "Invalid stake amount");
        stakes[_from] += amount;
    }

    function unstake(uint256 amount, address _to) external {
        require(amount <= stakes[msg.sender], "Insufficient staked amount");
        stakes[_to] -= amount;
    }

    function viewStake(address _account) external view returns(uint256){
        return stakes[_account];
    }
}
