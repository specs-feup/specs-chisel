#include <stdlib.h>
#include <iostream>
#include <vector>
#include <time.h>
#include <verilated.h>
#include <verilated_vcd_c.h>
#include "./obj_dir/VSCIEPipelined.h"
#include "./obj_dir/VSCIEPipelined__Syms.h"
#define DATA_COUNT 5

#define MAX_SIM_TIME 100
vluint64_t sim_time = 0;
int mod_type, order, width, binarypoint;

using namespace std;

union value{
	int32_t ivalue;
	uint32_t uvalue;
	float fvalue;
};

uint32_t convert(float value){
	return (uint32_t)(round(value * (1 << binarypoint)));
}


void dut_exec(VSCIEPipelined *dut){
	dut->insn = 0x3b;
}

void dut_send_coeff(VSCIEPipelined *dut, union value *coeffs, int coeff_count){
        dut->insn = 0x0b;
				dut->rs2 = coeff_count;
				dut->rs1 = mod_type == 0 ? coeffs[dut->rs2].uvalue : mod_type == 1  ?  coeffs[dut->rs2].ivalue  : convert(coeffs[dut->rs2].fvalue);
}


void dut_send_data(VSCIEPipelined *dut, union value *data, int data_count){
    	  dut->insn = 0x2b;
				dut->rs1 = mod_type == 0  ?  data[data_count].uvalue : mod_type == 1  ?  data[data_count].ivalue  :  convert(data[data_count].fvalue);
}


int main(int argc, char** argv, char** env) {

    assert(argc == 5);

    order = atoi(argv[1]);
    width = atoi(argv[2]);
			mod_type = atoi(argv[3]);
		binarypoint = atoi(argv[4]);

		union value coeffs[order], data[DATA_COUNT];

    srand(time(NULL));

		//Types of data: 0 -> UInt, 1 -> SInt, 2, 3 -> FixedPoint

		switch(mod_type){
			case 0:
				for(int i = 0; i < order; i++){
					coeffs[i].uvalue = rand() % 100 + 1;
				}
				for(int i = 0; i < DATA_COUNT; i++){
					data[i].uvalue = rand() % 100 + 1;
				}
			break;
			case 1:
				for(int i = 0; i < order; i++){
					coeffs[i].ivalue = rand() % 100 + 1 - 50;
				}
				for(int i = 0; i < DATA_COUNT; i++){
					data[i].ivalue = rand() % 100 + 1 - 50;
				}
			break;
			case 2:
				for(int i = 0; i < order; i++){
					coeffs[i].fvalue = (float)rand()/(float)(RAND_MAX) * 100;
				}
				for(int i = 0; i < DATA_COUNT; i++){
					data[i].fvalue = (float)rand()/(float)(RAND_MAX) * 100;
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
    	  else if(data_count < DATA_COUNT && dut->clock == 0)
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
