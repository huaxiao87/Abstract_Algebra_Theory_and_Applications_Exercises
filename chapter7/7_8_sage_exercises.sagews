︠55555c99-8d8d-442d-a945-a5387e274a92s︠
# 1. Construct a keypair for Alice using the first two primes greater than 10*12. For your choice of E, use a single prime number and use the smallest possible choice.

# Output the values of n, E, and D for Alice. Then use Sage commands to verify that Alice's encryption and decryption keys are multiplicative inverses.

p_a = next_prime(10^12)
q_a = next_prime(p_a)
n_a = p_a * q_a
m_a = euler_phi(n_a)
factor(m_a)
E_a = 7
D_a = inverse_mod(E_a, m_a)
print("Alice's public key, n:", n_a, "E:", E_a)
print("Alice's private key, D:", D_a)

(E_a*D_a).mod(m_a)
︡51712e4a-a037-4ca5-97ff-71aca52f5936︡{"stdout":"2^3 * 3 * 5 * 13 * 17 * 29 * 3947 * 12667849 * 26005097\n"}︡{"stdout":"Alice's public key, n: 1000000000100000000002379 E: 7\n"}︡{"stdout":"Alice's private key, D: 142857142871142857143183\n"}︡{"stdout":"1\n"}︡{"done":true}
︠dedeae6b-696c-4ec7-bfd8-0f952f432f75s︠
# 2. Construct a keypair for Bob using the first two primes greater than 2⋅10^12. For your choice of E, use a single prime number and use the smallest possible choice. Output the values of n, E, and D for Bob.

# Encode the word Math using ASCII values in the same manner as described in this section (keep the capitalization as shown). Create a signed message of this word for communication from Alice to Bob. Output the three integers: the message, the signed message and the signed, encrypted message.

p_b = next_prime(2*10^12)
q_b = next_prime(p_b)
n_b = p_b * q_b
m_b = euler_phi(n_b)
factor(m_b)
E_b = 3
D_b = inverse_mod(E_b, m_b)

print("Bob's public key, n:", n_b, "E:", E_b)
print("Bob's private key, D:", D_b)

(E_b*D_b).mod(m_b)

word = 'Math'
digits = [ord(letter) for letter in word]
digits

message = ZZ(digits, 128)
print("Message: ", message)

signed = power_mod(message, D_a, n_a)
print("Signed message: ", signed)

encrypted = power_mod(signed, E_b, n_b)
print("Signed, encrypted message: ", encrypted)
︡50dfc67f-a7fc-423e-a1b2-9edba17d0fa9︡{"stdout":"2^2 * 73 * 137 * 99990001 * 1000000000061\n"}︡{"stdout":"Bob's public key, n: 4000000000252000000000369 E: 3\n"}︡{"stdout":"Bob's private key, D: 2666666666832000000000163\n"}︡{"stdout":"1\n"}︡{"stdout":"[77, 97, 116, 104]\n"}︡{"stdout":"Message:  220016845\n"}︡{"stdout":"Signed message:  306942137117238147353497\n"}︡{"stdout":"Signed, encrypted message:  3647527136466047967324540\n"}︡{"done":true}
︠3e041bcb-3f36-4ca2-9938-42351cc58a34s︠
# 3. Demonstrate how Bob converts the message received from Alice back into the word Math. Output the value of the intermediate computations and the final human-readable message.
decrypted = power_mod(encrypted, D_b, n_b)
decrypted

received = power_mod(decrypted, E_a, n_a)
received

digits = received.digits(base=128)
letters = [chr(ascii) for ascii in digits]
letters
︡89db4518-c9b5-40fe-877d-1a798b7d8586︡{"stdout":"306942137117238147353497\n"}︡{"stdout":"220016845\n"}︡{"stdout":"['M', 'a', 't', 'h']\n"}︡{"done":true}
︠73536265-e515-41ab-836e-11902db61b5cs︠
# 4. Create a new signed message from Alice to Bob. Simulate the message being tampered with by adding 1 to the integer Bob receives, before he decrypts it. What result does Bob get for the letters of the message when he decrypts and unsigns the tampered message?
word = 'Test'
digits = [ord(letter) for letter in word]
digits

message = ZZ(digits, 128)
print("Message: ", message)

signed = power_mod(message, D_a, n_a)
print("Signed message: ", signed)

encrypted = power_mod(signed, E_b, n_b)
print("Signed, encrypted message: ", encrypted)

decrypted = power_mod(encrypted+1, D_b, n_b)
decrypted

received = power_mod(decrypted, E_a, n_a)
received

digits = received.digits(base=128)
letters = [chr(ascii) for ascii in digits]
letters
︡3cf951ec-b2a7-4c36-8da6-7a7b16c7e638︡{"stdout":"[84, 101, 115, 116]\n"}︡{"stdout":"Message:  245166804\n"}︡{"stdout":"Signed message:  560729785565073186628556\n"}︡{"stdout":"Signed, encrypted message:  2333751749375384806526255\n"}︡{"stdout":"2018025446895540710036564\n"}︡{"stdout":"509994001691680021546467\n"}︡{"stdout":"['c', '\\x0b', '(', 'I', 'h', 'Q', 'z', 'D', 'T', '}', '/', '\\x03']\n"}︡{"done":true}
︠ac5b928b-e466-40c5-ae78-eefebaf5c281︠










