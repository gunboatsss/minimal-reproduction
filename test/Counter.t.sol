// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {OpsProxyFactory} from "./interfaces/OpsProxyFactory.sol";

contract CounterTest is Test {
    OpsProxyFactory ops = OpsProxyFactory(0x44bde1bccdD06119262f1fE441FBe7341EaaC185);
    address target = 0xd55caA93dAeb8D4F846C4936E3D7E402EE952b70;
    function setUp() public {
        vm.createSelectFork(vm.envString("OP_MAINNET_RPC"), 18634930);
    }
    function test_prankfailed() public {
        (address dedicatedMsgSender, bool deployed) = ops.getProxyOf(target);
        if (!deployed) {
            ops.deployFor(target);
        }
        vm.prank(target);
    }
}
