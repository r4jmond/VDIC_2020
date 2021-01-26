/******************************************************************************
* DVT CODE TEMPLATE: package
* Created by dorlowski on Jan 26, 2021
* uvc_company = do, uvc_name = alu
*******************************************************************************/

package do_alu_pkg;
import uvm_pkg::*;
	`include "uvm_macros.svh"

typedef enum bit[2:0] {
	no_op_test		 = 3'b000,
	and_op_test		 = 3'b001,
	or_op_test 		 = 3'b010,
	add_op_test 	 = 3'b011,
	sub_op_test 	 = 3'b100,
	rst_op_test 	 = 3'b101,
	bad_data_op_test = 3'b110,
	bad_crc_op_test  = 3'b111
} tester_op_t;

typedef enum bit[2:0] {
	and_opcode		= 3'b000,
	or_opcode 		= 3'b001,
	add_opcode 		= 3'b100,
	sub_opcode 		= 3'b101,
	no_opcode 		= 3'b111
} opcode_t;
	
typedef enum bit [1:0] {
	DATA = 2'b00,
	CTL = 2'b10,
	ERR = 2'b11
} byte_type_t;
	
function bit [2:0] calc_crc_3b(input bit [36:0] data_in);

  	static bit [2:0] lfsr_q = 3'b000;
	bit [2:0] crc_out;

	crc_out[0] = lfsr_q[1] ^ data_in[0] ^ data_in[2] ^ data_in[3] ^ data_in[4] ^ data_in[7] ^ data_in[9] ^ data_in[10] ^ data_in[11] ^ data_in[14] ^ data_in[16] ^ data_in[17] ^ data_in[18] ^ data_in[21] ^ data_in[23] ^ data_in[24] ^ data_in[25] ^ data_in[28] ^ data_in[30] ^ data_in[31] ^ data_in[32] ^ data_in[35];
    crc_out[1] = lfsr_q[1] ^ lfsr_q[2] ^ data_in[0] ^ data_in[1] ^ data_in[2] ^ data_in[5] ^ data_in[7] ^ data_in[8] ^ data_in[9] ^ data_in[12] ^ data_in[14] ^ data_in[15] ^ data_in[16] ^ data_in[19] ^ data_in[21] ^ data_in[22] ^ data_in[23] ^ data_in[26] ^ data_in[28] ^ data_in[29] ^ data_in[30] ^ data_in[33] ^ data_in[35] ^ data_in[36];
    crc_out[2] = lfsr_q[0] ^ lfsr_q[2] ^ data_in[1] ^ data_in[2] ^ data_in[3] ^ data_in[6] ^ data_in[8] ^ data_in[9] ^ data_in[10] ^ data_in[13] ^ data_in[15] ^ data_in[16] ^ data_in[17] ^ data_in[20] ^ data_in[22] ^ data_in[23] ^ data_in[24] ^ data_in[27] ^ data_in[29] ^ data_in[30] ^ data_in[31] ^ data_in[34] ^ data_in[36];
    
	return crc_out;
	
endfunction

function bit [3:0] calc_crc_4b(input bit [67:0] data_in);

  	static bit [3:0] lfsr_q = 4'b0000;
	bit [3:0] crc_out;

    crc_out[0] = lfsr_q[0] ^ lfsr_q[2] ^ data_in[0] ^ data_in[3] ^ data_in[4] ^ data_in[6] ^ data_in[8] ^ data_in[9] ^ data_in[10] ^ data_in[11] ^ data_in[15] ^ data_in[18] ^ data_in[19] ^ data_in[21] ^ data_in[23] ^ data_in[24] ^ data_in[25] ^ data_in[26] ^ data_in[30] ^ data_in[33] ^ data_in[34] ^ data_in[36] ^ data_in[38] ^ data_in[39] ^ data_in[40] ^ data_in[41] ^ data_in[45] ^ data_in[48] ^ data_in[49] ^ data_in[51] ^ data_in[53] ^ data_in[54] ^ data_in[55] ^ data_in[56] ^ data_in[60] ^ data_in[63] ^ data_in[64] ^ data_in[66];
    crc_out[1] = lfsr_q[1] ^ lfsr_q[2] ^ lfsr_q[3] ^ data_in[0] ^ data_in[1] ^ data_in[3] ^ data_in[5] ^ data_in[6] ^ data_in[7] ^ data_in[8] ^ data_in[12] ^ data_in[15] ^ data_in[16] ^ data_in[18] ^ data_in[20] ^ data_in[21] ^ data_in[22] ^ data_in[23] ^ data_in[27] ^ data_in[30] ^ data_in[31] ^ data_in[33] ^ data_in[35] ^ data_in[36] ^ data_in[37] ^ data_in[38] ^ data_in[42] ^ data_in[45] ^ data_in[46] ^ data_in[48] ^ data_in[50] ^ data_in[51] ^ data_in[52] ^ data_in[53] ^ data_in[57] ^ data_in[60] ^ data_in[61] ^ data_in[63] ^ data_in[65] ^ data_in[66] ^ data_in[67];
    crc_out[2] = lfsr_q[0] ^ lfsr_q[2] ^ lfsr_q[3] ^ data_in[1] ^ data_in[2] ^ data_in[4] ^ data_in[6] ^ data_in[7] ^ data_in[8] ^ data_in[9] ^ data_in[13] ^ data_in[16] ^ data_in[17] ^ data_in[19] ^ data_in[21] ^ data_in[22] ^ data_in[23] ^ data_in[24] ^ data_in[28] ^ data_in[31] ^ data_in[32] ^ data_in[34] ^ data_in[36] ^ data_in[37] ^ data_in[38] ^ data_in[39] ^ data_in[43] ^ data_in[46] ^ data_in[47] ^ data_in[49] ^ data_in[51] ^ data_in[52] ^ data_in[53] ^ data_in[54] ^ data_in[58] ^ data_in[61] ^ data_in[62] ^ data_in[64] ^ data_in[66] ^ data_in[67];
    crc_out[3] = lfsr_q[1] ^ lfsr_q[3] ^ data_in[2] ^ data_in[3] ^ data_in[5] ^ data_in[7] ^ data_in[8] ^ data_in[9] ^ data_in[10] ^ data_in[14] ^ data_in[17] ^ data_in[18] ^ data_in[20] ^ data_in[22] ^ data_in[23] ^ data_in[24] ^ data_in[25] ^ data_in[29] ^ data_in[32] ^ data_in[33] ^ data_in[35] ^ data_in[37] ^ data_in[38] ^ data_in[39] ^ data_in[40] ^ data_in[44] ^ data_in[47] ^ data_in[48] ^ data_in[50] ^ data_in[52] ^ data_in[53] ^ data_in[54] ^ data_in[55] ^ data_in[59] ^ data_in[62] ^ data_in[63] ^ data_in[65] ^ data_in[67];

	return crc_out;
	
endfunction
	
//TODO ALWAYS CHECK THIS WHEN ADDING NEW FILES

	// Configuration object
	`include "do_alu_config_obj.svh"
	// Sequence item
	`include "do_alu_item.svh"
	// Monitor
	`include "do_alu_monitor.svh"
	// Coverage Collector
	`include "do_alu_coverage_collector.svh"
	// Driver
	`include "do_alu_driver.svh"
	// Sequencer
	`include "do_alu_sequencer.svh"
	// Agent
	`include "do_alu_agent.svh"
	// Environment
	`include "do_alu_env.svh"
	// Sequence library
	`include "do_alu_seq_lib.svh"
	// Base test
	`include "do_alu_base_test.svh"
	// Example test
	`include "do_alu_example_test.svh"

endpackage : do_alu_pkg
