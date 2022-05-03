// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VSCIEPipelined__Syms.h"


//======================

void VSCIEPipelined::traceChg(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    VSCIEPipelined* t=(VSCIEPipelined*)userthis;
    VSCIEPipelined__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    if (vlSymsp->getClearActivity()) {
	t->traceChgThis (vlSymsp, vcdp, code);
    }
}

//======================


void VSCIEPipelined::traceChgThis(VSCIEPipelined__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VSCIEPipelined* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	if (VL_UNLIKELY((2U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__2(vlSymsp, vcdp, code);
	}
	vlTOPp->traceChgThis__3(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void VSCIEPipelined::traceChgThis__2(VSCIEPipelined__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VSCIEPipelined* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBus  (c+1,(vlTOPp->SCIEPipelined__DOT__coeffs_0),32);
	vcdp->chgBus  (c+2,(vlTOPp->SCIEPipelined__DOT__data_0),32);
	vcdp->chgQuad (c+3,(vlTOPp->SCIEPipelined__DOT__result),64);
    }
}

void VSCIEPipelined::traceChgThis__3(VSCIEPipelined__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VSCIEPipelined* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+5,(vlTOPp->clock));
	vcdp->chgBit  (c+6,(vlTOPp->valid));
	vcdp->chgBus  (c+7,(vlTOPp->insn),32);
	vcdp->chgBus  (c+8,(vlTOPp->rs1),32);
	vcdp->chgBus  (c+9,(vlTOPp->rs2),32);
	vcdp->chgBus  (c+10,(vlTOPp->rd),32);
    }
}
