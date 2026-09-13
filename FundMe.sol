// Get funds from users
// Withdraw
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    //uint256 public myValue = 1;
    uint256 public constant MINIMUM_USD = 5e18;

    address[] public funders;
    mapping(address funder=> uint256 amountFunded) public addressToAmountFunded;

    address public immutable i_owner;

    constructor(){
        i_owner = msg.sender;
    }
    

    function fund() public payable {
        msg.value.getConversionRate();
    // Allow users to send $
    // Have a minimum $ sent $5
    // 1. How do we send ETH to this contract?
    //myValue = myValue + 2;
    require(msg.value.getConversionRate() >= MINIMUM_USD, "didn't send enough ETH");//1e18, "didn't send enough ETH"); // 1e18 = 1 ETH = 1000000000000000000 = 1 * 10 **18
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender] += msg.value;
    // Undo any actions tha have been done, and send the remaining gas back

    }

    function withfraw() public onlyOwner{
        // for loop
        // [1,2,3,4]
        //  0,1,2,3
        //require(msg.sender == owner, "Must be owner!");
        for(uint256 funderIndex = 0;  funderIndex <funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0);
        // reset the array
        // withdraw the funds

        //transfer
        // payable(msg.sender).transfer(address(this).balance);

        // send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed");

        //(call)
        (bool callSuccess, bytes memory dataReturned) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");

        //msg.sender = adress
        //payable(msg.sender) = payable address
    }

    modifier onlyOwner(){
        require(msg.sender == i_owner, "Sender is not owner!!" );
        _;
    }

}