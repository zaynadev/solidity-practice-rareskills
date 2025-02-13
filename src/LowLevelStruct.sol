// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

interface IContract {
    function point() external returns (uint256 x, uint256 y);
}

contract LowLevelStruct {
    function main(address a) public returns (uint256 x, uint256 y) {
        // call function "point()" on address a
        // do not use an interface
        // point() returns a struct with two uint256 fields, i.e.
        // struct Point {
        //     uint256 x;
        //     uint256 y;
        // }
        // return the two fields
        // revert if the low level call reverts
        (bool success, bytes memory data) = a.call(abi.encodeWithSignature("point()"));
        if (!success) revert();
        (x, y) = abi.decode(data, (uint256, uint256));
        // bonus challenge: use an interface and a high level call to accomplish the same task
        //return IContract(a).point();
    }
}
