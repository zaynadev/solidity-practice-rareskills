// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

contract LowLevelArgs1 {
    function main(address a, uint256 x) public {
        // call rare(x) using a low-level call
        // if the low level call reverts, revert also

        assembly {
            mstore(0x00, 0xa5487e51)
            mstore(0x20, x)
            let ok := call(gas(), a, 0, 0x1c, 0x24, 0, 0)
            if iszero(ok) {
                returndatacopy(0x00, 0x00, returndatasize())
                revert(0x00, returndatasize())
            }
        }

        // bonus challenge: use an interface and a high level call to accomplish the same task
        //(bool success,) = a.call(abi.encodeWithSignature("rare(uint256)", x));
        //if (!success) revert();
    }
}
