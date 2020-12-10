︠a8d456b2-feb2-4d27-a717-3f5f3f1c8ddds︠
#1. Use .subgroups() to find an example of a group G and an integer m, so that (a) m divides the order of G, and (b) G has no subgroup of order m. (Do not use the group A4 for G, since this is in the text.) Provide a single line of Sage code that has all the logic to produce the desired m as its output. (You can give your group a simple name on a prior line and then just reference the group by name.) Here is a very simple example that might help you structure your answer.

G = SymmetricGroup(5).subgroups()[128]
m = [f for f in [c.order() for c in CyclicPermutationGroup(G.order()).subgroups()] if f not in [s.order() for s in G.subgroups()]]
︡684c9329-62d4-440e-a78f-686ff37ceb90︡{"done":true}
︠f40fe4a6-17f4-4270-94b1-0801d626a73a︠
# 2. Verify the truth of Fermat's Little Theorem (either variant) using the composite number 391=17⋅23 as the choice of the base (either a or b), and for p assuming the value of every prime number between 100 and 1000.

# Build up a solution slowly — make a list of powers (start with just a few primes), then make a list of powers reduced by modular arithmetic, then a list of comparisons with the predicted value, then a check on all these logical values resulting from the comparisons. This is a useful strategy for many similar problems. Eventually you will write a single line that performs the verification by eventually printing out True. Here are some more hints about useful functions.

all([(391^(p-1)).mod(p) == 1 for p in prime_range(100, 1000)])
︡af6c2182-5619-4f0f-b68e-3395d86b725c︡{"stdout":"True\n"}︡{"done":true}
︠a0ba7408-1b39-44b9-988b-b653dd37d76c︠
# 3. Verify that the group of units mod n has order n−1 when n is prime, again for all primes between 100 and 1000. As before, your output should be simply True, just once, indicating that the statement about the order is true for all the primes examined. As before, build up your solution slowly, and with a smaller range of primes in the beginning. Express your answer as a single line of Sage code.

all([euler_phi(n) == n-1 for n in prime_range(100, 1000)])
︡5a5004be-ff71-4ef7-81c6-8984afe35589︡{"stdout":"True\n"}︡{"done":true}
︠b0d17cd1-59e0-4042-8766-844a3c4fd92b︠
# 4. Verify Euler's Theorem for all values of 0<n<100 and for 1≤a<n (the range in the original exercise is incorrect). This will require nested for statements with a conditional. Again, here is a small example that might be helpful for constructing your one line of Sage code. Note the use of srange() in this example.

all([(a^euler_phi(n)).mod(n) == 1 for n in srange(1, 100) for a in srange(1,n) if gcd(n,a) == 1])
︡15e465de-13ec-4a06-9618-44411eeb02d6︡{"stdout":"True\n"}︡{"done":true}
︠3002a5f0-6b3e-435a-80ae-0e1d11b2c01b︠
# 5. The symmetric group on 7 symbols, S7, has 7!=5040 elements. Consider the following questions without employing Sage, based on what we know about orders of elements of permutation groups ().

# a. What is the maximum possible order?
# b. How many elements are there of order 10?
# c. How many elements are there of order 1?
# d. How many elements are there of order 2?
# e. What is the smallest positive integer for which there is no element with that order?

# These questions will be easier if you are familiar with using binomial coefficients for counting in similarly complex situations. But either way, give some serious thought to each question (and maybe a few of your own) before firing up Sage.

# Now, compute how many elements there are of each order using the .order() method, and then embed this into a list comprehension which creates a single list of these counts. You can check your work (or check Sage) by wrapping this list in sum() and hopefully getting 5040. Comment on the process of studying these questions first without any computational aid, and then again with Sage. For which values of n do you think Sage would be too slow and your mind quicker?

order_group = [s.order() for s in SymmetricGroup(7)]

# a. What is the maximum possible order? 3*4 = 12
max(order_group)

# b. How many elements are there of order 10? 7*6/2*(5-1)! = 21*24 = 504
sum([1 for o in order_group if o == 10])

# c. How many elements are there of order 1? 1
sum([1 for o in order_group if o == 1])

# d. How many elements are there of order 2? 7*5*3 + 7*6*5/3/2*3 + 7*6/2 = 231
sum([1 for o in order_group if o == 2])

# e. What is the smallest positive integer for which there is no element with that order? 11
min([i for i in srange(1,max(order_group)) if i not in order_group])

︡5775c1ed-85dc-4dc7-ac80-41eac641f92a︡{"stdout":"12\n"}︡{"stdout":"504\n"}︡{"stdout":"1\n"}︡{"stdout":"231\n"}︡{"stdout":"8\n"}︡{"stdout":"True\n"}︡{"done":true}
︠d416b1a5-0a68-494b-a9c6-a6edce9d2c38︠
︡7514ee1e-c061-4526-a609-cbddf613b3be︡
︠9508e7cf-be3b-41df-93b3-5662fb625c69︠
︡30ae03d0-edaf-4a6e-834f-2457efe62135︡{"done":true}︡










