pragma solidity ^0.8.0;

contract EnumTest {
    enum ActionChoices { GoLeft, GoRight, GoRight, GoStraight, SitStill }
    ActionChoices choice;
    ActionChoices constant defaultChoice = ActionChoices.GoStraight;

    function setGoStraigh() public {
        choice = ActionChoices.GoStraight;
    }

    function getChoice() public pure returns (uint) {
        return uint(defaultChoice);
    }

    function getLargestValue() public pure returns (ActionChoices) {
        return type(ActionChoices).max;
    }

    function getSmallesttValue() public pure returns (ActionChoices) {
        return type(ActionChoices).min;
    }

    