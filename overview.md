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
* `mexp(uint x, uint k, uint m)` - computes (x ** k) % m


### Memory.sol

WARNING: These functions are used to perform low-level memory access
and may cause security risk when used improperly.

STDMemory contract members:
* `m_ref_uint(uint[] arr)` - returns address of arr
* `m_unref_uint(uint ptr)` - returns array pointed by ptr
* `m_ref_int(int[] arr)` - returns address of arr
* `m_unref_int(uint ptr)` - returns array pointed by ptr
