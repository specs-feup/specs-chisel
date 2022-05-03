// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VSCIEPipelined.h for the primary calling header

#include "VSCIEPipelined.h"    // For This
#include "VSCIEPipelined__Syms.h"


//--------------------
// STATIC VARIABLES


//--------------------

VL_CTOR_IMP(VSCIEPipelined) {
    VSCIEPipelined__Syms* __restrict vlSymsp = __VlSymsp = new VSCIEPipelined__Syms(this, name());
    VSCIEPipelined* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Reset internal values
    
    // Reset structure values
    _ctor_var_reset();
}

void VSCIEPipelined::__Vconfigure(VSCIEPipelined__Syms* vlSymsp, bool first) {
    if (0 && first) {}  // Prevent unused
    this->__VlSymsp = vlSymsp;
}

VSCIEPipelined::~VSCIEPipelined() {
    delete __VlSymsp; __VlSymsp=NULL;
}

//--------------------


void VSCIEPipelined::eval() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VSCIEPipelined::eval\n"); );
    VSCIEPipelined__Syms* __restrict vlSymsp = this->__VlSymsp;  // Setup global symbol table
    VSCIEPipelined* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
#ifdef VL_DEBUG
    // Debug assertions
    _eval_debug_assertions();
#endif // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    while (VL_LIKELY(__Vchange)) {
	VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
	vlSymsp->__Vm_activity = true;
	_eval(vlSymsp);
	__Vchange = _change_request(vlSymsp);
	if (VL_UNLIKELY(++__VclockLoop > 100)) VL_FATAL_MT(__FILE__,__LINE__,__FILE__,"Verilated model didn't converge");
    }
}

void VSCIEPipelined::_eval_initial_loop(VSCIEPipelined__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    _eval_initial(vlSymsp);
    vlSymsp->__Vm_activity = true;
    int __VclockLoop = 0;
    QData __Vchange = 1;
    while (VL_LIKELY(__Vchange)) {
	_eval_settle(vlSymsp);
	_eval(vlSymsp);
	__Vchange = _change_request(vlSymsp);
	if (VL_UNLIKELY(++__VclockLoop > 100)) VL_FATAL_MT(__FILE__,__LINE__,__FILE__,"Verilated model didn't DC converge");
    }
}

//--------------------
// Internal Methods

VL_INLINE_OPT void VSCIEPipelined::_sequent__TOP__1(VSCIEPipelined__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSCIEPipelined::_sequent__TOP__1\n"); );
    VSCIEPipelined* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at SCIEPipelined.v:24
    vlTOPp->SCIEPipelined__DOT__result = (((QData)((IData)(
							   vlTOPp->SCIEPipelined__DOT___GEN_7[2U])) 
					   << 0x38U) 
					  | (((QData)((IData)(
							      vlTOPp->SCIEPipelined__DOT___GEN_7[1U])) 
					      << 0x18U) 
					     | ((QData)((IData)(
								vlTOPp->SCIEPipelined__DOT___GEN_7[0U])) 
						>> 8U)));
    // ALWAYS at SCIEPipelined.v:24
    if (vlTOPp->valid) {
	if ((0xbU == (0x7fU & vlTOPp->insn))) {
	    vlTOPp->SCIEPipelined__DOT__coeffs_0 = vlTOPp->rs1;
	}
    }
    if (vlTOPp->valid) {
	if ((0xbU != (0x7fU & vlTOPp->insn))) {
	    if ((0x2bU == (0x7fU & vlTOPp->insn))) {
		vlTOPp->SCIEPipelined__DOT__data_0 
		    = vlTOPp->rs1;
	    }
	}
    }
    vlTOPp->rd = (IData)(vlTOPp->SCIEPipelined__DOT__result);
    vlTOPp->SCIEPipelined__DOT___result_T_1 = VL_MULS_QQQ(64,64,64, 
							  VL_EXTENDS_QI(64,32, vlTOPp->SCIEPipelined__DOT__data_0), 
							  VL_EXTENDS_QI(64,32, vlTOPp->SCIEPipelined__DOT__coeffs_0));
}

void VSCIEPipelined::_settle__TOP__2(VSCIEPipelined__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSCIEPipelined::_settle__TOP__2\n"); );
    VSCIEPipelined* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Variables
    VL_SIGW(__Vtemp8,95,0,3);
    VL_SIGW(__Vtemp10,95,0,3);
    VL_SIGW(__Vtemp12,95,0,3);
    // Body
    vlTOPp->rd = (IData)(vlTOPp->SCIEPipelined__DOT__result);
    vlTOPp->SCIEPipelined__DOT___result_T_1 = VL_MULS_QQQ(64,64,64, 
							  VL_EXTENDS_QI(64,32, vlTOPp->SCIEPipelined__DOT__data_0), 
							  VL_EXTENDS_QI(64,32, vlTOPp->SCIEPipelined__DOT__coeffs_0));
    __Vtemp8[1U] = ((0x2bU == (0x7fU & vlTOPp->insn))
		     ? ((0xffU & ((IData)((((QData)((IData)(
							    VL_NEGATE_I((IData)(
										(1U 
										& (vlTOPp->SCIEPipelined__DOT__data_0 
										>> 0x1fU)))))) 
					    << 0x20U) 
					   | (QData)((IData)(vlTOPp->SCIEPipelined__DOT__data_0)))) 
				  >> 0x18U)) | (0xffffff00U 
						& ((IData)(
							   ((((QData)((IData)(
									      VL_NEGATE_I((IData)(
										(1U 
										& (vlTOPp->SCIEPipelined__DOT__data_0 
										>> 0x1fU)))))) 
							      << 0x20U) 
							     | (QData)((IData)(vlTOPp->SCIEPipelined__DOT__data_0))) 
							    >> 0x20U)) 
						   << 8U)))
		     : ((0x5bU == (0x7fU & vlTOPp->insn))
			 ? (IData)((vlTOPp->SCIEPipelined__DOT___result_T_1 
				    >> 0x20U)) : ((0xffU 
						   & ((IData)(vlTOPp->SCIEPipelined__DOT__result) 
						      >> 0x18U)) 
						  | (0xffffff00U 
						     & ((IData)(
								(vlTOPp->SCIEPipelined__DOT__result 
								 >> 0x20U)) 
							<< 8U)))));
    __Vtemp10[0U] = ((0xbU == (0x7fU & vlTOPp->insn))
		      ? (0xffffff00U & ((IData)((((QData)((IData)(
								  VL_NEGATE_I((IData)(
										(1U 
										& (vlTOPp->SCIEPipelined__DOT__coeffs_0 
										>> 0x1fU)))))) 
						  << 0x20U) 
						 | (QData)((IData)(vlTOPp->SCIEPipelined__DOT__coeffs_0)))) 
					<< 8U)) : (
						   (0x2bU 
						    == 
						    (0x7fU 
						     & vlTOPp->insn))
						    ? 
						   (0xffffff00U 
						    & ((IData)(
							       (((QData)((IData)(
										VL_NEGATE_I((IData)(
										(1U 
										& (vlTOPp->SCIEPipelined__DOT__data_0 
										>> 0x1fU)))))) 
								 << 0x20U) 
								| (QData)((IData)(vlTOPp->SCIEPipelined__DOT__data_0)))) 
						       << 8U))
						    : 
						   ((0x5bU 
						     == 
						     (0x7fU 
						      & vlTOPp->insn))
						     ? (IData)(vlTOPp->SCIEPipelined__DOT___result_T_1)
						     : 
						    (0xffffff00U 
						     & ((IData)(vlTOPp->SCIEPipelined__DOT__result) 
							<< 8U)))));
    __Vtemp10[2U] = ((0xbU == (0x7fU & vlTOPp->insn))
		      ? (0xffU & ((IData)(((((QData)((IData)(
							     VL_NEGATE_I((IData)(
										(1U 
										& (vlTOPp->SCIEPipelined__DOT__coeffs_0 
										>> 0x1fU)))))) 
					     << 0x20U) 
					    | (QData)((IData)(vlTOPp->SCIEPipelined__DOT__coeffs_0))) 
					   >> 0x20U)) 
				  >> 0x18U)) : ((0x2bU 
						 == 
						 (0x7fU 
						  & vlTOPp->insn))
						 ? 
						(0xffU 
						 & ((IData)(
							    ((((QData)((IData)(
									       VL_NEGATE_I((IData)(
										(1U 
										& (vlTOPp->SCIEPipelined__DOT__data_0 
										>> 0x1fU)))))) 
							       << 0x20U) 
							      | (QData)((IData)(vlTOPp->SCIEPipelined__DOT__data_0))) 
							     >> 0x20U)) 
						    >> 0x18U))
						 : 
						((0x5bU 
						  == 
						  (0x7fU 
						   & vlTOPp->insn))
						  ? 
						 (0xffU 
						  & VL_NEGATE_I((IData)(
									(1U 
									 & (IData)(
										(vlTOPp->SCIEPipelined__DOT___result_T_1 
										>> 0x3fU))))))
						  : 
						 (0xffU 
						  & ((IData)(
							     (vlTOPp->SCIEPipelined__DOT__result 
							      >> 0x20U)) 
						     >> 0x18U)))));
    __Vtemp12[1U] = ((IData)(vlTOPp->valid) ? ((0xbU 
						== 
						(0x7fU 
						 & vlTOPp->insn))
					        ? (
						   (0xffU 
						    & ((IData)(
							       (((QData)((IData)(
										VL_NEGATE_I((IData)(
										(1U 
										& (vlTOPp->SCIEPipelined__DOT__coeffs_0 
										>> 0x1fU)))))) 
								 << 0x20U) 
								| (QData)((IData)(vlTOPp->SCIEPipelined__DOT__coeffs_0)))) 
						       >> 0x18U)) 
						   | (0xffffff00U 
						      & ((IData)(
								 ((((QData)((IData)(
										VL_NEGATE_I((IData)(
										(1U 
										& (vlTOPp->SCIEPipelined__DOT__coeffs_0 
										>> 0x1fU)))))) 
								    << 0x20U) 
								   | (QData)((IData)(vlTOPp->SCIEPipelined__DOT__coeffs_0))) 
								  >> 0x20U)) 
							 << 8U)))
					        : __Vtemp8[1U])
		      : ((0xffU & ((IData)(vlTOPp->SCIEPipelined__DOT__result) 
				   >> 0x18U)) | (0xffffff00U 
						 & ((IData)(
							    (vlTOPp->SCIEPipelined__DOT__result 
							     >> 0x20U)) 
						    << 8U))));
    vlTOPp->SCIEPipelined__DOT___GEN_7[0U] = ((IData)(vlTOPp->valid)
					       ? __Vtemp10[0U]
					       : (0xffffff00U 
						  & ((IData)(vlTOPp->SCIEPipelined__DOT__result) 
						     << 8U)));
    vlTOPp->SCIEPipelined__DOT___GEN_7[1U] = __Vtemp12[1U];
    vlTOPp->SCIEPipelined__DOT___GEN_7[2U] = ((IData)(vlTOPp->valid)
					       ? __Vtemp10[2U]
					       : (0xffU 
						  & ((IData)(
							     (vlTOPp->SCIEPipelined__DOT__result 
							      >> 0x20U)) 
						     >> 0x18U)));
}

VL_INLINE_OPT void VSCIEPipelined::_combo__TOP__3(VSCIEPipelined__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSCIEPipelined::_combo__TOP__3\n"); );
    VSCIEPipelined* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Variables
    VL_SIGW(__Vtemp20,95,0,3);
    VL_SIGW(__Vtemp22,95,0,3);
    VL_SIGW(__Vtemp24,95,0,3);
    // Body
    __Vtemp20[1U] = ((0x2bU == (0x7fU & vlTOPp->insn))
		      ? ((0xffU & ((IData)((((QData)((IData)(
							     VL_NEGATE_I((IData)(
										(1U 
										& (vlTOPp->SCIEPipelined__DOT__data_0 
										>> 0x1fU)))))) 
					     << 0x20U) 
					    | (QData)((IData)(vlTOPp->SCIEPipelined__DOT__data_0)))) 
				   >> 0x18U)) | (0xffffff00U 
						 & ((IData)(
							    ((((QData)((IData)(
									       VL_NEGATE_I((IData)(
										(1U 
										& (vlTOPp->SCIEPipelined__DOT__data_0 
										>> 0x1fU)))))) 
							       << 0x20U) 
							      | (QData)((IData)(vlTOPp->SCIEPipelined__DOT__data_0))) 
							     >> 0x20U)) 
						    << 8U)))
		      : ((0x5bU == (0x7fU & vlTOPp->insn))
			  ? (IData)((vlTOPp->SCIEPipelined__DOT___result_T_1 
				     >> 0x20U)) : (
						   (0xffU 
						    & ((IData)(vlTOPp->SCIEPipelined__DOT__result) 
						       >> 0x18U)) 
						   | (0xffffff00U 
						      & ((IData)(
								 (vlTOPp->SCIEPipelined__DOT__result 
								  >> 0x20U)) 
							 << 8U)))));
    __Vtemp22[0U] = ((0xbU == (0x7fU & vlTOPp->insn))
		      ? (0xffffff00U & ((IData)((((QData)((IData)(
								  VL_NEGATE_I((IData)(
										(1U 
										& (vlTOPp->SCIEPipelined__DOT__coeffs_0 
										>> 0x1fU)))))) 
						  << 0x20U) 
						 | (QData)((IData)(vlTOPp->SCIEPipelined__DOT__coeffs_0)))) 
					<< 8U)) : (
						   (0x2bU 
						    == 
						    (0x7fU 
						     & vlTOPp->insn))
						    ? 
						   (0xffffff00U 
						    & ((IData)(
							       (((QData)((IData)(
										VL_NEGATE_I((IData)(
										(1U 
										& (vlTOPp->SCIEPipelined__DOT__data_0 
										>> 0x1fU)))))) 
								 << 0x20U) 
								| (QData)((IData)(vlTOPp->SCIEPipelined__DOT__data_0)))) 
						       << 8U))
						    : 
						   ((0x5bU 
						     == 
						     (0x7fU 
						      & vlTOPp->insn))
						     ? (IData)(vlTOPp->SCIEPipelined__DOT___result_T_1)
						     : 
						    (0xffffff00U 
						     & ((IData)(vlTOPp->SCIEPipelined__DOT__result) 
							<< 8U)))));
    __Vtemp22[2U] = ((0xbU == (0x7fU & vlTOPp->insn))
		      ? (0xffU & ((IData)(((((QData)((IData)(
							     VL_NEGATE_I((IData)(
										(1U 
										& (vlTOPp->SCIEPipelined__DOT__coeffs_0 
										>> 0x1fU)))))) 
					     << 0x20U) 
					    | (QData)((IData)(vlTOPp->SCIEPipelined__DOT__coeffs_0))) 
					   >> 0x20U)) 
				  >> 0x18U)) : ((0x2bU 
						 == 
						 (0x7fU 
						  & vlTOPp->insn))
						 ? 
						(0xffU 
						 & ((IData)(
							    ((((QData)((IData)(
									       VL_NEGATE_I((IData)(
										(1U 
										& (vlTOPp->SCIEPipelined__DOT__data_0 
										>> 0x1fU)))))) 
							       << 0x20U) 
							      | (QData)((IData)(vlTOPp->SCIEPipelined__DOT__data_0))) 
							     >> 0x20U)) 
						    >> 0x18U))
						 : 
						((0x5bU 
						  == 
						  (0x7fU 
						   & vlTOPp->insn))
						  ? 
						 (0xffU 
						  & VL_NEGATE_I((IData)(
									(1U 
									 & (IData)(
										(vlTOPp->SCIEPipelined__DOT___result_T_1 
										>> 0x3fU))))))
						  : 
						 (0xffU 
						  & ((IData)(
							     (vlTOPp->SCIEPipelined__DOT__result 
							      >> 0x20U)) 
						     >> 0x18U)))));
    __Vtemp24[1U] = ((IData)(vlTOPp->valid) ? ((0xbU 
						== 
						(0x7fU 
						 & vlTOPp->insn))
					        ? (
						   (0xffU 
						    & ((IData)(
							       (((QData)((IData)(
										VL_NEGATE_I((IData)(
										(1U 
										& (vlTOPp->SCIEPipelined__DOT__coeffs_0 
										>> 0x1fU)))))) 
								 << 0x20U) 
								| (QData)((IData)(vlTOPp->SCIEPipelined__DOT__coeffs_0)))) 
						       >> 0x18U)) 
						   | (0xffffff00U 
						      & ((IData)(
								 ((((QData)((IData)(
										VL_NEGATE_I((IData)(
										(1U 
										& (vlTOPp->SCIEPipelined__DOT__coeffs_0 
										>> 0x1fU)))))) 
								    << 0x20U) 
								   | (QData)((IData)(vlTOPp->SCIEPipelined__DOT__coeffs_0))) 
								  >> 0x20U)) 
							 << 8U)))
					        : __Vtemp20[1U])
		      : ((0xffU & ((IData)(vlTOPp->SCIEPipelined__DOT__result) 
				   >> 0x18U)) | (0xffffff00U 
						 & ((IData)(
							    (vlTOPp->SCIEPipelined__DOT__result 
							     >> 0x20U)) 
						    << 8U))));
    vlTOPp->SCIEPipelined__DOT___GEN_7[0U] = ((IData)(vlTOPp->valid)
					       ? __Vtemp22[0U]
					       : (0xffffff00U 
						  & ((IData)(vlTOPp->SCIEPipelined__DOT__result) 
						     << 8U)));
    vlTOPp->SCIEPipelined__DOT___GEN_7[1U] = __Vtemp24[1U];
    vlTOPp->SCIEPipelined__DOT___GEN_7[2U] = ((IData)(vlTOPp->valid)
					       ? __Vtemp22[2U]
					       : (0xffU 
						  & ((IData)(
							     (vlTOPp->SCIEPipelined__DOT__result 
							      >> 0x20U)) 
						     >> 0x18U)));
}

void VSCIEPipelined::_eval(VSCIEPipelined__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSCIEPipelined::_eval\n"); );
    VSCIEPipelined* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (((IData)(vlTOPp->clock) & (~ (IData)(vlTOPp->__Vclklast__TOP__clock)))) {
	vlTOPp->_sequent__TOP__1(vlSymsp);
	vlTOPp->__Vm_traceActivity = (2U | vlTOPp->__Vm_traceActivity);
    }
    vlTOPp->_combo__TOP__3(vlSymsp);
    // Final
    vlTOPp->__Vclklast__TOP__clock = vlTOPp->clock;
}

void VSCIEPipelined::_eval_initial(VSCIEPipelined__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSCIEPipelined::_eval_initial\n"); );
    VSCIEPipelined* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void VSCIEPipelined::final() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSCIEPipelined::final\n"); );
    // Variables
    VSCIEPipelined__Syms* __restrict vlSymsp = this->__VlSymsp;
    VSCIEPipelined* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void VSCIEPipelined::_eval_settle(VSCIEPipelined__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSCIEPipelined::_eval_settle\n"); );
    VSCIEPipelined* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_settle__TOP__2(vlSymsp);
}

VL_INLINE_OPT QData VSCIEPipelined::_change_request(VSCIEPipelined__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSCIEPipelined::_change_request\n"); );
    VSCIEPipelined* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void VSCIEPipelined::_eval_debug_assertions() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSCIEPipelined::_eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((clock & 0xfeU))) {
	Verilated::overWidthError("clock");}
    if (VL_UNLIKELY((valid & 0xfeU))) {
	Verilated::overWidthError("valid");}
}
#endif // VL_DEBUG

void VSCIEPipelined::_ctor_var_reset() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VSCIEPipelined::_ctor_var_reset\n"); );
    // Body
    clock = VL_RAND_RESET_I(1);
    valid = VL_RAND_RESET_I(1);
    insn = VL_RAND_RESET_I(32);
    rs1 = VL_RAND_RESET_I(32);
    rs2 = VL_RAND_RESET_I(32);
    rd = VL_RAND_RESET_I(32);
    SCIEPipelined__DOT__coeffs_0 = VL_RAND_RESET_I(32);
    SCIEPipelined__DOT__data_0 = VL_RAND_RESET_I(32);
    SCIEPipelined__DOT__result = VL_RAND_RESET_Q(64);
    SCIEPipelined__DOT___result_T_1 = VL_RAND_RESET_Q(64);
    VL_RAND_RESET_W(72,SCIEPipelined__DOT___GEN_7);
    __Vclklast__TOP__clock = VL_RAND_RESET_I(1);
    __Vm_traceActivity = VL_RAND_RESET_I(32);
}
