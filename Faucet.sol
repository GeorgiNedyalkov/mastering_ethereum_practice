pragma solidity ^0.8.0;

contract Faucet is Mortal{
    
    address owner;

    constructor() {
        owner = msg.sender;
    }
    
    receive() external payable;

    modifier onlyOnwer {
        require(msg.sender == owner, "Only the contract owner can call this function");
        _;
    }

    function withdraw(uint withdraw_amount) public {
        require(withdraw_amount < 0.1 ethers);
        require(this.balance >= withdraw_amount,
        "Insufficient balance in faucet for withdrawal request");
        msg.sender.transfer(withdraw_amount);
    }

    function destroy() public onlyOwner {
        selfdestruct(owner);
    }    
}