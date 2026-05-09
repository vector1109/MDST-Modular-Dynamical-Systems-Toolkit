import networkx as nx
import matplotlib.pyplot as plt

n = 60

def f(x):
    return (x * x) % 60

G = nx.DiGraph()

for x in range(n):
    y = f(x)
    G.add_edge(x, y)

plt.figure(figsize=(10,10))
nx.draw_circular(G, with_labels=True, node_size=300)
plt.title("MDST Functional Graph Z60")
plt.show()