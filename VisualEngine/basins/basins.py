import matplotlib.pyplot as plt

basins = {
    0:[0],
    1:[12,24,36,48],
    16:[15,30,45],
    21:[4,8,16,28,32,44,52,56],
    25:[3,6,9,18,21,27,33,39,42,51,54,57],
    36:[20,40],
    40:[5,10,25,35,50,55],
    45:[1,2,7,11,13,14,17,19,22,23,26,29,31,34,37,38,41,43,46,47,49,53,58,59]
}

plt.figure(figsize=(10,6))

for i,(k,v) in enumerate(basins.items()):
    plt.scatter(v, [i]*len(v), label=f"Φ={k}")

plt.title("MDST Basin Atlas Z60")
plt.legend()
plt.show()