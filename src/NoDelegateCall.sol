// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.28;

contract NoDelegateCall {
    // your code here
    // hint: https://www.rareskills.io/post/nodelegatecall
    address private immutable originalAddress;

    constructor() {
        originalAddress = address(this);
    }

    modifier noDelegateCall() {
        require(address(this) == originalAddress, "no delegate call");
        _;
    }

    function meaningOfLifeAndEverything() public view noDelegateCall returns (uint256 fourtyTwo) {
        // your code here
        // this function should be callable, but not delegatecallable
        // it should return 42
        fourtyTwo = 42;
    }
}
