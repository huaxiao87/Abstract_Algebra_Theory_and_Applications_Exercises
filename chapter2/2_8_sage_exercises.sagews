︠75588e0d-c11f-45d6-83c4-c7267b74f895s︠
#1. Use the next_prime() command to construct two different 8-digit prime numbers and save them in variables named a and b.
a=next_prime(10000000);a
b=next_prime(a);b
︡f4ebc460-0a7c-4494-8aa4-784a727685a0︡{"stdout":"10000019\n"}︡{"stdout":"10000079\n"}︡{"done":true}
︠e9d9d74a-3f18-4ca5-8a41-1fdcbb52d334s︠
#2. Use the .is_prime() method to verify that your primes a and b are really prime.
a.is_prime()
b.is_prime()
︡d2856f17-2524-4881-ad65-20485625a5cb︡{"stdout":"True\n"}︡{"stdout":"True\n"}︡{"done":true}
︠35e3a3a1-24e0-480e-b697-eefd12b0fbf7s︠
#3. Verify that 1 is the greatest common divisor of your two primes from the previous exercises.
gcd(a,b)
︡d94ae3e8-e193-43ff-8c14-11d746b47a20︡{"stdout":"1\n"}︡{"done":true}
︠5d5af72b-1751-4530-a50c-9d35352a926as︠
#4. Find two integers that make a “linear combination” of your two primes equal to 1. Include a verification of your result.
extended = xgcd(a,b)
g = extended[0];g
r = extended[1];r
s = extended[2];s
g == r*a + s*b
︡73733065-b5cf-4eb4-9e72-7a855c9b8c37︡{"stdout":"1\n"}︡{"stdout":"-166668\n"}︡{"stdout":"166667\n"}︡{"stdout":"True\n"}︡{"done":true}
︠1610d13b-447a-4ace-9415-fd58d074bc18s︠
#5. Determine a factorization into powers of primes for c=4598037234.
c = 4598037234;c
c.factor()
︡4c212e28-41b5-401b-92ee-dd8aaab9a588︡{"stdout":"4598037234\n"}︡{"stdout":"2 * 3^2 * 7 * 36492359\n"}︡{"done":true}
︠5c125edb-2337-4957-900c-fed6a2be9342s︠
#6. Write a compute cell that defines the same value of c again, and then defines a candidate divisor of c named d. The third line of the cell should return True if and only if d is a divisor of c. Illustrate the use of your cell by testing your code with d=7 and in a new copy of the cell, testing your code with d=11.
c = 4598037234;c
d = 7
d.divides(c)
︡0f8b956f-0257-48a4-9d44-33bb0be50ee4︡{"stdout":"4598037234\n"}︡{"stdout":"True\n"}︡{"done":true}
︠1dbb986c-0bfa-4bb3-96d3-c16d4a53d658︠
d = 11
d.divides(c)
︡1d535837-dbb8-4a5b-969b-05cf4267225e︡{"stdout":"4598037234\n"}︡{"stdout":"False\n"}︡{"done":true}
︠83615442-8188-4aff-91c7-bab19fbe6d4f︠









