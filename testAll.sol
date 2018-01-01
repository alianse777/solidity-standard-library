pragma solidity ^0.4.0;

import "./Multiprecision.sol";
import "./Memory.sol";
import "./Random.sol";
import "./Convert.sol";

contract TestAll is Random, Converter, STDMemory {
    
    function testAll() public {
        
    }
    
    function TestRandom() public returns (bool) {
        randint();
        rand(1);
        uint r = randrange(10, 100);
        if(r >= 10 && r <= 100)
            return true;
        return false;
    }
    
    function TestConvert() public returns (bool) {
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
    
    function TestMemory() public returns (bool) {
        uint[] memory v1 = new uint[](100);
        for(uint i = 0;i < 100;i++) {
            v1[i] = i*i + 1;
        }
        uint[] memory result;
        result = m_unref_uint(m_ref_uint(v1), 100);
        for(uint j = 0;j < 100;j++) {
            if(result[j] != v1[j])
                return false;
        }
        return true;
    }
}