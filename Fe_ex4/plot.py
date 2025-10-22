import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

filename = "accumulation_defects.data"
file = pd.DataFrame(np.loadtxt(filename, skiprows = 1), columns = ["time", "fluence", "V_MP", "I_MP", "d111", "d100", "dV100", "VClus", "IClus"])
plt.figure(figsize = (7, 6))
plt.semilogx(file["fluence"], file["V_MP"], label = r"$I_{MP}$")
plt.semilogx(file["fluence"], file["I_MP"], label = r"$V_{MP}$")
plt.semilogx(file["fluence"], file["IClus"], label = r"$I_{clus}$")
plt.semilogx(file["fluence"], file["d111"] + file["d100"], label = r"$I_{<100>} + I_{<111>}$")

plt.legend(fontsize = 13, frameon = False)
plt.ylabel("Number of defects", fontsize = 13)
plt.xlabel(r"Fluence [cascades / cm$^{2}$]", fontsize = 13)
plt.xticks(fontsize = 13)
plt.yticks(fontsize = 13)
#plt.ylim([-100, 11000])
plt.tight_layout()
plt.savefig("accumulation.png")
