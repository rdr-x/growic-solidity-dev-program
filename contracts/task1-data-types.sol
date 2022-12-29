pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

contract primitiveDataTypes {

    enum AccountType { NEW, TRADER, BUILDER }
    
    AccountType public _accountType;

    address public owner;
    uint public id;
    int public maxInt = type(int).max;
    bool public isNewAccount = true;
    bytes public message;
    
    function getAccountType() public view returns(AccountType) {
        return _accountType;
    }

    function setAccountType(AccountType accountType) public {
        _accountType = accountType;
    }

}
