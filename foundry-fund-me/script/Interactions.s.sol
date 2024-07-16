// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundFundMe is Script {
    uint256 constant SEND_VALUE = 0.01 ether;

    function fundFundMe(address mostRecentDeployedContract) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentDeployedContract)).fund{value: SEND_VALUE}();
        vm.stopBroadcast();
        console.log("Funded FundMe contract with %s", SEND_VALUE);
    }

    function run() external {
        address mostRecentDeployedContract = DevOpsTools
            .get_most_recent_deployment("FundMe", block.chainid);

        vm.startBroadcast();
        fundFundMe(mostRecentDeployedContract);
        vm.stopBroadcast();
    }
}

contract WithdrawFundMe is Script {
    function withdrawFundMe(address mostRecentDeployedContract) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentDeployedContract)).withdraw();
        console.log("Withdrew from FundMe contract");
        vm.stopBroadcast();
    }

    function run() external {
        address mostRecentDeployedContract = DevOpsTools
            .get_most_recent_deployment("FundMe", block.chainid);

        withdrawFundMe(mostRecentDeployedContract);
    }
}
