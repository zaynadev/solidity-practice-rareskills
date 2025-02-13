// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

contract RemoveElement {
    uint256[] public arr;

    function setArr(uint256[] memory _arr) public {
        arr = _arr;
    }

    function removeElement(uint256 index) public {
        // remove the item at index from arr
        // the new array should have a length of arr.length - 1
        // use swap-and-pop to remove the item
        uint256 last = arr[arr.length - 1];
        arr[index] = last;
        arr.pop();
    }
}
