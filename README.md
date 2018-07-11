# Quick overview of the library

### Array.sol

Storage array wrapper.

UintArray contract members:
* `UintArray(uint[] data)` - construct new array contract
* `min()` - returns minimal array element
* `max()` - returns maximal array element
* `sum()` - returns sum of all array elements
* `set(uint[] arr)` - assign array
* `get()` - returns stored array
* `sort()` - sorts all array elements

IntArray contract members:
* `IntArray(int[] data)` - construct new array contract
* `min()` - returns minimal array element
* `max()` - returns maximal array element
* `sum()` - returns sum of all array elements
* `set(int[] arr)` - assign array
* `get()` - returns stored array
* `sort()` - sorts all array elements

### Convert.sol

Helper contract to convert strings or ints/uints.

Converter contract members:
* `toString(uint x)` - converts uint to string
* `toUint(string str)` - converts string to uint


### Math.sol

Basic mathematical functions.

Math contract members:
* `sqrt(uint x)` - computes square root of x
* `mexp(uint x, uint k, uint m)` - computes (pow(x, k)) mod m


### Memory.sol

WARNING: These functions are used to perform low-level memory access
and may cause security risk when used improperly.

STDMemory contract members:
* `m_ref_uint(uint[] arr)` - returns address of arr
* `m_unref_uint(uint ptr)` - returns array pointed by ptr
* `m_ref_int(int[] arr)` - returns address of arr
* `m_unref_int(uint ptr)` - returns array pointed by ptr


### Multiprecision.sol

Floating point calculations.
Note:
double_t(1, 5) will be 1.05
but
double_t(1, 50) will be 1.5
with dscale = 2 (Number of digits after dot)

Example:

       import "multiprecision.sol";
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
               
               dscale = 3; // change precision (.00 -> .000)
               double_t(1, 5); // now 1.005
               double_t(1, 50); // now 1.050
               double_t(1, 500); // now 1.500
           }
      }


Double contract members:
* `struct double` - signed double representation
* `double_t(int integral, uint fractional)` - creates a new double as integral.fractional
* `double_add(double a, double b)` - a + b
* `double_sub(double a, double b)` - a - b
* `double_mult(double a, double b)` - a×b
* `double_div(double a, double b)` - a / b
* `double_lt(double a, double b)` - a < b
* `double_le(double a, double b)` - a <= b
* `double_eq(double a, double b)` - a == b
* `double_ge(double a, double b)` - a >= b
* `double_gt(double a, double b)` - a > b


### Random.sol

Random number generator based on SHA3 function (not cryptographicaly secure)

Random contract members
* `rand(uint seed)` - returns random unsigned int generated wuth seed
* `randint()` - returns random unsigned int
* `randbytes(uint size, uint seed)` - returns array of random bytes
