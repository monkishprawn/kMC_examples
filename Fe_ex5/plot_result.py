import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

filename = "result.txt"

file = pd.DataFrame(np.loadtxt(filename),
			columns = ["T", "total", "derivative",
				   "I_MP", "V_MP",
				   "I2", "V2",
				   "I3", "V3",
				   "oI", "oV",
				   "I111"])

plt.figure()
plt.semilogy(file["T"], file["total"], label = "total")
plt.semilogy(file["T"], file["I_MP"], label = r"$I_{MP}$")
plt.semilogy(file["T"], file["V_MP"], label = r"$V_{MP}$")
plt.semilogy(file["T"], file["I2"], label = "I2")
plt.semilogy(file["T"], file["V2"], label = "V2")
plt.semilogy(file["T"], file["I3"], label = "I3")
plt.semilogy(file["T"], file["V3"], label = "V3")
plt.semilogy(file["T"], file["oI"], label = "oI")
plt.semilogy(file["T"], file["oV"], label = "oV")

plt.xlabel("Temperature K", fontsize = 13)
plt.ylabel("Defects", fontsize = 13)
plt.xticks(fontsize = 13)
plt.yticks(fontsize = 13)
plt.legend(fontsize = 13)
plt.tight_layout()



plt.savefig("isochronal_annealing.png")


plt.figure()
plt.semilogy(file["T"][1:], np.abs(file["derivative"][1:]))
plt.xlabel("Temperature K", fontsize = 13)
plt.ylabel("Derivative", fontsize = 13)
plt.xticks(fontsize = 13)
plt.yticks(fontsize = 13)
plt.tight_layout()

plt.savefig("derivative.png")
