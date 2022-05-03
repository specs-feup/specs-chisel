// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary design header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef _VSCIEPipelined_H_
#define _VSCIEPipelined_H_

#include "verilated.h"

class VSCIEPipelined__Syms;
class VerilatedVcd;

//----------

VL_MODULE(VSCIEPipelined) {
  public:
    
    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(clock,0,0);
    VL_IN8(valid,0,0);
    VL_IN(insn,31,0);
    VL_IN(rs1,31,0);
    VL_IN(rs2,31,0);
    VL_OUT(rd,31,0);
    
    // LOCAL SIGNALS
    // Internals; generally not touched by application code
    VL_SIG(SCIEPipelined__DOT__coeffs_0,31,0);
    VL_SIG(SCIEPipelined__DOT__data_0,31,0);
    VL_SIGW(SCIEPipelined__DOT___GEN_7,71,0,3);
    VL_SIG64(SCIEPipelined__DOT__result,63,0);
    VL_SIG64(SCIEPipelined__DOT___result_T_1,63,0);
    
    // LOCAL VARIABLES
    // Internals; generally not touched by application code
    VL_SIG8(__Vclklast__TOP__clock,0,0);
    VL_SIG(__Vm_traceActivity,31,0);
    
    // INTERNAL VARIABLES
    // Internals; generally not touched by application code
    VSCIEPipelined__Syms* __VlSymsp;  // Symbol table
    
    // PARAMETERS
    // Parameters marked /*verilator public*/ for use by application code
    
    // CONSTRUCTORS
  private:
    VSCIEPipelined& operator= (const VSCIEPipelined&);  ///< Copying not allowed
    VSCIEPipelined(const VSCIEPipelined&);  ///< Copying not allowed
  public:
    /// Construct the model; called by application code
    /// The special name  may be used to make a wrapper with a
    /// single model invisible WRT DPI scope names.
    VSCIEPipelined(const char* name="TOP");
    /// Destroy the model; called (often implicitly) by application code
    ~VSCIEPipelined();
    /// Trace signals in the model; called by application code
    void trace (VerilatedVcdC* tfp, int levels, int options=0);
    
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval();
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    
    // INTERNAL METHODS
  private:
    static void _eval_initial_loop(VSCIEPipelined__Syms* __restrict vlSymsp);
  public:
    void __Vconfigure(VSCIEPipelined__Syms* symsp, bool first);
  private:
    static QData _change_request(VSCIEPipelined__Syms* __restrict vlSymsp);
  public:
    static void _combo__TOP__3(VSCIEPipelined__Syms* __restrict vlSymsp);
  private:
    void _ctor_var_reset();
  public:
    static void _eval(VSCIEPipelined__Syms* __restrict vlSymsp);
  private:
#ifdef VL_DEBUG
    void _eval_debug_assertions();
#endif // VL_DEBUG
  public:
    static void _eval_initial(VSCIEPipelined__Syms* __restrict vlSymsp);
    static void _eval_settle(VSCIEPipelined__Syms* __restrict vlSymsp);
    static void _sequent__TOP__1(VSCIEPipelined__Syms* __restrict vlSymsp);
    static void _settle__TOP__2(VSCIEPipelined__Syms* __restrict vlSymsp);
    static void traceChgThis(VSCIEPipelined__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__2(VSCIEPipelined__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__3(VSCIEPipelined__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceFullThis(VSCIEPipelined__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceFullThis__1(VSCIEPipelined__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceInitThis(VSCIEPipelined__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceInitThis__1(VSCIEPipelined__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceInit (VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceFull (VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceChg  (VerilatedVcd* vcdp, void* userthis, uint32_t code);
} VL_ATTR_ALIGNED(128);

#endif // guard
