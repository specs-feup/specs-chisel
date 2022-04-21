import os, sys, matplotlib.pyplot as plt

order = [5, 10, 20, 50, 100, 200, 500, 1000]
baseline_results = []
accel_results = []
speedup = []
counter = 0

with open('results.txt', 'r') as file:
    for line in file:
        for i in line.split():
            if i.isdigit():
		counter = counter + 1
		if counter > len(order):
                	accel_results.append(int(i))
		else:
			baseline_results.append(int(i))
for base, accel in zip(baseline_results, accel_results):
	speedup.append(base / accel)

fig, ax = plt.subplots()
base_line = ax.plot(order, baseline_results, label='Baseline')
accel_line = ax.plot(order, accel_results, label='Accelerated')
plt.yscale('log')
handles, labels = ax.get_legend_handles_labels()
ax.legend(handles, labels)
ax.set_xlabel('Number of FIR coefficients')
ax.set_ylabel('Performance (number of cycles)')
ax.grid(True)


fig, ax = plt.subplots()
ax.plot(order, speedup)
ax.set_xlabel('Number of FIR coefficients')
ax.set_ylabel('Speedup')
ax.grid(True)
plt.ylim(0, 1000)
plt.show()

