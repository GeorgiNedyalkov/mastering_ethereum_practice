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
    uint256 oneSecond = 1 seconds;
    uint256 oneHour = 1 hours;

    struct Person {
        uint8 age;
        string memory name;
        address accountBalance;
        uint256 balanceAmount;
        mapping(address => uint256) balances;
    }

    msg.sender;
    msg.value;
    msg.gasleft;
    msg.data; // The data payload of this call into our contract
    msg.sig; // The first four bytes of the data payload, which is the func selector

    tx.gasprice;
    tx.origin;

    block.coinbase; // The address of the recepient of the block rewards and fees
    block.difficulty; // The difficulte (PoW) of the current block
    block.gaslimit; // The maximum amount of gas that can be spent accross all transaction included in the current block
    block.number; // The current block number (blockchain height)
    block.timestamp; // The timestamp placed in the current block by the miner (seconds since Unix epoch)

    address.balance; // The balance of this address in wei
    address.transfer(_amount_); // Transfer the amount (in wei) to this address, throwing an exception on any error.
    address.send(_amount_); // Similar to transfer, but returns false on error. WARNING: Always check the return value of send.
    address.call(_payload_); // Low-level CALL function. 
    // WARNING: unsafe - recipient can use up all the gas hiting an OOG exception.
    address.delegatecall(_payload_); //Low-level DELEGATECALL function, like callcode() but with the full msg context of the current contract. 
    // WARNING: advanced use only!



}
