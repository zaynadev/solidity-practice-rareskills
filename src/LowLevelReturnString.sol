// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

interface IContract {
    function baz() external returns (string memory);
}

contract LowLevelReturnString {
    function main(address a) public returns (string memory) {
        // call function "baz()" on address a
        // do not use an interface
        // baz() returns a string. Return the string.
        // However, if baz reverts, return an empty string

        (bool success, bytes memory data) = a.call(abi.encodeWithSignature("baz()"));
        if (!success) {
            bytes memory empty = new bytes(0);
            return string(empty);
        }
        string memory x = abi.decode(data, (string));
        return x;

        // bonus challenge: use an interface and a high level call to accomplish the same task
        /*
        try IContract(a).baz() returns (string memory s) {
            return s;
        } catch {
            bytes memory empty = new bytes(0);
            return string(empty);
        }
            */
    }
}
