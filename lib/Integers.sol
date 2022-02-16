// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/**
 * Integers Library
 *
 * In summary this is a simple library of integer functions which allow a simple
 * conversion to and from strings
 *
 * @author Abraham Udele <hello@abrahamudele.com>
 */
library Integers {
    /**
     * Parse Int
     *
     * Converts an ASCII string value into an uint as long as the string
     * its self is a valid unsigned integer
     *
     * @param _value The ASCII string to be converted to an unsigned integer

     * @return result The unsigned value of the ASCII string
     */
    function parseInt(string memory _value)
        public
        pure
        returns (uint256 result)
    {
        bytes memory _bytesValue = bytes(_value);
        uint256 j = 1;
        for (
            uint256 i = _bytesValue.length - 1;
            i >= 0 && i < _bytesValue.length;
            i--
        ) {
            assert(uint8(_bytesValue[i]) >= 48 && uint8(_bytesValue[i]) <= 57);
            result += (uint8(_bytesValue[i]) - 48) * j;
            j *= 10;
        }
    }

    /**
     * Converts an unsigned integer to the ASCII string equivalent value
     *
     * @param _base The unsigned integer to be converted to a string
     * @return string The resulting ASCII string value
     */
    function toString(uint256 _base) internal pure returns (string memory) {
        bytes memory _tmp = new bytes(32);
        uint256 i;
        for (i = 0; _base > 0; i++) {
            _tmp[i] = bytes1(uint8((_base % 10) + 48));
            _base /= 10;
        }
        bytes memory _real = new bytes(i--);
        for (uint256 j = 0; j < _real.length; j++) {
            _real[j] = _tmp[i--];
        }
        return string(_real);
    }

    /**
     * To Byte
     *
     * Convert an 8 bit unsigned integer to a byte
     *
     * @param _base The 8 bit unsigned integer
     * @return result The byte equivalent
     */
    function toByte(uint8 _base) public pure returns (bytes1 result) {
        assembly {
            let m_alloc := add(msize(), 0x1)
            mstore8(m_alloc, _base)
            result := mload(m_alloc)
        }
    }

    /**
     * To Bytes
     *
     * Converts an unsigned integer to bytes
     *
     * @param _base The integer to be converted to bytes
     * @return result The bytes equivalent
     */
    function toBytes(uint256 _base)
        internal
        pure
        returns (bytes memory result)
    {
        assembly {
            let m_alloc := add(msize(), 0x1)
            result := mload(m_alloc)
            mstore(result, 0x20)
            mstore(add(result, 0x20), _base)
        }
    }
}
