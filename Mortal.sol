pragma solidity ^0.8.0;

contract Mortal is Owned {
    function destroy() public onlyOwner {
        selfdestruct(owner);
    }
}
