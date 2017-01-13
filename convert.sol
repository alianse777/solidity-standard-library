pragma solidity ^0.4.0;

/*
#    Copyright (C) 2017  alainse777

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


contract Converter{
    function toString(uint v) constant returns (string str) {
        uint maxlength = 100; 
        bytes memory reversed = new bytes(maxlength);
        uint i = 0; 
        while (v != 0) { 
            uint remainder = v % 10; v = v / 10; 
            reversed[i++] = byte(48 + remainder); 
        } 
        bytes memory s = new bytes(i + 1); 
        for (uint j = 0; j <= i; j++) { 
            s[j] = reversed[i - j];
        } 
        str = string(s); 
    }

    function toInt(string s) constant returns (uint result) {
        bytes memory b = bytes(s);
        uint i; result = 0;
        for (i = 0; i < b.length; i++) { 
            uint c = uint(b[i]); 
            if (c >= 48 && c <= 57) { 
                result = result * 10 + (c - 48); 
            }
        } 
    }
}
