pragma solidity ^0.8.0;

contract Owned {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOnwer {
        require(msg.sender == owner, "Only the contract owner can call this function");
        _;
    }
}


contract Mortal is Owned {
    function destroy() public onlyOwner {
        selfdestruct(owner);
    }
}


contract Faucet is Mortal{   
    event Withdrawa(address indexed to, uint amount);
    event Deposit(address indexed from, uint amount);    

    function withdraw(uint withdraw_amount) public {
            require(withdraw_amount < 0.1 ethers);
            require(this.balance >= withdraw_amount,
                "Insufficient balance in faucet for withdrawal request");

        msg.sender.transfer(withdraw_amount);
            emit(msg.sender, withdraw_amount);
    }

    function () external payable {
        emit Deposit(msg.sender, msg.value);
    }
     
}