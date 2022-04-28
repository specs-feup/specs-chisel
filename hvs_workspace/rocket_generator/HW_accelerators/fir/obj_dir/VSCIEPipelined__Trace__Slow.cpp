// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VSCIEPipelined__Syms.h"


//======================

void VSCIEPipelined::trace (VerilatedVcdC* tfp, int, int) {
    tfp->spTrace()->addCallback (&VSCIEPipelined::traceInit, &VSCIEPipelined::traceFull, &VSCIEPipelined::traceChg, this);
}
void VSCIEPipelined::traceInit(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->open()
    VSCIEPipelined* t=(VSCIEPipelined*)userthis;
    VSCIEPipelined__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    if (!Verilated::calcUnusedSigs()) VL_FATAL_MT(__FILE__,__LINE__,__FILE__,"Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    vcdp->scopeEscape(' ');
    t->traceInitThis (vlSymsp, vcdp, code);
    vcdp->scopeEscape('.');
}
void VSCIEPipelined::traceFull(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    VSCIEPipelined* t=(VSCIEPipelined*)userthis;
    VSCIEPipelined__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    t->traceFullThis (vlSymsp, vcdp, code);
}

//======================


void VSCIEPipelined::traceInitThis(VSCIEPipelined__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VSCIEPipelined* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    vcdp->module(vlSymsp->name());  // Setup signal names
    // Body
    {
	vlTOPp->traceInitThis__1(vlSymsp, vcdp, code);
    }
}

void VSCIEPipelined::traceFullThis(VSCIEPipelined__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VSCIEPipelined* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vlTOPp->traceFullThis__1(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void VSCIEPipelined::traceInitThis__1(VSCIEPipelined__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VSCIEPipelined* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->declBit  (c+11,"clock",-1);
	vcdp->declBit  (c+12,"valid",-1);
	vcdp->declBus  (c+13,"insn",-1,31,0);
	vcdp->declBus  (c+14,"rs1",-1,31,0);
	vcdp->declBus  (c+15,"rs2",-1,31,0);
	vcdp->declBus  (c+16,"rd",-1,31,0);
	vcdp->declBus  (c+17,"SCIEPipelined XLEN",-1,31,0);
	vcdp->declBit  (c+11,"SCIEPipelined clock",-1);
	vcdp->declBit  (c+12,"SCIEPipelined valid",-1);
	vcdp->declBus  (c+13,"SCIEPipelined insn",-1,31,0);
	vcdp->declBus  (c+14,"SCIEPipelined rs1",-1,31,0);
	vcdp->declBus  (c+15,"SCIEPipelined rs2",-1,31,0);
	vcdp->declBus  (c+16,"SCIEPipelined rd",-1,31,0);
	vcdp->declBit  (c+18,"SCIEPipelined reset",-1);
	vcdp->declBus  (c+1,"SCIEPipelined coeffs_0",-1,31,0);
	vcdp->declBus  (c+2,"SCIEPipelined coeffs_1",-1,31,0);
	vcdp->declBus  (c+3,"SCIEPipelined coeffs_2",-1,31,0);
	vcdp->declBus  (c+4,"SCIEPipelined coeffs_3",-1,31,0);
	vcdp->declBus  (c+5,"SCIEPipelined data_0",-1,31,0);
	vcdp->declBus  (c+6,"SCIEPipelined data_1",-1,31,0);
	vcdp->declBus  (c+7,"SCIEPipelined data_2",-1,31,0);
	vcdp->declBus  (c+8,"SCIEPipelined data_3",-1,31,0);
	vcdp->declQuad (c+9,"SCIEPipelined result",-1,63,0);
	// Tracing: SCIEPipelined _GEN_5 // Ignored: Inlined leading underscore at SCIEPipelined.v:20
	// Tracing: SCIEPipelined _GEN_6 // Ignored: Inlined leading underscore at SCIEPipelined.v:21
	// Tracing: SCIEPipelined _GEN_7 // Ignored: Inlined leading underscore at SCIEPipelined.v:22
	// Tracing: SCIEPipelined _result_T_2 // Ignored: Inlined leading underscore at SCIEPipelined.v:23
	// Tracing: SCIEPipelined _result_T_3 // Ignored: Inlined leading underscore at SCIEPipelined.v:24
	// Tracing: SCIEPipelined _result_T_4 // Ignored: Inlined leading underscore at SCIEPipelined.v:25
	// Tracing: SCIEPipelined _result_T_5 // Ignored: Inlined leading underscore at SCIEPipelined.v:26
	// Tracing: SCIEPipelined _result_T_8 // Ignored: Inlined leading underscore at SCIEPipelined.v:27
	// Tracing: SCIEPipelined _result_T_11 // Ignored: Inlined leading underscore at SCIEPipelined.v:28
	// Tracing: SCIEPipelined _result_T_14 // Ignored: Inlined leading underscore at SCIEPipelined.v:29
	// Tracing: SCIEPipelined _GEN_8 // Ignored: Inlined leading underscore at SCIEPipelined.v:30
	// Tracing: SCIEPipelined _GEN_32 // Ignored: Inlined leading underscore at SCIEPipelined.v:32
	// Tracing: SCIEPipelined _GEN_13 // Ignored: Inlined leading underscore at SCIEPipelined.v:33
	// Tracing: SCIEPipelined _GEN_33 // Ignored: Inlined leading underscore at SCIEPipelined.v:34
	// Tracing: SCIEPipelined _GEN_18 // Ignored: Inlined leading underscore at SCIEPipelined.v:35
	// Tracing: SCIEPipelined _GEN_27 // Ignored: Inlined leading underscore at SCIEPipelined.v:36
    }
}

void VSCIEPipelined::traceFullThis__1(VSCIEPipelined__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VSCIEPipelined* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->fullBus  (c+1,(vlTOPp->SCIEPipelined__DOT__coeffs_0),32);
	vcdp->fullBus  (c+2,(vlTOPp->SCIEPipelined__DOT__coeffs_1),32);
	vcdp->fullBus  (c+3,(vlTOPp->SCIEPipelined__DOT__coeffs_2),32);
	vcdp->fullBus  (c+4,(vlTOPp->SCIEPipelined__DOT__coeffs_3),32);
	vcdp->fullBus  (c+5,(vlTOPp->SCIEPipelined__DOT__data_0),32);
	vcdp->fullBus  (c+6,(vlTOPp->SCIEPipelined__DOT__data_1),32);
	vcdp->fullBus  (c+7,(vlTOPp->SCIEPipelined__DOT__data_2),32);
	vcdp->fullBus  (c+8,(vlTOPp->SCIEPipelined__DOT__data_3),32);
	vcdp->fullQuad (c+9,(vlTOPp->SCIEPipelined__DOT__result),64);
	vcdp->fullBit  (c+11,(vlTOPp->clock));
	vcdp->fullBit  (c+12,(vlTOPp->valid));
	vcdp->fullBus  (c+13,(vlTOPp->insn),32);
	vcdp->fullBus  (c+14,(vlTOPp->rs1),32);
	vcdp->fullBus  (c+15,(vlTOPp->rs2),32);
	vcdp->fullBus  (c+16,(vlTOPp->rd),32);
	vcdp->fullBus  (c+17,(0x20U),32);
	vcdp->fullBit  (c+18,(0U));
    }
}
