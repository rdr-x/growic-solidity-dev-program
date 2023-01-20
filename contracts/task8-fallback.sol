pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

contract FallbackTaskContract {
event Log(address _addr, uint _value, bytes _data);

    fallback() external payable {
        emit Log(msg.sender,msg.value,msg.data);
    }
}