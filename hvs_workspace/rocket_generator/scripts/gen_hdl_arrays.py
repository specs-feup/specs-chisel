#!/usr/bin/python

import sys, re

def generate_golden(type, data, order, binarypoint, data_values, coeff_values):
	res = 0
	intermediate_res=0
	with open("./power_eval/golden_results/golden_type={}_data={}_order={}.txt".format(type, data, order), "w") as out_file:
		for i in range(data):
			res = 0
			for j in range(order):
				if i - j >= 0:
					if type == "fixed_point":
						intermediate_res = ((int(coeff_values[j]) * int(data_values[i - j])) >> binarypoint);
						res += intermediate_res;	
					else:
						res += int(coeff_values[j]) * int(data_values[i-j]);
			out_file.write(str(res)+"\n")			
        out_file.close()

def process_matches(matches):
    data_matches=[]
    coeffs_matches=[]
    data_matches.append(matches[0].strip(", {}"))
    coeffs_matches.append(matches[1].strip(", {}"))
    return data_matches, coeffs_matches

def process_file(type, data, order, binarypoint):
    with open("./benchmarks/include/{}_values.h".format(type), "r") as input_file:
            input_data=input_file.read()
            matches = re.findall(r'{.+}', input_data)
            data_vals, coeff_vals = process_matches(matches)
            data_values = [e for e in data_vals[0].split(",")]
            coeff_values = [e for e in coeff_vals[0].split(",")]
            with open("./power_eval/hdl_arrays/data_{}.txt".format(type), "w") as data_file:
                for data_value in data_values:
                    data_file.write(data_value.strip()+"\n")
            data_file.close()
            with open("./power_eval/hdl_arrays/coeffs_{}.txt".format(type), "w") as coeff_file:
                for coeff in coeff_values:
                    coeff_file.write(coeff.strip()+"\n")
            coeff_file.close()
    input_file.close()
    generate_golden(type, data, order, binarypoint, data_values, coeff_values)

def main(data, order, binarypoint):
    process_file("unsigned", data, order, binarypoint)
    process_file("signed", data, order, binarypoint)
    process_file("fixed_point", data, order, binarypoint)

if __name__ == "__main__":
    if len(sys.argv) < 4:
         print("Usage: <command> <data> <order> <binarypoint>")
         sys.exit(1)
    main(int(sys.argv[1]), int(sys.argv[2]), int(sys.argv[3]))
