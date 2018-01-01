pragma solidity ^0.4.0;

/*
#    Copyright (C) 2017  alianse777

#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/


contract Converter {
    /**
    * @dev Convert unsigned int to c-string (bytes).
    * @param v - uint to convert.
    * @return bytes.
    */
    function uintToStr(uint v) pure public returns (bytes) {
        uint maxlength = 100; 
        bytes memory reversed = new bytes(maxlength);
        uint i = 0; 
        while (v != 0) { 
            uint remainder = v % 10; 
            v = v / 10; 
            reversed[i % maxlength] = byte(48 + remainder); 
            i++;
        } 
        bytes memory s = new bytes(i + 1); 
        for (uint j = 1; j <= i % maxlength; j++) { 
            s[j-1] = reversed[i - j];
        } 
        return bytes(s);
    }
    
   /**
    * @dev Convert string to unsigned int
    * @param b is a bytes to convert.
    * @return integer.
    */
    function strToInt(bytes b) pure public returns (int result) {
        uint i = 0;
        uint tr = 0;
        result = 0;
        bool sign = false;
        if(b[i] == "-") {
            sign = true;
            i++;
        } else if(b[i] == "+") {
            i++;
        }
        while(uint(b[b.length - tr - 1]) == 0x00) {
            tr++;
        }
        for (;i < b.length - tr; i++) { 
            uint c = uint(b[i]); 
            if (c >= 48 && c <= 57) { 
                result *= 10;
                result = result + int(c - 48);
            }
        }
        if(sign) {
            result *= -1;
        } 
    }
    
    /**
     * @dev Converts integer to string 
     * @param v is integer to convert.
     * @return string.
     */
    function intToStr(int v) pure public returns (bytes) {
        uint maxlength = 100; 
        bytes memory reversed = new bytes(maxlength);
        uint i = 0;
        uint x;
        if(v < 0)
            x = uint(-v);
        else
            x = uint(v);
        while (x != 0) { 
            uint remainder = uint(x % 10); 
            x = x / 10; 
            reversed[i % maxlength] = byte(48 + remainder); 
            i++;
        }
        if(v < 0)
            reversed[(i++) % maxlength] = "-";
        bytes memory s = new bytes(i+1); 
        for (uint j = 1; j <= i % maxlength; j++) { 
            s[j - 1] = reversed[i - j];
        } 
        return bytes(s); 
    }
}
