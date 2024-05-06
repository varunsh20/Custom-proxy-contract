// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Transfer {
    mapping(address => uint256) public balances;


    function mint(address _to, uint256 _amount) external{
        require(_amount>0,"Invalid Amount");
        balances[_to]+=_amount;
    }
    
    function transferFrom(address _from, address to, uint256 amount) external {
        require(amount <= balances[_from], "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    function viewBalance(address _account) external view returns(uint256){
        return balances[_account];
    }

}