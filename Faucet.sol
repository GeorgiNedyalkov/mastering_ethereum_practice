pragma solidity ^0.8.0;

contract Faucet {
    receive() external payable;

    function withdraw(uint withdraw_amount) public {
        require(withdraw_amount < 0.1 ethers);
        msg.sender.transfer(withdraw_amount);
    }
}