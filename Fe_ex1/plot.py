import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

filename = "result.txt"
for i in range(0, 21, 3):
	f = pd.DataFrame(np.loadtxt(filename, skiprows = i*60 + 1, max_rows = 60), columns = ["x", "def"])
	print(f["x"])
	plt.plot(f["x"], f["def"])

plt.xlabel("X [nm]")
plt.ylabel(r"Number density [$cm^{-3}$]")
plt.savefig("concentration.png")
