pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

contract mappingTaskContract {

    mapping (address => uint256) public balance;

    function deposit(uint256 amount) public {
        balance[msg.sender] += amount;
    }

    function checkBalance() public view returns(uint256) {
        return balance[msg.sender];
    }
}