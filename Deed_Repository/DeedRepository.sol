pragma solidity ^0.4.17;

import "./contracts/ERC721/ERC721.sol";

contract DeedRepository is ERC721 {
    
    function DeedRepository(string _name, string _symbol) public ERC721(_name, _symbol) {};

    function registerDeed(uint256 _tokenId, string _uri) public {
        _mint(msg.sender, _tokenId);
        addDeedMetaData(_tokenId, _uri);
        emit DeedRegistered(msg.sender, _tokenId);
    }

    function addDeedMetaData(uint256 _tokenId, string _uri) public returns(bool) {
        _setTokenURI(_tokenId, _uri);
        return true;
    }

    event DeedRegistered(address _by, uint256 _tokenId);
}