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


contract Math{
   // Computes the square root of x
   function sqrt(uint x) constant returns (uint){
       uint n = x / 2.0;
       uint lstX = 0.0;
       while (n != lstX){
           lstX = n;
           n = (n + x/n) / 2; 
       }
       return uint(n);
   }
	
    // Computes the modular exponential (x ** k) % m
   function mexp(uint x, uint k, uint m) returns (uint r) {
       r = 1;
       for (uint s = 1; s <= k; s *= 2) {
           if (k & s != 0) r = mulmod(r, x, m);
            x = mulmod(x, x, m);
       }
    }
}
