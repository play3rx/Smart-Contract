// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RedOrBlueBet {
    address public owner;
    uint256 public redBetTotal;
    uint256 public blueBetTotal;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    function betred(bool onRed) external payable {
        require(msg.value > 0, "Must send some ether to place a bet");

        if (onRed) {
            redBetTotal += msg.value;
        } else {
            blueBetTotal += msg.value;
        }
    }

 function betblue(bool onBlue) external payable {
        require(msg.value > 0, "Must send some ether to place a bet");

        if (onBlue) {
             blueBetTotal += msg.value;

        } else {
            redBetTotal += msg.value;
        }
    }


    function getRedBetTotal() public view returns (uint256) {
        return redBetTotal;
    }

    function getBlueBetTotal() public view returns (uint256) {
        return blueBetTotal;
    }

    function withdraw() external onlyOwner {
        uint256 contractBalance = address(this).balance;
        payable(owner).transfer(contractBalance);
    }
}
