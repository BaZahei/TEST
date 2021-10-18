// SPDX-License-Identifier: MIT
pragma solidity ^0.5.7;
pragma experimental ABIEncoderV2;


//测试数组是否是特殊形式的映射

contract test2{
    function run(uint256 _num) public {
        bool[] memory newBools = new bool[](5);

        newBools[_num] = true;
    }
}