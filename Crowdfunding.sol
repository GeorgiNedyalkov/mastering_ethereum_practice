pragma solidity ^0.8.0;

struct Funder {
    address addr;
    uint256 amount;
}

contract CrowdFunding {
    struct Campaign {
        address payable beneficiary;
        uint256 fundingGoal;
        uint256 numFunders;
        uint256 amount;
        mapping(uint256 => Funder) funders;
    }

    uint256 numCampaigns;
    mapping(uint256 => Campaign) campaigns;

    function createNewCampaign(address payable beneficiary, uint256 goal)
        public
        returns (uint256 campaignID)
    {
        campaignID = numCampaigns++;
        Campaign storage c = campaigns[campaignID];
        c.beneficiary = beneficiary;
        c.fundingGoal = goal;
    }

    function contribute(uint256 campaignID) public payable {
        Campaign storage c = campaigns[campaignID];
        c.funders[c.numFunders++] = Funder({
            addr: msg.sender,
            amount: msg.value
        });
        c.amount += msg.value;
    }

    function checkGoalReached(uint256 campaignId)
        public
        view
        returns (bool reached)
    {
        Campaign storage c = campaigns[campaignId];
        if (c.amount < c.fundingGoal) return false;
        uint256 amount = c.amount;
        c.amount = 0;
        c.beneficiary.transfer(amount);
        return true;
    }
}
