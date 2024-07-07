// SPDX-License-Identifier: MIT

/**
 Types of tests:
 what can we do to work with addresses outside our system?
 1. Unit
  - Tesing a specific part of our code
 2. Integration
  - Testing how our contract interacts with other contracts
 3. Forked 
  - Testing our code on a simulated real environment
 4. Staging
  - Testing our code in a real environment that is not prod
 */

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test {
    FundMe fundMe;

    function setUp() external {
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
    }

    function testMinimumDollarIsFive() public view {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMsgSender() public view {
        assertEq(fundMe.i_owner(), msg.sender);
    }

    //Fork test: To run this we need -vvv --fork-url {alchemy url}
    function testPriceFeedVersionIsAccurate() public view {
        uint256 version = fundMe.getVersion();
        assertEq(version, 4);
    }
}
