// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/**
 * Addresses Library
 *
 * This is a simple library of address functions which make simple
 * address operations less tedious in solidity.
 *
 *
 * @author Abraham Udele <hello@abrahamudele.com>
 */
library Addresses {
    /**
     * @dev Check if `_addr` is a contract on ethereum network .
     *
     * This test is non-exhaustive, and there may be false-negatives: during the
     * execution of a contract's constructor, its address will be reported as
     * not containing a contract.
     *
     * > It is unsafe to assume that an address for which this function returns
     * false is an externally-owned _addr (EOA) and not a contract.
     */
    function isContract(address _addr) internal view returns (bool) {
        // This method relies in extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        uint256 codeSize;
        // solhint-disable-next-line no-inline-assembly
        assembly {
            codeSize := extcodesize(_addr)
        }
        return codeSize > 0;
    }

    /**
     * @dev Converts an `address` into `address payable`.
     * Note that this is simply a type cast:
     * the actual underlying value is not changed.
     */
    function toPayable(address _addr) internal pure returns (address payable) {
        return payable(_addr);
    }
}
