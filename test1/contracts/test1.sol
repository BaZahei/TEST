// SPDX-License-Identifier: MIT
pragma solidity ^0.5.7;
pragma experimental ABIEncoderV2;


//测试传入一个很大的机构体是否会使得交易的calldate很大



//测试结果：交易调用的函数对外提供调用时不允许storage类型的数据的，只能是memery或者calldate的数据，而在库函数、internal中是可以使用的，这里没有测试但是基本可以推断storage内部传递的实际是指针
contract testSet{
    function setState(test1.bigStruct storage _state, uint256 _uniDate) internal {
        //_state.interDate1.date2 = _uniDate;
    }
}

contract test1 is testSet{

    struct internalStruct{
        uint256 date1;
        uint256 date2;
        uint256 date3;
        string strDate1;
        mapping(uint256 => address) mapDate;
    }

    struct bigStruct{
        uint256 uniDate1;
        uint256 uniDate2;
        internalStruct interDate1;
        internalStruct interDate2;
    }

    bigStruct state;

    function setState(uint256 _uniDate) public {
        testSet.setState(state, _uniDate);
    }

}


