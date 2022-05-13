/*
var contract = web3.eth.contract(abi).at(address);
var gasEstimate = contract.MyAweSomeMethod.estimateGas(arg1, arg2, { from: account });

// to obtain the gas price from the network
var gasPrice = web3.eth.getGasPrice();
// estimate the gas cost:
var gasCostInEther = web3.utils.fromWei((gasEstimate * gasPrice), 'ether');
*/

var FaucetContract = artifacts.require("./Faucetl.sol");

FaucetContract.web3.eth.getGasPrice(function (error, result) {
    var gasPrice = Number(result);
    console.log("Gas price is " + gasPrice + " wei")// 1000000000000

    //get the contract instance
    FaucetContract.deployed().then(function (FaucetContractInstance) {

        // Use the keyword 'estimateGas' after the function name to the gas
        // estimation for this particular function (aprove)
        FaucetContractInstance.send(web3.utils.toWei(1, "ether"));
        return FaucetContractInstance.withdraw.estimateGas(web3.uils.toWei(0.1, "ether"));
    }).then(function (result) {
        var gas = Number(result);

        console.log("gas estimation = " + gas + " units");
        console.log("gas cost estimation = " + (gas * gasPrice) + " wei");
        console.log("gas cost estimation = " +
            FaucetContract.web3.utils.fromWei((gas * gasPrice), 'ether') + " ether")
    });
});