pragma solidity ^0.4.0;

import "./Multiprecision.sol";
import "./Memory.sol";
import "./Random.sol";
import "./Convert.sol";
import "./Array.sol";

contract TestAll is Random, Converter, STDMemory, Double {
    
    function testAll() public {
        return TestRandom() && TestConvert() && TestMemory() && TestMultiprecision() && TestArray();
    }
    
    function TestRandom() public view returns (bool) {
        randint();
        rand(1);
        uint r = randrange(10, 100);
        if(r >= 10 && r <= 100)
            return true;
        return false;
    }
    
    function TestConvert() public pure returns (bool) {
        uint v1 = 256;
        if(strToInt(uintToStr(v1)) != int(v1)) {
            return false;
        }
        int v2 = -1280;
        if(strToInt(intToStr(v2)) != v2) {
            return false;
        }
        int v3 = 12654;
        if(strToInt(intToStr(v3)) != v3) {
            return false;
        }
        return true;
    }
    
    function TestMemory() public pure returns (bool) {
        uint size = 100;
        uint[] memory v1 = new uint[](size);
        for(uint i = 0;i < size;i++) {
            v1[i] = i*i + 1;
        }
        uint[] memory result;
        result = m_unref_uint(m_ref_uint(v1), size);
        for(uint j = 0;j < size;j++) {
            if(result[j] != v1[j])
                return false;
        }
        return true;
    }
    
    function TestMultiprecision() public view returns (bool) {
        double memory v1 = double_t(10, 25);
        double memory v2 = double_t(0, 70);
        double memory r = double_t(10, 95);
        if(!double_eq(r, double_add(v1, v2))) {
            return false;
        }
        r = double_t(-9, 55);
        if(!double_eq(r, double_sub(v2, v1))) {
            return false;
        }
        v1 = double_t(0, 50);
        v2 = double_t(1, 50);
        r = double_t(0, 75);
        if(!double_eq(r, double_mult(v1, v2))) {
            return false;
        }
        v1 = double_t(-2, 40);
        v2 = double_t(0, 80);
        r = double_t(-3, 0);
        if(!double_eq(r, double_div(v1, v2))) {
            return false;
        }
        return true;
    }
    
    function TestArray() public returns (bool) {
        uint size = 10;
        uint[] memory v1 = new uint[](size);
        for(uint i = 0;i < size;i++) {
            v1[i] = (size - i)*2;
        }
        UintArray arr1 = new UintArray(v1);
        if(uint(arr1.max()) != 2*size) {
            return false;
        }
        if(uint(arr1.min()) != 2) {
            return false;
        }
        arr1.sort();
        if(arr1.at(0) != 2*size || arr1.at(size-1) != 2) {
            return false;
        }
        
        int[] memory v2 = new int[](size);
        for(uint j = 0;j < size;j++) {
            v2[j] = int((size - j)*2);
        }
        IntArray arr2 = new IntArray(v2);
        if(uint(arr2.max()) != 2*size) {
            return false;
        }
        if(uint(arr2.min()) != 2) {
            return false;
        }
        arr2.sort();
        if(arr2.at(0) != int(2*size) || arr2.at(size-1) != 2) {
            return false;
        }
        return true;
    }
}