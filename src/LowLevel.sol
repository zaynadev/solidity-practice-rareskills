// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

contract LowLevel {
    function main(address a) public returns (bool) {
        // call function "foo()" on address a
        // do not use an interface, use a low level call
        // return true if the call succeeded
        // return false if the call failed

        assembly {
            mstore(0x00, 0xc2985578)
            let ok := call(gas(), a, 0, 0x1c, 0x04, 0, 0)
            mstore(0x00, ok)
            return(0x00, 0x20)
        }

        // bonus challenge: use an interface and a high level call to accomplish the same task
        /*
        (bool success,) = a.call(abi.encodeWithSignature("foo()"));
        return success;
        */
    }
}
