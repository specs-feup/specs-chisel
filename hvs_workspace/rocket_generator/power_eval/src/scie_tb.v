`timescale 1ns / 1ps
`define DATA 2000
`define ORDER 200
`define TYPE 2

module scie_tb;

    reg clock,reset;
    reg [31:0] data[`DATA:0], coeffs[`ORDER:0];
    reg [31:0] insn, rs1, rs2;
    //ALU vars
    reg [3:0] fn;
    reg dw;
    //reg [31:0] out, adder_out, cmp_out;

    //MultDiv vars
    reg io_req_valid, io_req_bits_dw, io_kill, io_resp_ready;
    reg [3:0]  io_req_bits_fn;
    reg [4:0]  io_req_bits_tag;

    integer res=0, curr_golden_value=0;

    wire io_resp_valid, io_req_ready;
    wire [31:0] io_resp_bits_data;
    wire [4:0] io_resp_bits_tag;

    wire [31:0] scie_output, dummy_output, alu_output, adder_output;
    wire cmp_output;

    integer input_data_file, input_coeff_file, golden_file, i=0, j=0;
    reg [8191:0] data_str, coeff_str, golden_str;


    always begin
        #14 clock=~clock;
    end


    system_top system_top( .clock(clock), .reset(reset), .insn(insn), .rs1(rs1), .rs2(rs2), .dw(dw), .fn(fn), .io_req_ready(io_req_ready), .io_req_valid(io_req_valid), .io_req_bits_fn(io_req_bits_fn), .io_req_bits_dw(io_req_bits_dw), .io_req_bits_tag(io_req_bits_tag), .io_kill(io_kill), .io_resp_ready(io_resp_ready), .io_resp_valid(io_resp_valid), .io_resp_bits_data(io_resp_bits_data), .io_resp_bits_tag(io_resp_bits_tag), .scie_result(scie_output), .dummy_result(dummy_output), .alu_result(alu_output), .adder_result(adder_output), .cmp_result(cmp_output));


    initial begin
        case(`TYPE)
            2'b00: begin
                 $sformat(data_str, "/home/specs/Desktop/specs-chisel/hvs_workspace/rocket_generator/power_eval/hdl_arrays/data_unsigned.txt");
                 $sformat(coeff_str, "/home/specs/Desktop/specs-chisel/hvs_workspace/rocket_generator/power_eval/hdl_arrays/coeffs_unsigned.txt");
                 $sformat(golden_str, "/home/specs/Desktop/specs-chisel/hvs_workspace/rocket_generator/power_eval/golden_results/golden_type=unsigned_data=%0d_order=%0d.txt", `DATA, `ORDER);
            end
            2'b01: begin
                 $sformat(data_str, "/home/specs/Desktop/specs-chisel/hvs_workspace/rocket_generator/power_eval/hdl_arrays/data_signed.txt");
                 $sformat(coeff_str, "/home/specs/Desktop/specs-chisel/hvs_workspace/rocket_generator/power_eval/hdl_arrays/coeffs_signed.txt");
                 $sformat(golden_str, "/home/specs/Desktop/specs-chisel/hvs_workspace/rocket_generator/power_eval/golden_results/golden_type=signed_data=%0d_order=%0d.txt", `DATA, `ORDER);
            end
            2'b10, 2'b11: begin
                 $sformat(data_str, "/home/specs/Desktop/specs-chisel/hvs_workspace/rocket_generator/power_eval/hdl_arrays/data_fixed_point.txt");
                 $sformat(coeff_str, "/home/specs/Desktop/specs-chisel/hvs_workspace/rocket_generator/power_eval/hdl_arrays/coeffs_fixed_point.txt");
                 $sformat(golden_str, "/home/specs/Desktop/specs-chisel/hvs_workspace/rocket_generator/power_eval/golden_results/golden_type=fixed_point_data=%0d_order=%0d.txt", `DATA, `ORDER);
            end
         endcase

         input_data_file=$fopen(data_str, "r");
         while(i < `DATA) begin
            $fscanf(input_data_file, "%d", data[i]);
            i = i + 1;
         end
         $fclose(input_data_file);

         input_coeff_file=$fopen(coeff_str, "r");
         i = 0;

         while(i < `ORDER) begin
            $fscanf(input_coeff_file, "%d", coeffs[i]);
            i = i + 1;
         end
         $fclose(input_coeff_file);

         clock <= 0;
         reset <=1;
         #200;
         reset <=0;

         for(i=0; i < `ORDER; i=i+1)begin
            #50
            insn=7'h0b;
            rs1=coeffs[i];
            rs2=i;
            #50;
         end

         golden_file=$fopen(golden_str, "r");

         for(i=0; i < `DATA; i=i+1)begin
            insn=7'h2b;
            rs1=data[i];
            #40
            insn=7'h3b;
            #87
            $fscanf(golden_file, "%d", curr_golden_value);
            $display("Obtained result --> %0d\n", scie_output);
            $display("Golden result --> %0d\n", curr_golden_value);
            if(scie_output == curr_golden_value) $display("Success\n\n");
            else $display("Failure\n\n");
         end
         $fclose(golden_file);
         #100;
         $finish;
    end



endmodule
