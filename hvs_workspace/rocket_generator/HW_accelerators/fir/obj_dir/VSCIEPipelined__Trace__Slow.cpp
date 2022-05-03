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
	vcdp->declBit  (c+5,"clock",-1);
	vcdp->declBit  (c+6,"valid",-1);
	vcdp->declBus  (c+7,"insn",-1,31,0);
	vcdp->declBus  (c+8,"rs1",-1,31,0);
	vcdp->declBus  (c+9,"rs2",-1,31,0);
	vcdp->declBus  (c+10,"rd",-1,31,0);
	vcdp->declBus  (c+11,"SCIEPipelined XLEN",-1,31,0);
	vcdp->declBit  (c+5,"SCIEPipelined clock",-1);
	vcdp->declBit  (c+6,"SCIEPipelined valid",-1);
	vcdp->declBus  (c+7,"SCIEPipelined insn",-1,31,0);
	vcdp->declBus  (c+8,"SCIEPipelined rs1",-1,31,0);
	vcdp->declBus  (c+9,"SCIEPipelined rs2",-1,31,0);
	vcdp->declBus  (c+10,"SCIEPipelined rd",-1,31,0);
	vcdp->declBit  (c+12,"SCIEPipelined reset",-1);
	vcdp->declBus  (c+1,"SCIEPipelined coeffs_0",-1,31,0);
	vcdp->declBus  (c+2,"SCIEPipelined data_0",-1,31,0);
	vcdp->declQuad (c+3,"SCIEPipelined result",-1,63,0);
	// Tracing: SCIEPipelined _result_T_1 // Ignored: Inlined leading underscore at SCIEPipelined.v:14
	// Tracing: SCIEPipelined _GEN_0 // Ignored: Inlined leading underscore at SCIEPipelined.v:15
	// Tracing: SCIEPipelined _GEN_9 // Ignored: Inlined leading underscore at SCIEPipelined.v:17
	// Tracing: SCIEPipelined _GEN_2 // Ignored: Inlined leading underscore at SCIEPipelined.v:18
	// Tracing: SCIEPipelined _GEN_10 // Ignored: Inlined leading underscore at SCIEPipelined.v:19
	// Tracing: SCIEPipelined _GEN_4 // Ignored: Inlined leading underscore at SCIEPipelined.v:20
	// Tracing: SCIEPipelined _GEN_7 // Ignored: Inlined leading underscore at SCIEPipelined.v:21
    }
}

void VSCIEPipelined::traceFullThis__1(VSCIEPipelined__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VSCIEPipelined* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->fullBus  (c+1,(vlTOPp->SCIEPipelined__DOT__coeffs_0),32);
	vcdp->fullBus  (c+2,(vlTOPp->SCIEPipelined__DOT__data_0),32);
	vcdp->fullQuad (c+3,(vlTOPp->SCIEPipelined__DOT__result),64);
	vcdp->fullBit  (c+5,(vlTOPp->clock));
	vcdp->fullBit  (c+6,(vlTOPp->valid));
	vcdp->fullBus  (c+7,(vlTOPp->insn),32);
	vcdp->fullBus  (c+8,(vlTOPp->rs1),32);
	vcdp->fullBus  (c+9,(vlTOPp->rs2),32);
	vcdp->fullBus  (c+10,(vlTOPp->rd),32);
	vcdp->fullBus  (c+11,(0x20U),32);
	vcdp->fullBit  (c+12,(0U));
    }
}
