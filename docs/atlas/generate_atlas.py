import matplotlib.pyplot as plt
import networkx as nx
from collections import defaultdict

# ============================================
# MDST — Visual Atlas Generator for Z60
# ============================================

N = 60

def f(x):
    return (x * x) % N

def save_all_formats(base_filename):
    """Auxiliar para guardar en PNG, SVG y PDF"""
    path = f"docs/atlas/{base_filename}"
    plt.savefig(f"{path}.png", dpi=300)
    plt.savefig(f"{path}.svg")
    plt.savefig(f"{path}.pdf")
    print(f"Formatos guardados para: {base_filename}")

# ============================================
# 1. Functional Graph
# ============================================

G = nx.DiGraph()
for x in range(N):
    G.add_edge(x, f(x))

plt.figure(figsize=(14, 14))
pos = nx.spring_layout(G, seed=42)
nx.draw(
    G, pos, node_size=300, arrowsize=10, with_labels=True,
)
plt.title("MDST — Functional Graph for Z60")
save_all_formats("functional_graph_z60")
plt.close()

# ============================================
# 2. Basin Atlas
# ============================================

def phi(x):
    mods = [4, 3, 5]
    eps = []
    for m in mods:
        eps.append(0 if x % m == 0 else 1)

    table = {
        (0,0,0): 0, (1,1,1): 1, (0,1,1): 16, (1,0,1): 21,
        (1,1,0): 25, (0,0,1): 36, (0,1,0): 40, (1,0,0): 45
    }
    return table[tuple(eps)]

basins = defaultdict(list)
for x in range(N):
    basins[phi(x)].append(x)

plt.figure(figsize=(12, 6))
for i, (k, vals) in enumerate(sorted(basins.items())):
    plt.scatter(vals, [i]*len(vals), s=100)

plt.yticks(range(len(basins)), [f"Φ={k}" for k in sorted(basins)])
plt.xlabel("x")
plt.title("MDST — Basin Atlas for Z60")
save_all_formats("basin_atlas_z60")
plt.close()

# ============================================
# 3. Φ Field
# ============================================

xs = list(range(N))
ys = [phi(x) for x in xs]

plt.figure(figsize=(12, 6))
plt.scatter(xs, ys, s=80)
plt.xlabel("x")
plt.ylabel("Φ(x)")
plt.title("MDST — Φ Field over Z60")
save_all_formats("phi_field_z60")
plt.close()

# ============================================
# 4. CRT Toroidal Projection
# ============================================

coords = []
for x in range(N):
    coords.append((x % 4, x % 3, x % 5))

fig = plt.figure(figsize=(10, 10))
ax = fig.add_subplot(111, projection='3d')

xs_plot = [c[0] for c in coords]
ys_plot = [c[1] for c in coords]
zs_plot = [c[2] for c in coords]

ax.scatter(xs_plot, ys_plot, zs_plot, s=80)
ax.set_xlabel("mod 4")
ax.set_ylabel("mod 3")
ax.set_zlabel("mod 5")
plt.title("MDST — CRT Toroidal Projection")
save_all_formats("crt_torus_z60")
plt.close()

print("\nAtlas generated successfully in all formats.")