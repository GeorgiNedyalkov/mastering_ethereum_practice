pragma solidity ^0.8.0;

import "Faucet.sol";

// Specifying different methods to call external contracts to our contract
// Method 1: The safest way to call other contracts is to create an instance
contract Token is Mortal {
    Faucet _faucet;

    constructor() {
        // You can specify the value in the contstructor to set initial state
        _faucet = (new Faucet).value(0.5 ether)();
    }

    // The Token contract itself owns the new Faucet contract and only Token can destroy it
    function destroy() ownerOnly {
        _faucet.destroy();
    }
}

// Method 2: Addresing an existing Instance
// Another way of calling a contract is casting the address of an existing instance of the contract
contract TokenExistingInstance is Mortal {
    Faucet _faucet;

    constructor(address _f) {
        _faucet = Faucet(_f);
        _faucet.withdraw(0.1 ether);
    }
    // This is riskier because we don't know if the address is a Faucet object
}

// Method 3: Raw call, delegatecall
