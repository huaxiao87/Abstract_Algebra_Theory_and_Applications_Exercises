︠0d9eb6fd-030c-447b-92e6-d1508e9fac19︠
# 1. Build every subgroup of the alternating group on 5 symbols, A5, and check that each is not a normal subgroup (except for the two trivial cases). This command might take a couple seconds to run. Compare this with the time needed to run the .is_simple() method and realize that there is a significant amount of theory and cleverness brought to bear in speeding up commands like this. (It is possible that your Sage installation lacks GAP's “Table of Marks” library and you will be unable to compute the list of subgroups.)
G = AlternatingGroup(5)
subs = G.subgroups()
all([not sub.is_normal(G) for sub in subs if sub.order() != 1 and sub.order()!= G.order()])
G.is_simple()
︡fe30d9f4-7e23-4872-aec5-ddc145767f2c︡{"stdout":"True\n"}︡{"stdout":"True\n"}︡{"done":true}
︠4cc5d7f2-35dd-4ae0-ae81-0e4e8978e1d5︠
# 2. Consider the quotient group of the group of symmetries of an 8-gon, formed with the cyclic subgroup of order 4 generated by a quarter-turn. Use the coset_product function to determine the Cayley table for this quotient group. Use the number of each coset, as produced by the .cosets() method as names for the elements of the quotient group. You will need to build the table “by hand” as there is no easy way to have Sage's Cayley table command do this one for you. You can build a table in the Sage Notebook pop-up editor (shift-click on a blue line) or you might read the documentation of the html.table() method.
def coset_product(i, j, C):
   p = C[i][0]*C[j][0]
   c = [k for k in srange(len(C)) if p in C[k]]
   return c[0]

G = DihedralGroup(8)
sub = G.subgroup(["(1,3,5,7)(2,4,6,8)"])
C = G.cosets(sub)

# Print the Cayley table
row0 = [" "]
rows = []
for i in range(len(C)):
    row0.append(str(i))
rows.append(row0)
for i in range(len(C)):
    row = [str(i)]
    for j in range(len(C)):
        row.append(coset_product(i,j,C))
    rows.append(row)
table(rows,header_column=True,header_row=true)

︡75f641fc-7e0f-495d-bb00-14209522a679︡{"stdout":"    | 0   1   2   3\n+---+---+---+---+---+\n  0 | 0   1   2   3\n  1 | 1   0   3   2\n  2 | 2   3   0   1\n  3 | 3   2   1   0\n"}︡{"done":true}
︠345c318f-80e7-4b02-9bfc-7405c8e1b0cd︠
# 3. Consider the cyclic subgroup of order 4 in the symmetries of an 8-gon. Verify that the subgroup is normal by first building the raw left and right cosets (without using the .cosets() method) and then checking their equality in Sage, all with a single command that employs sorting with the sorted() command.
G = DihedralGroup(8)
N = [g for g in G.subgroups() if g.order() == 4][0]

# Build the raw left coset
def generate_cosets(parent_group, subgroup, left):
    cosets = []
    for g in G:
        coset = []
        for s in sub:
            element = g*s if left else s*g
            if len(coset) < len(sub) and element not in coset:
                found = False
                for c in cosets:
                    if element in c:
                        found = true
                        break
                if not found:
                    coset.append(element)
        if len(coset):
            cosets.append(sorted(coset))
    return cosets

left_cosets = sorted(generate_cosets(G,N,True))
right_cosets = sorted(generate_cosets(G,N,False))
left_cosets == right_cosets
print("Left cosets: ", left_cosets)
print("Right cosets: ", right_cosets)

︡a9f52e2b-155d-4677-9f39-386d6d64b6d3︡{"stdout":"True\n"}︡{"stdout":"Left cosets:  [[(), (1,3,5,7)(2,4,6,8), (1,5)(2,6)(3,7)(4,8), (1,7,5,3)(2,8,6,4)], [(2,8)(3,7)(4,6), (1,3)(4,8)(5,7), (1,5)(2,4)(6,8), (1,7)(2,6)(3,5)], [(1,2)(3,8)(4,7)(5,6), (1,4)(2,3)(5,8)(6,7), (1,6)(2,5)(3,4)(7,8), (1,8)(2,7)(3,6)(4,5)], [(1,2,3,4,5,6,7,8), (1,4,7,2,5,8,3,6), (1,6,3,8,5,2,7,4), (1,8,7,6,5,4,3,2)]]\n"}︡{"stdout":"Right cosets:  [[(), (1,3,5,7)(2,4,6,8), (1,5)(2,6)(3,7)(4,8), (1,7,5,3)(2,8,6,4)], [(2,8)(3,7)(4,6), (1,3)(4,8)(5,7), (1,5)(2,4)(6,8), (1,7)(2,6)(3,5)], [(1,2)(3,8)(4,7)(5,6), (1,4)(2,3)(5,8)(6,7), (1,6)(2,5)(3,4)(7,8), (1,8)(2,7)(3,6)(4,5)], [(1,2,3,4,5,6,7,8), (1,4,7,2,5,8,3,6), (1,6,3,8,5,2,7,4), (1,8,7,6,5,4,3,2)]]\n"}︡{"done":true}
︠cd60a6d6-da03-43e6-824c-0979483beae6︠
# 4. Again, use the same cyclic subgroup of order 4 in the group of symmetries of an 8-gon. Check that the subgroup is normal by using part (2) of Theorem 10.3. Construct a one-line command that does the complete check and returns True. Maybe sort the elements of the subgroup S first, then slowly build up the necessary lists, commands, and conditions in steps. Notice that this check does not require ever building the cosets.
G = DihedralGroup(8)
N = [g for g in G.subgroups() if g.order() == 4][0]
all([g*n*g.inverse() for g in G for n in N])
︡5ce087b2-2cf1-4360-bb7e-262c88b1ee02︡{"stdout":"True\n"}︡{"done":true}
︠b1a533c4-1a8b-443c-8214-07680bd41c79︠
# 5. Repeat the demonstration from the previous subsection that for the symmetries of a tetrahedron, a cyclic subgroup of order 3 results in an undefined coset multiplication. Above, the default setting for the .cosets() method builds right cosets — but in this problem, work instead with left cosets. You need to choose two cosets to multiply, and then demonstrate two choices for representatives that lead to different results for the product of the cosets.
def coset_product_modified(i, j, k, C):
   p = C[i][k]*C[j][k]
   c = [l for l in srange(len(C)) if p in C[l]]
   return c[0]

G = AlternatingGroup(4)
face_turn = G("(1,2,3)")
S = G.subgroup([face_turn])
C = G.cosets(S,"left")
for i in srange(len(C)):
    for j in srange(len(C)):
        c = coset_product_modified(i,j,0,C)
        for k in srange(1,len(C[0])):
            if c != coset_product_modified(i,j,k,C):
                print("Mismatch: ", c, coset_product_modified(i,j,k,C))

︡72a67baa-f2d6-47cd-8bc3-323c420d46dc︡{"stdout":"Mismatch:  1 2\nMismatch:  1 3\nMismatch:  2 3\nMismatch:  2 1\nMismatch:  3 1\nMismatch:  3 2\nMismatch:  2 0\nMismatch:  2 3\nMismatch:  0 3\nMismatch:  0 2\nMismatch:  3 2\nMismatch:  3 0\nMismatch:  0 1\nMismatch:  0 3\nMismatch:  1 3\nMismatch:  1 0\nMismatch:  3 0\nMismatch:  3 1\nMismatch:  1 0\nMismatch:  1 2\nMismatch:  0 2\nMismatch:  0 1\nMismatch:  2 1\nMismatch:  2 0\n"}︡{"done":true}
︠086888be-9bc8-44ef-a73b-09e195927b79s︠
# 6. Construct some dihedral groups of order 2n (i.e. symmetries of an n-gon, Dn in the text, DihedralGroup(n) in Sage). Maybe all of them for 3≤n≤100. For each dihedral group, construct a list of the orders of each of the normal subgroups (so use .normal_subgroups()). You may need to wait ten or twenty seconds for this to finish - be patient. Observe enough examples to hypothesize a pattern to your observations, check your hypothesis against each of your examples and then state your hypothesis clearly.

# Can you predict how many normal subgroups there are in the dihedral group D470448 without using Sage to build all the normal subgroups? Can you describe all of the normal subgroups of a dihedral group in a way that would let us predict all of the normal subgroups of D470448 without using Sage?

print("Number of normal subgoups of Dihedral group D470448 is", len(divisors(470448)) + 3)

for i in srange(3,101):
    print("\nn =",i)
    Di = DihedralGroup(i)
    normal_subgroups = Di.normal_subgroups()
    orders = sorted([g.order() for g in normal_subgroups])
    sorted_normal_subgroups = []


    # Build the order list
    divisors_i = divisors(i)
    orders_predicted = divisors_i
    if i % 2 == 0:
        orders_predicted.append(i)
        orders_predicted.append(i)
    orders_predicted.append(i*2)

    # Start to build the normal subgroups
    normal_subgroups_predicted = [Di.list()]

    gens = Di.gens()

    # Get the rotation and reflection
    R = gens[0]
    S = gens[1]

    # Create the normal subgroups of order that divides i
    for order in divisors(i):
        step = Integer(i/order)
        subgroup = Di.subgroup([R^step]).list()
        normal_subgroups_predicted.append(subgroup)

    # If N is even
    if i % 2 == 0:
        # Subgroup generated by R^2 and a reflection over a line through vertices
        normal_subgroups_predicted.append(Di.subgroup([R^2, R*S]))

        # Subgroup generated by R^2 and a reflection over a line through edges
        normal_subgroups_predicted.append(Di.subgroup([R^2, S]))

    # Compare the subgroups predicted and those generated by SAGE
    for g in normal_subgroups:
        sorted_normal_subgroups.append(sorted(g.list()))
    sorted_normal_subgroups = sorted(sorted_normal_subgroups)

    sorted_predicted_normal_subgroups = []
    for g in normal_subgroups_predicted:
        sorted_predicted_normal_subgroups.append(sorted(g))
    sorted_predicted_normal_subgroups = sorted(sorted_predicted_normal_subgroups)

    print("Correctly predicted?", sorted_normal_subgroups == sorted_predicted_normal_subgroups)

# any normal subgroup of a dihedral group of order 2N can be exactly described as follows:
# 1. If f divides N, then there must be a subgroup that is a cyclic group generated by the rotation (1,2,...,N)^(N/f)
# 2. Trivially, the dihedral group is its own normal subgroup
# 3. If N is even, then, in addition to the normal subgroups in #1 and #2, it also has:
#     a. a normal subgroup generated by (1,2,…,N)^2 and a reflection over a line through vertices
#     b. a normal subgroup generated by (1,2,…,N)^2 and a reflection over a line through edges

︡4df59fb1-e92e-4bbc-ac18-08e3a5088dfa︡{"stdout":"Number of normal subgoups of Dihedral group D470448 is 93\n"}︡{"stdout":"\nn = 3\nCorrectly predicted? True\n\nn = 4\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 5\nCorrectly predicted? True\n\nn = 6\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 7\nCorrectly predicted? True\n\nn = 8\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 9\nCorrectly predicted? True\n\nn = 10\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 11\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 12\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 13\nCorrectly predicted? True\n\nn = 14\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 15\nCorrectly predicted? True\n\nn = 16\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 17\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 18\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 19\nCorrectly predicted? True\n\nn = 20\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 21\nCorrectly predicted? True\n\nn = 22\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 23\nCorrectly predicted? True\n\nn = 24\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 25\nCorrectly predicted? True\n\nn = 26\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 27\nCorrectly predicted? True\n\nn = 28\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 29\nCorrectly predicted? True\n\nn = 30\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 31\nCorrectly predicted? True\n\nn = 32\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 33\nCorrectly predicted? True\n\nn = 34\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 35\nCorrectly predicted? True\n\nn = 36\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 37\nCorrectly predicted? True\n\nn = 38\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 39\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 40\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 41\nCorrectly predicted? True\n\nn = 42\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 43\nCorrectly predicted? True\n\nn = 44\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 45\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 46\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 47\nCorrectly predicted? True\n\nn = 48\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 49\nCorrectly predicted? True\n\nn = 50\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 51\nCorrectly predicted? True\n\nn = 52\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 53\nCorrectly predicted? True\n\nn = 54\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 55\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 56\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 57\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 58\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 59\nCorrectly predicted? True\n\nn = 60\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 61\nCorrectly predicted? True\n\nn = 62\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 63\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 64\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 65\nCorrectly predicted? True\n\nn = 66\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 67\nCorrectly predicted? True\n\nn = 68\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 69\nCorrectly predicted? True\n\nn = 70\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 71\nCorrectly predicted? True\n\nn = 72\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 73\nCorrectly predicted? True\n\nn = 74\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 75\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 76\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 77\nCorrectly predicted? True\n\nn = 78\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 79\nCorrectly predicted? True\n\nn = 80\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 81\nCorrectly predicted? True\n\nn = 82\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 83\nCorrectly predicted? True\n\nn = 84\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 85\nCorrectly predicted? True\n\nn = 86\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 87\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 88\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 89\nCorrectly predicted? True\n\nn = 90\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 91\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 92\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 93\nCorrectly predicted? True\n\nn = 94\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 95\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 96\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 97\nCorrectly predicted? True\n\nn = 98\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 99\nCorrectly predicted?"}︡{"stdout":" True\n\nn = 100\nCorrectly predicted?"}︡{"stdout":" True\n"}︡{"done":true}
︠f6f0f300-e07a-4de5-b12a-428d62459624︠









