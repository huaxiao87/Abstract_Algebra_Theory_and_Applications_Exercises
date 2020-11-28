︠daceff24-0198-49f3-a8d9-dc66f9c66b73s︠
# 1.  Create the full symmetric group S10 with the command G = SymmetricGroup(10).
G = SymmetricGroup(10); G


︡d77df508-2061-47ad-b932-a0841ae114b8︡{"stdout":"Symmetric group of order 10! as a permutation group\n"}︡{"done":true}
︠458b175d-d7b0-4378-bcfe-ba25378f5599s︠
# 2. Create elements of G with the following (varying) syntax. Pay attention to commas, quotes, brackets, parentheses. The first two use a string (characters) as input, mimicking the way we write permuations (but with commas). The second two use a list of tuples.
a = G("(5,7,2,9,3,1,8)")

b = G("(1,3)(4,5)")

c = G([(1,2),(3,4)])

d = G([(1,3),(2,5,8),(4,6,7,9,10)])


︡e2954fae-f31f-4f2f-9eac-843d5fed87b5︡{"done":true}
︠3925b5c7-878f-4ebf-a11a-35da0cef9013s︠
# 2.a Compute a3,bc, ad−1b
a^3
b*c
a*d^-1*b
︡ea888f8e-2589-403d-aba6-aaee25a3946d︡{"stdout":"(1,7,3,5,9,8,2)\n"}︡{"stdout":"(1,4,5,3,2)\n"}︡{"stdout":"(1,4,10,9,3)(2,7,8)(5,6)\n"}︡{"done":true}
︠34499d9c-9485-442d-8423-fbf229c56bfas︠
# 2.b Compute the orders of each of these four individual elements (a through d) using a single permutation group element method.
a.order()
b.order()
c.order()
d.order()
︡49c22cf2-78ba-42f3-aed0-0ff16dd44a2f︡{"stdout":"7\n"}︡{"stdout":"2\n"}︡{"stdout":"2\n"}︡{"stdout":"30\n"}︡{"done":true}
︠5ba8150b-cfb9-45e5-9797-a57a57e9499ds︠
# 2.c Use the permutation group element method .sign() to determine if a,b,c,d are even or odd permutations.
a.sign()
b.sign()
c.sign()
d.sign()
︡493a2cf4-e4fe-4bd4-be04-f627a8888321︡{"stdout":"1\n"}︡{"stdout":"1\n"}︡{"stdout":"1\n"}︡{"stdout":"-1\n"}︡{"done":true}
︠b6138c2f-40fd-42d4-b53d-c0443c162b62s︠
# 2.d Create two cyclic subgroups of G with the commands:
H = G.subgroup([a]);H
K = G.subgroup([d]);K
︡3d102593-90ba-4c6d-a1cf-522954fc24e6︡{"stdout":"Subgroup generated by [(1,8,5,7,2,9,3)] of (Symmetric group of order 10! as a permutation group)\n"}︡{"stdout":"Subgroup generated by [(1,3)(2,5,8)(4,6,7,9,10)] of (Symmetric group of order 10! as a permutation group)\n"}︡{"done":true}
︠3147aecd-74cf-4053-abfc-b190a9a1123as︠
# 2.d (continued) List, and study, the elements of each subgroup. Without using Sage, list the order of each subgroup of K. Then use Sage to construct a subgroup of K with order 10.
H.list()
K.list()
︡35628b7e-3f2b-43a5-b8d2-4141af9abdaf︡{"stdout":"[(), (1,8,5,7,2,9,3), (1,5,2,3,8,7,9), (1,7,3,5,9,8,2), (1,2,8,9,5,3,7), (1,9,7,8,3,2,5), (1,3,9,2,7,5,8)]\n"}︡{"stdout":"[(), (1,3)(2,5,8)(4,6,7,9,10), (2,8,5)(4,7,10,6,9), (1,3)(4,9,6,10,7), (2,5,8)(4,10,9,7,6), (1,3)(2,8,5), (4,6,7,9,10), (1,3)(2,5,8)(4,7,10,6,9), (2,8,5)(4,9,6,10,7), (1,3)(4,10,9,7,6), (2,5,8), (1,3)(2,8,5)(4,6,7,9,10), (4,7,10,6,9), (1,3)(2,5,8)(4,9,6,10,7), (2,8,5)(4,10,9,7,6), (1,3), (2,5,8)(4,6,7,9,10), (1,3)(2,8,5)(4,7,10,6,9), (4,9,6,10,7), (1,3)(2,5,8)(4,10,9,7,6), (2,8,5), (1,3)(4,6,7,9,10), (2,5,8)(4,7,10,6,9), (1,3)(2,8,5)(4,9,6,10,7), (4,10,9,7,6), (1,3)(2,5,8), (2,8,5)(4,6,7,9,10), (1,3)(4,7,10,6,9), (2,5,8)(4,9,6,10,7), (1,3)(2,8,5)(4,10,9,7,6)]\n"}︡{"done":true}
︠d89ae14f-6928-4bb7-b243-39deb0fb0d5as︠
# 2.e More complicated subgroups can be formed by using two or more generators. Construct a subgroup L of G with the command L = G.subgroup([b,c]). Compute the order of L and list all of the elements of L.
L = G.subgroup([b,c])
L.order()
L.list()
︡7d24eee9-5db1-42b6-ac61-10bf3b9897ff︡{"stdout":"10\n"}︡{"stdout":"[(), (1,4,5,3,2), (1,5,2,4,3), (1,3,4,2,5), (1,2,3,5,4), (2,4)(3,5), (1,4)(2,5), (1,5)(2,3), (1,3)(4,5), (1,2)(3,4)]\n"}︡{"done":true}
︠0bf1012b-86d4-46f0-ab35-6beebcf9060bs︠
# 3. Construct the group of symmetries of the tetrahedron (also the alternating group on 4 symbols, A4) with the command A=AlternatingGroup(4). Using tools such as orders of elements, and generators of subgroups, see if you can find all of the subgroups of A4 (each one exactly once). Do this without using the .subgroups() method to justify the correctness of your answer (though it might be a convenient way to check your work).

# Provide a nice summary as your answer—not just piles of output. So use Sage as a tool, as needed, but basically your answer will be a concise paragraph and/or table. This is the one part of this assignment without clear, precise directions, so spend some time on this portion to get it right. Hint: no subgroup of A4 requires more than two generators.
A = AlternatingGroup(4)
A.list()
A.order()
subs = A.subgroups()
len(subs)
for g in subs:
    g.list()

print()

# generate s by a single generator
for e in A.list():
    sub_A = A.subgroup([e])
    print( sub_A.order(),sub_A.list())
︡e3c1ca23-9e2e-42db-bc86-c8c2002c2af6︡{"stdout":"[(), (1,3)(2,4), (1,2)(3,4), (1,4)(2,3), (2,4,3), (1,3,4), (1,2,3), (1,4,2), (2,3,4), (1,3,2), (1,2,4), (1,4,3)]\n"}︡{"stdout":"12\n"}︡{"stdout":"10\n"}︡{"stdout":"[()]\n[(), (1,2)(3,4)]\n[(), (1,3)(2,4)]\n[(), (1,4)(2,3)]\n[(), (2,4,3), (2,3,4)]\n[(), (1,2,3), (1,3,2)]\n[(), (1,4,2), (1,2,4)]\n[(), (1,3,4), (1,4,3)]\n[(), (1,2)(3,4), (1,3)(2,4), (1,4)(2,3)]\n[(), (1,4)(2,3), (1,3)(2,4), (1,2)(3,4), (2,3,4), (1,4,3), (1,3,2), (1,2,4), (2,4,3), (1,4,2), (1,3,4), (1,2,3)]\n"}︡{"stdout":"\n"}︡{"stdout":"1 [()]\n2 [(), (1,3)(2,4)]\n2 [(), (1,2)(3,4)]\n2 [(), (1,4)(2,3)]\n3 [(), (2,4,3), (2,3,4)]\n3 [(), (1,3,4), (1,4,3)]\n3 [(), (1,2,3), (1,3,2)]\n3 [(), (1,4,2), (1,2,4)]\n3 [(), (2,3,4), (2,4,3)]\n3 [(), (1,3,2), (1,2,3)]\n3 [(), (1,2,4), (1,4,2)]\n3 [(), (1,4,3), (1,3,4)]\n"}︡{"done":true}
︠82524ee6-c93d-43a2-a044-f99162c9ec1ds︠
A.subgroup([A.list()[1]]).list()
︡d5275a65-0c7b-4569-b9b3-cc21efe9ec17︡{"stdout":"[(), (1,3)(2,4)]\n"}︡{"done":true}
︠3eda5df4-18cc-4543-85d0-b76fcbf3919bs︠
# 4. The subsection Motion Group of a Cube describes the 24 symmetries of a cube as a subgroup of the symmetric group S8 generated by three quarter-turns. Answer the following questions about this symmetry group.
# 4.a. From the list of elements of the group, can you locate the ten rotations about axes? (Hint: the identity is easy, the other nine never send any symbol to itself.)
G = SymmetricGroup(8)
above = G("(1,2,3,4)(5,6,7,8)")
front = G("(1,4,8,5)(2,3,7,6)")
right = G("(1,2,6,5)(3,7,8,4)")
cube = G.subgroup([above, front, right])
sub_above = G.subgroup([above])
sub_front = G.subgroup([front])
sub_right = G.subgroup([right])
sub_front.list()
sub_above.list()
sub_right.list()

cube.order()


︡72d4e003-5215-4e95-a014-30ca27bfd698︡{"stdout":"[(), (1,4,8,5)(2,3,7,6), (1,8)(2,7)(3,6)(4,5), (1,5,8,4)(2,6,7,3)]\n"}︡{"stdout":"[(), (1,2,3,4)(5,6,7,8), (1,3)(2,4)(5,7)(6,8), (1,4,3,2)(5,8,7,6)]\n"}︡{"stdout":"[(), (1,2,6,5)(3,7,8,4), (1,6)(2,5)(3,8)(4,7), (1,5,6,2)(3,4,8,7)]\n"}︡{"stdout":"24\n"}︡{"done":true}
︠805ad124-cc10-4ce4-a41b-5294ee407a17s︠
# 4.b. Can you identify the six symmetries that are a transposition of diagonals? (Hint: [g for g in cube if g.order() == 2] is a good preliminary filter.)
[g for g in cube if g.order() == 2]
# symmetries that contains any two of the transpositions is a transposition of diagonals: (17),(28),(35),(46)
︡02856b2d-babf-4067-9bf1-6a489d952e21︡{"stdout":"[(1,3)(2,4)(5,7)(6,8), (1,6)(2,5)(3,8)(4,7), (1,8)(2,7)(3,6)(4,5), (1,5)(2,8)(3,7)(4,6), (1,7)(2,6)(3,5)(4,8), (1,4)(2,8)(3,5)(6,7), (1,7)(2,3)(4,6)(5,8), (1,2)(3,5)(4,6)(7,8), (1,7)(2,8)(3,4)(5,6)]\n"}︡{"done":true}
︠acab193a-053a-4479-bcde-0a7c1c4a4d50s︠
# 4.c. Verify that any two of the quarter-turns (above, front, right) are sufficient to generate the whole group. How do you know each pair generates the entire group?
G.subgroup([above,front]).order()
G.subgroup([above,right]).order()
G.subgroup([right,front]).order()
above*front*above^3
front*above*front^3

right
︡ca4f905a-535c-4739-b2f7-08c8f2830af9︡{"stdout":"24\n"}︡{"stdout":"24\n"}︡{"stdout":"24\n"}︡{"stdout":"(1,2,6,5)(3,7,8,4)\n"}︡{"stdout":"(1,5,6,2)(3,4,8,7)\n"}︡{"stdout":"(1,2,6,5)(3,7,8,4)\n"}︡{"done":true}
︠e682f01c-f3ad-411e-9cec-a75bca1417f9s︠
# 4.d. Can you express one of the diagonal transpositions as a product of quarter-turns? This can be a notoriously difficult problem, especially for software. It is known as the “word problem.”
class ListNode:
    def __init__(self, per=None, parent=None, motion=None):
        self.per = per
        self.parent = parent
        self.motion = motion
last = []
target = cube("(1,7)(2,6)(3,5)(4,8)");
print("Target permutation: ", target, "\n")

id = cube("()")
node = ListNode(target,parent=None,motion=None)
final_node = node

last.append(ListNode(node.per*above^3, node, above))
last.append(ListNode(node.per*front^3, node, front))
last.append(ListNode(node.per*right^3, node, right))
finish = false
while not finish:
    temp = []
    for node in last:
        if node.per == id:
            finish = true
            final_node = node
            break
        temp.append(ListNode(node.per*above.inverse(), node, above))
        temp.append(ListNode(node.per*front.inverse(), node, front))
        temp.append(ListNode(node.per*right.inverse(), node, right))
    last = temp

cur = final_node

while cur.per != target:
    print("Current permutation:", cur.per)
    print("Transition motion:", cur.motion, "\n")
    cur = cur.parent
print(cur.per)
print (cur.motion)




︡edff33b3-5706-4d05-930e-84dae6f0efdc︡{"stdout":"Target permutation:  (1,7)(2,6)(3,5)(4,8) \n\n"}︡{"stdout":"Current permutation: ()\nTransition motion: (1,2,6,5)(3,7,8,4) \n\nCurrent permutation: (1,2,6,5)(3,7,8,4)\nTransition motion: (1,2,6,5)(3,7,8,4) \n\nCurrent permutation: (1,6)(2,5)(3,8)(4,7)\nTransition motion: (1,2,3,4)(5,6,7,8) \n\n"}︡{"stdout":"(1,7)(2,6)(3,5)(4,8)\n"}︡{"stdout":"None\n"}︡{"done":true}
︠e9749a6d-f1ce-4c80-ad2a-cb69e729a680︠
︡abdda659-91cd-473d-a5c8-e90fe83e4bc8︡
︠bdc05ad3-1ebd-4241-b8e5-a7228b5a4b64s︠
# 4.e. Number the six faces of the cube with the numbers 1 through 6 (any way you like). Now consider the same three symmetries we used before (quarter-turns about face-to-face axes), but now view them as permutations of the six faces. In this way, we construct each symmetry as an element of S6. Verify that the subgroup generated by these symmetries is the whole symmetry group of the cube. Again, rather than using three generators, try using just two.
above6 = G("(1,6,3,5)")
right6 = G("(1,2,3,4)")
front6 = G("(2,6,4,5)")

sub6 = G.subgroup([above6,right6])
# sub6 = G.subgroup([above6,front6])
# sub6 = G.subgroup([front6,right6])
sub6.order()
print("Cube labeled by vertices:\n", cube.list())
print()
print("Cube labeled by faces:\n", sub6.list())
︡9144b539-6fb9-4e9a-a480-c1f90f99a1a1︡{"stdout":"24\n"}︡{"stdout":"Cube labeled by vertices:\n [(), (1,3)(2,4)(5,7)(6,8), (1,6)(2,5)(3,8)(4,7), (1,8)(2,7)(3,6)(4,5), (1,4,3,2)(5,8,7,6), (1,2,3,4)(5,6,7,8), (1,5)(2,8)(3,7)(4,6), (1,7)(2,6)(3,5)(4,8), (2,5,4)(3,6,8), (1,3,8)(2,7,5), (1,6,3)(4,5,7), (1,8,6)(2,4,7), (1,4)(2,8)(3,5)(6,7), (1,2,6,5)(3,7,8,4), (1,5,6,2)(3,4,8,7), (1,7)(2,3)(4,6)(5,8), (2,4,5)(3,8,6), (1,3,6)(4,7,5), (1,6,8)(2,7,4), (1,8,3)(2,5,7), (1,4,8,5)(2,3,7,6), (1,2)(3,5)(4,6)(7,8), (1,5,8,4)(2,6,7,3), (1,7)(2,8)(3,4)(5,6)]\n"}︡{"stdout":"\n"}︡{"stdout":"Cube labeled by faces:\n [(), (1,3)(2,4), (1,4,6)(2,5,3), (1,2,6)(3,4,5), (1,6,4)(2,3,5), (1,5,2)(3,6,4), (2,4)(5,6), (1,3)(5,6), (1,4,5)(2,6,3), (1,2,5)(3,4,6), (1,6,2)(3,5,4), (1,5,4)(2,3,6), (2,6,4,5), (1,3)(2,6)(4,5), (1,4,3,2), (1,2)(3,4)(5,6), (1,6)(2,4)(3,5), (1,5)(2,4)(3,6), (2,5,4,6), (1,3)(2,5)(4,6), (1,4)(2,3)(5,6), (1,2,3,4), (1,6,3,5), (1,5,3,6)]\n"}︡{"done":true}
︠7b0322e1-3fd0-401a-9031-660f8dc0e1a7s︠
# 5. Save your work, and then see if you can crash your Sage session by building the subgroup of S10 generated by the elements b and d of orders 2 and 30 from above. Do not submit the list of elements of N as part of your submitted worksheet.
print(b,d)
N = G.subgroup([b,d])
# N.list()
N.order()
︡20347ed8-2333-4704-84f5-a076f646c9d8︡{"stdout":"(1,3)(4,5) (1,3)(2,5,8)(4,6,7,9,10)\n"}︡{"stdout":"80640\n"}︡{"done":true}
︠d6e7ecff-d3d4-48a3-a02c-bcd5534e556es︠
︡c4134415-861a-45fc-b654-08a8dd3a8fef︡{"done":true}
︠a8e2b925-f94d-48fd-9083-b2ac73eb06c9︠








