// Get funds from users
// Withdraw
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    //uint256 public myValue = 1;
    uint256 public minimumUsd = 5e18;

    address[] public funders;
    mapping(address funder=> uint256 amountFunded) public addressToAmountFunded;

    function fund() public payable {
        msg.value.getConversionRate();
    // Allow users to send $
    // Have a minimum $ sent $5
    // 1. How do we send ETH to this contract?
    //myValue = myValue + 2;
    require(msg.value.getConversionRate() >= minimumUsd, "didn't send enough ETH");//1e18, "didn't send enough ETH"); // 1e18 = 1 ETH = 1000000000000000000 = 1 * 10 **18
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    // What is a revert?
    // Undo any actions tha have been done, and send the remaining gas back

    }

    //function withfraw() public {}

}