pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

contract StructsTaskContract {

    struct User {
        string name;
        uint256 age;
        uint256 amount;
    }

    mapping (address => User) public user;

    function deposit(uint256 _amount) public {
        user[msg.sender].amount += _amount;
    }

    function checkBalance() public view returns(uint256) {
        return user[msg.sender].amount;
    }

    function setUserDetails(string calldata _name, uint256 _age) public {
        user[msg.sender].name = _name;
        user[msg.sender].age = _age;
    }

    function getUserDetail() public view returns(User memory) {
        return user[msg.sender];
    }
}