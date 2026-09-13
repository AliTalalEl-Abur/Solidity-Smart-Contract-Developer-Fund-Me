// Get funds from users
// Withdraw
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.1;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


contract FundMe {

    //uint256 public myValue = 1;
    uint256 public minimumUsd = 5;

    function fund() public payable {
    // Allow users to send $
    // Have a minimum $ sent $5
    // 1. How do we send ETH to this contract?
    //myValue = myValue + 2;
    require(msg.value > minimumUsd, "didn't send enough ETH");//1e18, "didn't send enough ETH"); // 1e18 = 1 ETH = 1000000000000000000 = 1 * 10 **18
    
    // What is a revert?
    // Undo any actions tha have been done, and send the remaining gas back

    }

    //function withfraw() public {}

    function getPrice public(){
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI
    }

    function getVersion() public view returns (uint256){
       return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();

    }

    function getConversionRate(){

    }
}