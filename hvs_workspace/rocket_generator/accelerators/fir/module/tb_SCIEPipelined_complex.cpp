#include <stdlib.h>
#include <iostream>
#include <vector>
#include <time.h>
#include <verilated.h>
#include <verilated_vcd_c.h>
#include "./obj_dir/VSCIEPipelined.h"
#include "./obj_dir/VSCIEPipelined__Syms.h"

#define MAX_SIM_TIME 100
vluint64_t sim_time = 0;
int mod_type, order, width, binarypoint;

using namespace std;

struct complex_int{
	int16_t real_val;
	int16_t imag_val;
};

struct complex_float{
	float real_val;
	float imag_val;
};

union value{
	struct complex_int comp_int;
	struct complex_float comp_fl;
};


uint32_t convert(float value){
	return (uint32_t)(round(value * (1 << binarypoint)));
}


void dut_exec(VSCIEPipelined *dut){
	dut->insn = 0x5b;
}

void dut_send_coeff(VSCIEPipelined *dut, union value *coeffs, int coeff_count){
        dut->insn = 0x0b;
				dut->rs2 = coeff_count;
				dut->rs1_real = mod_type == 4 ? coeffs[dut->rs2].comp_int.real_val :  convert(coeffs[dut->rs2].comp_fl.real_val);
				dut->rs1_imag = mod_type == 4 ? coeffs[dut->rs2].comp_int.imag_val :  convert(coeffs[dut->rs2].comp_fl.imag_val);
}


void dut_send_data(VSCIEPipelined *dut, union value *data, int data_count){
    	  dut->insn = 0x2b;
				dut->rs1_real = mod_type == 4 ? data[data_count].comp_int.real_val :  convert(data[data_count].comp_fl.real_val);
				dut->rs1_imag = mod_type == 4 ? data[data_count].comp_int.imag_val : convert(data[data_count].comp_fl.imag_val);
}


int main(int argc, char** argv, char** env) {

    assert(argc == 5);

    order = atoi(argv[1]);
    width = atoi(argv[2]);
		binarypoint = atoi(argv[4]);

		mod_type = atoi(argv[3]);

		union value coeffs[order], data[order];

    srand(time(NULL));

		switch(mod_type){
			case 4:
				for(int i = 0; i < order; i++){
					coeffs[i].comp_int.real_val = rand() % 100 + 1 - 50;
					coeffs[i].comp_int.imag_val = rand() % 100 + 1 - 50;
				}
			break;
			case 5:
			for(int i = 0; i < order; i++){
				coeffs[i].comp_fl.real_val = (float)rand()/(float)(RAND_MAX) * 100;
				coeffs[i].comp_fl.imag_val = (float)rand()/(float)(RAND_MAX) * 100;
				data[i].comp_fl.real_val = (float)rand()/(float)(RAND_MAX) * 100;
				data[i].comp_fl.imag_val = (float)rand()/(float)(RAND_MAX) * 100;
			}
			break;
		}

    Verilated::commandArgs(argc, argv);
    VSCIEPipelined *dut = new VSCIEPipelined;
    Verilated::traceEverOn(true);
    VerilatedVcdC *m_trace = new VerilatedVcdC;
    dut->trace(m_trace, 5);
    m_trace->open("waveform.vcd");

    int coeff_count = 0, data_count = 0;

    while (sim_time < MAX_SIM_TIME) {
				dut->valid = 1;
    	  if(coeff_count < order && dut->clock == 0){
					dut_send_coeff(dut, coeffs, coeff_count++);
				}
    	  else if(data_count < order && dut->clock == 0)
					dut_send_data(dut, data, data_count++);
				else if(dut->clock == 0) dut_exec(dut);
				dut->clock ^= 1;
    		dut->eval();
      	m_trace->dump(sim_time);
      	sim_time++;
    }

    m_trace->close();
    delete dut;
    exit(EXIT_SUCCESS);
}
