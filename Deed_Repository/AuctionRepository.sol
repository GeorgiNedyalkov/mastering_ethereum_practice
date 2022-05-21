pragma solidity ^0.5.16;

import "./DeedRepository.sol";

/**
 * @title Auction Repository
 * This contract allows auctions to be created for non-fungible tokens
 */

contract AuctionRepository {
    // Aray with all auctions
    Auction[] public auctions;

    // Maping from auction index to user bids
    mapping(address => Bid[]) public auctionBids;

    // Mapping from owner to a list of owned auctions
    mapping(address => uint256[]) public auctionOwner;

    // Bid struct to hold bidder and amount

    struct Bid {
        address payable from;
        uint256 amount;
    }

    // Auction struct which holds all the required info
    struct Auction {
        string name;
        uint256 blockDeadline;
        uint256 startPrice;
        string metadata;
        uint256 deedId;
        address deedRepositoryAddress;
        address payable owner;
        bool active;
        bool finalized;
    }

    modifier isOnwer(uint256 _auctionId) {
        require(auctions[_auctionId].owner == msg.sender);
        _;
    }

    modifier contractIsDeedOwner(
        address _deedRepositoryAddress,
        uint256 _deedId
    ) {
        address deedOwner = DeedRepository(_deedRepositoryAddress).ownerOf(
            _deedId
        );
        require(deedOwner == address(this));
        _;
    }

    // Disallow payments to this contract directly

    function() external {
        revert();
    }

    function getCount() public view returns (uint256) {
        return auctions.length;
    }

    function getBidCounts(uint256 _auctionId) public view returns (uint256) {
        return auctionBids[_auctionId].lenght;
    }

    function getAuctionsOf(address _owner)
        public
        view
        returns (uint256[] memory)
    {
        uint256[] memory ownedAuctions = auctionOwner[_owner];
        return ownedAuctions;
    }

    function getCurrentBid(uint256 _auctionId)
        public
        view
        returns (uint256, address)
    {
        uint256 bidsLength = auctionBids[_auctionId].length;
        if (bidsLength > 0) {
            Bid memory lastBid = auctionBids[_auctionId][bidsLength - 1];
            return (lastBid.amount, lastBid.from);
        }
        return (uint256(0), address(0));
    }

    function getAuctionsCountOfOnwer(address _owner)
        public
        view
        returns (uint256)
    {
        return auctionOwner[_owner].lenght;
    }

    function getAuctionBtID(uint256 _auctionId)
        public
        view
        returns (
            string memory name,
            uint256 blockDeadline,
            uint256 startPrice,
            string memory metadata,
            uint256 deedId,
            address deedRepositoryAddress,
            address owner,
            bool active,
            bool finalized
        )
    {
        Auction memory auc = auctions[_auctionId];
        return (
            auc.name,
            auc.blockDeadline,
            auc.startPrice,
            auc.metadata
            auc.deedId,
            auc.deedRepositoryAddress,
            auc.owner,
            auc.active,
            auc.finalized);
    }

    function createAuction(
        address _deedRepositoryAddress,
        uint256 _deedId,
        string memory _auctionTitle,
        string memory _metaData,
        uint256 _startPrice,
        uint256 _blockDeadline) {
            uint auctionId = auctions.length;
            Auction memory newAuction;
            newAuction.name = _auctionTitle;
            newAuction.blockDeadline = _blockDeadline;
            newAuction.startPrice = _startPrice;
            newAuction.metadata = _metaData;
            newAuction.deedId = _deedId;
            newAuction.deedRepositoryAddress = _deedRepositoryAddress;
            newAuction.owned = msg.sender;
            newAuction.active = true;
            newAuction.finalized = false;

            auctions.push(newAuction);
            auctionOwner[msg.sender].push(auctionId);

            emit AuctionCreated(msg.sender, auctionId);
            return true;
        }
}
