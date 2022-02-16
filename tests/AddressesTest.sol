// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

import "../lib/Addresses.sol";

/**
 * This is a manual set of tests, but I would suggest using Truffle if you
 * develop outside of remix
 *
 * WARNING: This is extremely gas heavy and should not be published to the
 * blockchain!
 */
contract AddressesTests {
    using Addresses for address;

    function testIsContract() public view {
        assert(address(this).isContract());
        assert(!msg.sender.isContract());
    }

    function testIsPayable() public view {
        assert(payable(msg.sender) == msg.sender.toPayable());
    }
}
