// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.28;

import {console} from "forge-std/console.sol";

contract GetEther {
    // write any code you like inside this contract, but only this contract
    // get the Ether from the HasEther contract. You may not modify the test
    
    function getEther(HasEther hasEther) external {
        hasEther.action(address(this), abi.encodeWithSignature("selfTransfer()"));
    }

    receive() external payable {}
}

contract HasEther {

    constructor() payable {
        require(address(this).balance == 1 ether, "HasEther must be sent 1 ether");
    }

    function action(address to, bytes memory data) external {
        (bool success, ) = address(to).delegatecall(data);
        require(success, "Action failed");
    }
}