pragma solidity ^0.6.0;

contract SendEth {

    constructor() public payable{
        selfdestruct(0xBE4Fa577Aa1a12C7db338Fe5C20e3444C97e893e);
    }
}
