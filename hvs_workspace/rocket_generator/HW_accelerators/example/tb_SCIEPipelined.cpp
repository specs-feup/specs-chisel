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

int main(int argc, char** argv, char** env) {
    Verilated::commandArgs(argc, argv);
    VSCIEPipelined *dut = new VSCIEPipelined;
    Verilated::traceEverOn(true);
    VerilatedVcdC *m_trace = new VerilatedVcdC;
    dut->trace(m_trace, 5);
    m_trace->open("waveform.vcd");

    while (sim_time < MAX_SIM_TIME) {
    }

    m_trace->close();
    delete dut;
    exit(EXIT_SUCCESS);
}
