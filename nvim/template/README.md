### left shift (1<<3)
This is generally the fastest because it's a fundamental bit-wise operation directly 
supported by hardware, taking constant time (O(1)) regardless of the input value.
### Fast power (fast_power(a, b))
This is also efficient with a time complexity of O(log b). 
It iterates through the bits of the exponent, performing multiplications only when necessary.
### Built-in exponentiation (2 ** 3)
While often optimized, it might have some overhead for error handling or edge cases, leading to a time complexity of O(log b) in most cases.

---
#### overall
the best time is the left shift
the best memory is the fast power
