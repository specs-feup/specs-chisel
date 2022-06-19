#!/usr/bin/python

import os

input_args="./input_args.txt"
output_file="./workflow.sh"

non_optional_args_dict={}
non_optional_arg_keys=[]

functional_arguments_dict={}
functional_argument_keys=[]

vivado_arguments_dict={}
vivado_argument_keys=[]

#Changeable macros
BASELINE_BIN="baseline.riscv"
ACCELERATED_BIN="fir_benchmark.riscv"
BOARD="vc707"
SELECTED_FREQ=200.0


def execute_loop(f, category):
    if category == "functional":
        f.write("\t\t\t\tmake -C ./accelerators/{} clean\n".format(non_optional_args_dict["target"]))
        f.write("\t\t\t\t\tmake -C ./accelerators/{} functional_workflow {}".format(non_optional_args_dict["target"], "".join(["{}=$loop_{}_var ".format(arg,counter) for counter,arg in enumerate(functional_argument_keys)])))
        f.write("{}file=$tmp_file baseline_binary={} accelerated_binary={}\n".format("".join(["{}={} ".format(arg, non_optional_args_dict[arg]) for arg in non_optional_arg_keys]), BASELINE_BIN, ACCELERATED_BIN))
        f.write("\t\t\t\t\tbaseline_var=$(sed -n '1p' ./accelerators/{}/results/tmp_file.txt)\n".format(non_optional_args_dict["target"]))
        f.write("\t\t\t\t\taccel_var=$(sed -n '2p' ./accelerators/{}/results/tmp_file.txt)\n".format(non_optional_args_dict["target"]))
        f.write("\t\t\t\t\tprintf \"$loop_{}_var\\t$baseline_var\\t$accel_var\\n\" >> ./accelerators/{}/results/_${{loop_0_var}}/${{type_verbose_array[loop_1_var]}}/cycle_count_{}.csv\n"
        .format(len(functional_arguments_dict) - 1, non_optional_args_dict["target"], functional_argument_keys[-1]))
        f.write("\t\t\t\t\trm ./accelerators/{}/results/tmp_file.txt\n".format(non_optional_args_dict["target"]))
        f.write("{}\n".format("".join(["{}done\n".format("\t"*(len(functional_argument_keys) - counter)) for counter, _ in enumerate(functional_argument_keys)])))
        f.write("./scripts/generate_files.py {}\n\n".format(non_optional_args_dict["target"]))
    elif category == "vivado":
        f.write("\t\tmake -C ./accelerators/{} vivado_workflow {}type_verbose=${{type_verbose_array[$loop_0_var]}} ".format(non_optional_args_dict["target"], "".join(["{}=$loop_{}_var ".format(arg,counter) for counter,arg in enumerate(vivado_argument_keys)])))
        f.write("board={} config={} file=./results/max_freqs_${{type_verbose_array[$loop_0_var]}}.csv ".format(BOARD, non_optional_args_dict["config"], SELECTED_FREQ, non_optional_args_dict["target"]))
	f.write("{}\n".format("".join(["{}={} ".format(arg, non_optional_args_dict[arg]) for arg in non_optional_arg_keys])))
        f.write("{}\n".format("".join(["{}done\n".format("\t"*(len(vivado_argument_keys) - counter)) for counter, _ in enumerate(vivado_argument_keys)])))	
	f.write("./scripts/process_checkpoints.py {} {}\n./scripts/process_timing.py {}\n".format(SELECTED_FREQ, non_optional_args_dict["target"], non_optional_args_dict["target"]))

def generate_loop(f, category):
    if category == "functional":
        f.write("\n### Cycle calculation (with respect to ###\n".format(functional_argument_keys[-1]))
        for counter, key in enumerate(functional_argument_keys):
            f.write("{}for loop_{}_var in \"${{{}[@]}}\"; do\n\t".format("\t"*counter,counter, key))
            if counter == 0:
                f.write("rm ./accelerators/{}/results/tmp_file.txt\n".format(non_optional_args_dict["target"]))
            elif counter == 1:
                f.write("\tprintf \"### ${{type_verbose_array[$loop_1_var]}} VALUES (${{loop_0_var}}) ###\\n\" >> ./accelerators/{}/results/_${{loop_0_var}}/${{type_verbose_array[$loop_1_var]}}/cycle_count_{}.csv\n"
                .format(non_optional_args_dict["target"],functional_argument_keys[-1]))
            elif counter == 2:
                f.write("\t\tprintf \"{}(@{}=$loop_2_var)\\tBASELINE\\tACCELERATOR\\n\" >> ./accelerators/{}/results/_${{loop_0_var}}/${{type_verbose_array[$loop_1_var]}}/cycle_count_{}.csv\n"
                 .format(functional_argument_keys[-1], functional_argument_keys[-2], non_optional_args_dict["target"], functional_argument_keys[-1]))
    elif category == "vivado":
        f.write("## frequency, area and power measurements ###\n")
	f.write("rm ./checkpoints/*.rpt\n")
        f.write("rm ./accelerators/{}/results/*.csv\n".format(non_optional_args_dict["target"]))
        for counter, key in enumerate(vivado_argument_keys):
            if counter == 1: f.write("\tprintf \"{}\\tMAXIMUM FREQUENCY\\n\" >> ./accelerators/{}/results/max_freqs_${{type_verbose_array[$loop_0_var]}}.csv\n".format(vivado_argument_keys[-1],non_optional_args_dict["target"]))
            f.write("{}for loop_{}_var in \"${{{}[@]}}\"; do\n".format("\t"*counter,counter, key))
            if counter == 0: f.write("\tprintf \"### MAXIMUM FREQUENCIES ###\\n\" >> ./accelerators/{}/results/max_freqs_${{type_verbose_array[$loop_0_var]}}.csv\n".format(non_optional_args_dict["target"]))


def generate_variables(f, category):
    if category == "functional":
        for key in non_optional_arg_keys:
            f.write("{}={}\n".format(key, non_optional_args_dict[key]))
        for key in functional_argument_keys:
            f.write("{}={}\n".format(key, functional_arguments_dict[key]))
        f.write("tmp_file=./../../accelerators/{}/results/tmp_file.txt\n".format(non_optional_args_dict["target"]))
        f.write("\nfind ./accelerators/{}/results ! -name '.*' ! -type d -exec rm -- {{}} +\n".format(non_optional_args_dict["target"]))
    elif category == "vivado":
        for key in vivado_argument_keys:
            f.write("{}={}\n".format(key, vivado_arguments_dict[key]))
        f.write("selected_frequency={}\n\n".format(SELECTED_FREQ))


def read_args():
    with open(input_args, "r") as in_file:
        lines=in_file.readlines()
        vivado_args=False
        counter=0
        for line in lines:
            if line[0] != "#":
                if "=" in line or "Vivado workflow" in line:
                    if counter < 4:
                        key=line.split("=")[0].strip("\n")
                        value=line.split("=")[1].strip("\n")
                        non_optional_arg_keys.append(key)
                        non_optional_args_dict[key]=value
                    else:
                        if "Vivado workflow" in line:
                            vivado_args=True
                            continue
                        if vivado_args==False:
                            key=line.split("=")[0].strip("\n")
                            value=line.split("=")[1].strip("\n")
                            functional_argument_keys.append(key)
                            functional_arguments_dict[key]=value
                        else:
                            key=line.split("=")[0].strip("\n")
                            value=line.split("=")[1].strip("\n")
                            vivado_argument_keys.append(key)
                            vivado_arguments_dict[key]=value
                    counter = counter + 1
    in_file.close()

def write_bash_script():
    with open(output_file, "w") as f:

        f.write("#!/bin/bash\n")
        f.write("type_verbose_array=(unsigned signed fixed-point floating-point)\n") #necessary array for particular implementation

        generate_variables(f, "functional")

       	generate_loop(f, "functional")

        execute_loop(f, "functional")

        generate_variables(f, "vivado")

        generate_loop(f, "vivado")

        execute_loop(f, "vivado")

    f.close()

def run_bash_script():
    os.system("bash {}".format(output_file))

def main():
    read_args()
    write_bash_script()
    run_bash_script()


if __name__ == "__main__": main()
