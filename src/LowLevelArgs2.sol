// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

contract LowLevelArgs2 {
    function main(address a, uint256 x, uint256 y) public {
        // call rare(x, y) using a low-level call
        // if the low level call reverts, revert also

        assembly {
            mstore(0x00, 0xa5404d66)
            mstore(0x20, x)
            mstore(0x40, y)
            let ok := call(gas(), a, 0, 0x1c, 0x44, 0, 0)
            if iszero(ok) {
                returndatacopy(0x00, 0x00, returndatasize())
                revert(0x00, returndatasize())
            }
        }

        // bonus challenge: use an interface and a high level call to accomplish the same task
        //(bool success,) = a.call(abi.encodeWithSignature("rare(uint256,uint256)", x, y));
        //if (!success) revert();
    }
}
