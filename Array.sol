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

/* Array wraper
min() - returns minimal array element
max() - returns maximal array element
sum() - returns sum of all array elements
set(uint []) - set array
get() - returns stored array
sort() - sorts all array elements
*/


//Uint Array


contract UintArray{
    uint [] private data;
    function UintArray(uint [] _data){
        data = _data;
    }

    function min() constant returns (uint){
        uint minimal = data[0];
        for(uint i;i < data.length;i++){
            if(data[i] < minimal){
                minimal = data[i];
            }
        }
        return minimal;
    }

    function max() constant returns (uint){
        uint maximal = data[0];
        for(uint i;i < data.length;i++){
            if(data[i] > maximal){
                maximal = data[i];
            }
        }
        return maximal;
    }

    function sum() constant returns (uint){
        uint S;
        for(uint i;i < data.length;i++){
            S += data[i];
        }
        return S;
    }

    function set(uint [] _data){
        data = _data;
    }

    function get() constant returns (uint []){
        return data;
    }

    function quickSort(uint l, uint r) private{
        uint x = data[l + (r - l)/2];
        uint i = l;
        uint j = r;
        while (i <= j){
            while (data[i] < x) i++;
            while (data[j] > x) j--;
            if(i <= j){
                uint var1 = data[i];
                data[i] = data[j];
                data[j] = var1;
                i++;
                j--;
            }
        }
        if(i < r) quickSort(i, r);
        if(l < j) quickSort(l, j);
    }

    function sort(){
        quickSort(0, data.length - 1);
    }
}


// Int Array


contract IntArray{
    int [] private data;
    function IntArray(int [] _data){
        data = _data;
    }

    function min() constant returns (int){
        int minimal = data[0];
        for(uint i;i < data.length;i++){
            if(data[i] < minimal){
                minimal = data[i];
            }
        }
        return minimal;
    }

    function max() constant returns (int){
        int maximal = data[0];
        for(uint i;i < data.length;i++){
            if(data[i] > maximal){
                maximal = data[i];
            }
        }
        return maximal;
    }

    function sum() constant returns (int){
        int S;
        for(uint i;i < data.length;i++){
            S += data[i];
        }
        return S;
    }

    function set(int [] _data){
        data = _data;
    }

    function get() constant returns (int []){
        return data;
    }

    function quickSort(uint l, uint r) private{
        int x = data[l + (r - l)/2];
        uint i = l;
        uint j = r;
        while (i <= j){
            while (data[i] < x) i++;
            while (data[j] > x) j--;
            if(i <= j){
                int var1 = data[i];
                data[i] = data[j];
                data[j] = var1;
                i++;
                j--;
            }
        }
        if(i < r) quickSort(i, r);
        if(l < j) quickSort(l, j);
    }

    function sort(){
        quickSort(0, data.length - 1);
    }
}
