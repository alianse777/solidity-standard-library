pragma solidity ^0.4.0;

/*
    Note:
    double_t(1, 5) will be 1.05
    but
    double_t(1, 50) will be 1.5
    
    example:
       contract Test is Double
       {
           function test() internal
           {
               double memory a = double_t(1, 20); // 1.20
               double memory b = double_t(0, 2); // 0.02
               double memory result = double_add(a, b); // 1.22
               
               a = double_t(2, 0); // 2.00
               b = double_t(1, 0); // 1.00
               a.sign = true; // -2.00
               result = double_add(a, b); // -2.00 + 1.00 = -1.00
               
               result = double_sub(a, b); // -2.00 - 1.00 = -3.00
               result = double_mult(a, b); // -2.00 * 1.00 = -2.00
               result = double_div(a, b); // -2.00 / 1.00 = -2.00
               
               dscale = 3; // now 'a' is -2.000 and 'b' is 1.000
               double_t(1, 5); // now 1.005
               double_t(1, 50); // now 1.050
               double_t(1, 500); // now 1.500
           }
       }
*/

contract Double
{
    uint dscale = 2;  // precision
    uint dot = 10**dscale;
    struct double {uint part; uint f; bool sign;}

    // this function creates new double instanse as (part).(f);
    function double_t(int part, uint f) internal returns (double data)
    {
        data.part = uint(part);
        data.f = f;
    }

    function convert(double data) internal returns (uint r)
    {
        r = data.part*dot + data.f;
    }

    function normalize(uint num, uint s, bool sign) internal returns (double data)
    {
        uint d = 10**s;
        uint part = num / d;
        uint f = num % d;
        if (f % dot == 0)
        {
            f /= dot;
        }
        data.part = part;
        data.f = f;
        data.sign = sign;
    }

    // built-in ^ operator does not support bools.
    function xor(bool a, bool b) internal returns (bool)
    {
        if(a && b) return false;
        if(a || b) return true;
        return false;
    }

    /*
    // add, sub, mult, div
    */

    function double_add(double lhs, double rhs) internal returns (double)
    {
        uint l = convert(lhs);
        uint r = convert(rhs);
        if (lhs.sign == rhs.sign)
        {
            return normalize(l + r, 2, rhs.sign);
        }
        else
        {
            if (l > r)
            {
                return normalize(l - r, 2, lhs.sign);
            }
            else
            {
                return normalize(r - l, 2, rhs.sign);
            }
        }
    }

    function double_sub(double lhs, double rhs) internal returns (double)
    {
        uint l = convert(lhs);
        uint r = convert(rhs);
        if (l > r)
        {
            if (lhs.sign != rhs.sign)
            {
                return normalize(l + r, 2, lhs.sign);
            }
            else
            {
                return normalize(l - r, 2, lhs.sign);
            }
        }
        else if(l < r)
        {
            if (rhs.sign != lhs.sign)
            {
                return normalize(l + r, 2, !lhs.sign);
            }
            else
            {
                return normalize(r - l, 2, !lhs.sign);
            }
        }
        else
        {
            double memory data;
            data.part = 0;
            data.f = 0;
            data.sign = false;
            return data;
        }
    }

    function double_mult(double lhs, double rhs) internal returns (double)
    {
        uint l = convert(lhs);
        uint r = convert(rhs);
        return normalize(l*r, 4, xor(lhs.sign, rhs.sign));
    }

    function double_div(double lhs, double rhs) internal returns (double)
    {
        uint l = convert(lhs);
        uint r = convert(rhs);
        return normalize(l*(10**dscale) / r, 2, xor(lhs.sign, rhs.sign));
    }


    /*
    //  Equality
    */

    function double_lt(double lhs, double rhs) internal returns (bool)
    {
        if(lhs.sign && !rhs.sign)
        {
            return true;
        }
        else if(!lhs.sign && rhs.sign)
        {
            return false;
        }
        if(lhs.part == rhs.part)
        {
            return lhs.f < rhs.f;
        }
        return lhs.part < rhs.part;
    }

    function double_le(double lhs, double rhs) internal returns (bool)
    {
        return (double_lt(lhs, rhs) || double_eq(lhs, rhs));
    }

    function double_eq(double lhs, double rhs) internal returns (bool)
    {
        return (lhs.part == rhs.part && lhs.f == rhs.f && rhs.sign == lhs.sign);
    }

    function double_ge(double lhs, double rhs) internal returns (bool)
    {
        return (double_eq(lhs, rhs) || double_gt(lhs, rhs));

    }

    function double_gt(double lhs, double rhs) internal returns (bool)
    {
        if(lhs.sign && !rhs.sign)
        {
            return false;
        }
        else if(!lhs.sign && rhs.sign)
        {
            return true;
        }
        if(lhs.part == rhs.part)
        {
            return lhs.f > rhs.f;
        }
        return lhs.part > rhs.part;

    }

    /*
    // Conversation API
    */

    function double_from_array(int [] data) internal returns (double [])
    {
        uint r_index = 0;
        double [] memory result = new double[](data.length / 2);
        for(uint i = 0;i < data.length-1;i+= 2)
        {
            result[r_index].part = uint(data[i]);
            result[r_index].f = uint(data[i+1]);
            r_index ++;
        }
        return result;
    }

    function double_to_array(double [] data) internal returns (int [])
    {
        uint index = 0;
        int [] memory result = new int [](data.length * 2);
        for(uint i = 0;i < data.length;i++)
        {
            result[index] = int(data[i].part);
            result[index+1] = int(data[i].f);
            index += 2;
        }
        return result;
    }

    function reshape_int(int [2] data) internal returns (double [])
    {
        double [] memory res = new double[](data.length);
        for(uint i;i < data.length;i++)
        {
            res[i] = double_t(data[i], 0);
        }
        return res;
    }
}
