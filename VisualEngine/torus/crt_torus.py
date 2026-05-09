import matplotlib.pyplot as plt

n = 60

def crt(x):
    return (x % 4, x % 3, x % 5)

xs, ys, zs = [], [], []

for x in range(n):
    a,b,c = crt(x)
    xs.append(a)
    ys.append(b)
    zs.append(c)

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

ax.scatter(xs, ys, zs)

ax.set_title("CRT Torus Projection Z60")
plt.show()