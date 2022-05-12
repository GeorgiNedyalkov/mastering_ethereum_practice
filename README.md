# CrowdFunding Contract specs

- [x]  Create a struct Funder with an address and amount.
- [x]  Create a struct Campaign with a beneficiary(address), fundingGoal, numFunders, amount, map (uint => Funder)
- [x] Create a state variable that records the num of Campaigns.
- [x] Create a function that Creates a new campaign.
- [x] Create a function for contributing
- [x] Create a function for checking if the goal is reached.
 - Returns a boolean 
 - Takes an argument of a campaign id
 - Create a new campaign with the argument id 
 - If goal isn't reached return false.
 - Empty the account 
 - Transfer the amount to the beneficiary
 - Return true