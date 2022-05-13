pragma solidity ^0.8.0;

contract Faucet {
    
    address owner;

    constructor() {
        owner = msg.sender;
    }
    
    receive() external payable;

    modifier onlyOnwer {
        require(msg.sender == owner);
        _;
    }

    function withdraw(uint withdraw_amount) public {
        require(withdraw_amount < 0.1 ethers);
        msg.sender.transfer(withdraw_amount);
    }

    function destroy() public onlyOwner {
        selfdestruct(owner);
    }

    
}