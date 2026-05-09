import matplotlib.pyplot as plt

def phi(x):
    if x % 4 == 0: return 0
    if x % 3 == 0: return 16
    if x % 5 == 0: return 21
    return 1

n = 60

colors = [phi(x) for x in range(n)]

plt.scatter(range(n), [0]*n, c=colors, cmap="viridis", s=100)
plt.title("MDST Φ Field (Z60)")
plt.show()