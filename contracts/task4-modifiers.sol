pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

contract StructsTaskContract {

    address public owner;
    uint256 private Fee;

    constructor (uint256 _fee) {
        owner = msg.sender;
        Fee = _fee;
    }

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
    
    modifier onlyOwner() {
        require(msg.sender == owner, 'Just the owner of the contract is allowed to withdraw!');
        _;
    }

    function withdraw(uint256 _amount) public onlyOwner {
        user[msg.sender].amount += _amount;
    }

    modifier userDeposited() {
        require(user[msg.sender].amount > 0, "You need to deposit first!");
        _;
    }

    error AmountToSmall(); 

    modifier available(uint256 _amount) {
        if (_amount < Fee) {
            revert AmountToSmall();
        }
        _;
    }

    function addFund(uint256 _amount) public userDeposited available(_amount) {
        user[msg.sender].amount += _amount;
    }

}