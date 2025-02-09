// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

interface IContract {
    function bar() external returns (uint256);
}

contract LowLevelReturnUint {
    function main(address a) public returns (uint256) {
        // call function "bar()" on address a
        // do not use an interface
        // return the return value of the call
        (, bytes memory data) = a.call(abi.encodeWithSignature("bar()"));
        uint256 x = abi.decode(data, (uint256));
        return x;

        // bonus challenge: use an interface and a high level call to accomplish the same task
        //return IContract(a).bar();
    }
}
