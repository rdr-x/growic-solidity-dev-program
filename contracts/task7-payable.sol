pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

contract PayableTaskContract {
    //variables and constants
    address payable public owner;
    uint256 private constant Fee = 3;
    //constructor called just when the contract is created/deployed
    constructor () {
        owner = payable(msg.sender);
    }
    //struct data types
    struct User {
        string name;
        uint256 age;
        uint256 amount;
    }
    //mapping 
    mapping (address => User) public user;

    //The contact should emit the following events when a user deposits and updates their profile information respectively:
    event FundsDeposited(address _user, uint256 _amount);
    event ProfileUpdated(address _user);

    //custom errors
    error AmountToSmall(); 
    //modifiers

    modifier userDeposited() {
        require(user[msg.sender].amount > 0, "You need to deposit first!");
        _;
    }

    modifier available(uint256 _amount) {
        if (_amount < Fee) {
            revert AmountToSmall();
        }
        _;
    }

        
    modifier onlyOwner() {
        require(msg.sender == owner, 'Just the owner of the contract is allowed to withdraw!');
        _;
    }

    //functions
    function deposit() public payable {
        user[msg.sender].amount += msg.value;
        emit FundsDeposited(msg.sender, msg.value);
    }

    function checkBalance() public view returns(uint256) {
        return user[msg.sender].amount;
    }

    function setUserDetails(string calldata _name, uint256 _age) public {
        user[msg.sender].name = _name;
        user[msg.sender].age = _age;
        emit ProfileUpdated(msg.sender);
    }

    function getUserDetail() public view returns(User memory) {
        return user[msg.sender];
    }

    function withdraw() public payable onlyOwner {
        user[msg.sender].amount -= msg.value;
    }

    function addFund() public payable userDeposited available(msg.value) {
        user[msg.sender].amount += msg.value;
        emit FundsDeposited(msg.sender, msg.value);

    }

}