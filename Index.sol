pragma solidity ^0.8.0;

contract Index {
    bool isEmpty;
    uint256 balance;
    int256 number;
    ufixed32x2 floater;
    address owner;
    bytes32 byteArray;
    bytes dynamicByteArray;
    uint256[] ids;

    struct Person {
        uint8 age;
        string memory name;
        address accountBalance;
        uint256 balanceAmount;
        mapping(address => uint256) balances;
    }
}
