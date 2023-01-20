pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

contract ConstructorTaskContractA {
    address immutable private owner;
    uint FEE;

    constructor (uint _fee) {
            owner = msg.sender;
            FEE = _fee;
    }
}

contract ConstructorTaskContractB is ConstructorTaskContractA {
    
    address owner;

    constructor () ConstructorTaskContractA(20) {
        owner = msg.sender;
    }
}