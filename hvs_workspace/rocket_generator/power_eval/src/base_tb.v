`timescale 1ns / 1ps
`define DATA 2000
`define ORDER 200
`define TYPE 2
`define BINARYPOINT 0

module base_tb;

    reg clock,reset;
    reg [31:0] data[`DATA:0], coeffs[`ORDER:0];
    reg [31:0] insn, rs1, rs2, mul_rs1, mul_rs2;
    //ALU vars
    reg [3:0] fn;
    reg dw;
    //reg [31:0] out, adder_out, cmp_out;

    //MultDiv vars
    reg io_req_valid, io_req_bits_dw, io_kill, io_resp_ready;
    reg [3:0]  io_req_bits_fn;
    reg [4:0]  io_req_bits_tag;

    integer res=0, curr_golden_value=0;
    reg [63:0] intermediate_res=0;

    wire io_resp_valid, io_req_ready;
    wire [31:0] io_resp_bits_data;
    wire [4:0] io_resp_bits_tag;

    wire [31:0] scie_output, dummy_output, alu_output, adder_output;
    wire cmp_output;

    integer input_data_file, input_coeff_file, golden_file, i=0, j=0;
    reg [8191:0] data_str, coeff_str, golden_str;

     always begin
        #7 clock=~clock;
    end

     system_top system_top( .clock(clock), .reset(reset), .insn(insn), .rs1(rs1), .rs2(rs2), .dw(dw), .fn(fn), .mul_rs1(mul_rs1), .mul_rs2(mul_rs2), .io_req_ready(io_req_ready), .io_req_valid(io_req_valid), .io_req_bits_fn(io_req_bits_fn), .io_req_bits_dw(io_req_bits_dw), .io_req_bits_tag(io_req_bits_tag), .io_kill(io_kill), .io_resp_ready(io_resp_ready), .io_resp_valid(io_resp_valid), .io_resp_bits_data(io_resp_bits_data), .io_resp_bits_tag(io_resp_bits_tag), .scie_result(scie_output), .dummy_result(dummy_output), .alu_result(alu_output), .adder_result(adder_output), .cmp_result(cmp_output));

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
                 $sformat(golden_str, "/home/specs/Desktop/specs-chisel/hvs_workspace/rocket_generator/power_eval/golden_results/golden_type=signed_data=%0d_order=%0d.txt", `DATA, `ORDER );
            end
            2'b10, 2'b11: begin
                 $sformat(data_str, "/home/specs/Desktop/specs-chisel/hvs_workspace/rocket_generator/power_eval/hdl_arrays/data_fixed_point.txt");
                 $sformat(coeff_str, "/home/specs/Desktop/specs-chisel/hvs_workspace/rocket_generator/power_eval/hdl_arrays/coeffs_fixed_point.txt");
                 $sformat(golden_str, "/home/specs/Desktop/specs-chisel/hvs_workspace/rocket_generator/power_eval/golden_results/golden_type=fixed_point_data=%0d_order=%0d.txt", `DATA, `ORDER );
            end
         endcase

         i=0;

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

        clock<=0;
        #10
        reset<=1;
        #50
        reset<=0;

        golden_file=$fopen(golden_str, "r");

        for(i=0; i < `DATA; i = i + 1)begin
            res=0;
            for(j=0; j < `ORDER; j = j + 1) begin
               if(`TYPE == 2) begin
		    if(i - j >= 0) begin
                    rs1=i;
                    rs2=j;
                    fn=10;
                    #10
                    $display("ALU output --> %d\n", alu_output);
                    io_kill <= 0;
                    mul_rs1=coeffs[j];
                    mul_rs2=data[alu_output];
                    io_req_bits_fn<=0;
                    io_req_valid<=1;
                    $display("coeffs -> %0d\n", coeffs[j]);
                    $display("data --> %0d\n", data[alu_output]);
                    io_resp_ready<=1;
                    @(posedge io_resp_valid)begin
                    $display("Multiplier output --> %d\n", io_resp_bits_data);
                    rs1=io_resp_bits_data;
                    rs2=`BINARYPOINT;
                    fn=5;
                    #10;
                    res=res+alu_output;
                    end
		end
               end else begin
                if(i - j >= 0) begin
                    rs1=i;
                    rs2=j;
                    fn=10;
                    #10
                    $display("ALU output --> %d\n", alu_output);
                    io_kill <= 0;
                    mul_rs1=coeffs[j];
                    mul_rs2=data[alu_output];
                    io_req_bits_fn<=0;
                    io_req_valid<=1;
                    $display("coeffs -> %0d\n", coeffs[j]);
                    $display("data --> %0d\n", data[alu_output]);
                    io_resp_ready<=1;
                    @(posedge io_resp_valid)begin
                    $display("Multiplier output --> %d\n\n\n", io_resp_bits_data);
                    res=res+io_resp_bits_data;
                    io_req_valid<=0;
                    io_resp_ready<=0;
                    end
                end
                end
            end
              $fscanf(golden_file, "%d", curr_golden_value);
              $display("Obtained result --> %0d\n", res);
              $display("Golden result --> %0d\n", curr_golden_value);
              if(res == curr_golden_value) $display("Success\n\n");
              else $display("Failure\n\n");
         end
          $fclose(golden_file);
          $finish;

         end


endmodule

