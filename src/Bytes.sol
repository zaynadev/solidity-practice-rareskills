// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

contract Bytes {
    function main(uint8 z) public returns (bytes memory) {
        // if z = 0, return empty bytes
        // if z = 1, return bytes 0x00
        // if z = 2, return bytes 0x0001
        // if z = 3, return bytes 0x000102
        // if z = 4, return bytes 0x00010203
        // ...
        // etc

        assembly {
            mstore(0x00, 0x20)
            mstore(0x20, z)
            for { let i := 0 } lt(i, z) { i := add(i, 1) } { mstore8(add(i, 0x40), i) }
            return(0x00, add(z, 0x40))
        }

        /*
        bytes memory b = new bytes(z);
        for (uint8 i; i < z; i++) {
            b[i] = bytes1(i);
        }
        return b;
        */
    }
}
