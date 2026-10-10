`timescale 1ns/1ps
module d_flip_flop_tb;
    reg clk;
    reg rst_n;
    reg d_in;
    wire q;
    d_flip_flop uut(
        .clk(clk),
        .rst_n(rst_n),
        .d_in(d_in),
        .q(q)
    );


    always #5 clk=~clk;
    initial begin
        $dumpfile("d_flip_flop.vcd");
        $dumpvars(0,d_flip_flop_tb);
        $display("Time\t clk\t rst_n\ t d_in\t q");
        $monitor("%0t\t %b\t %b\t %b\t %b" ,$time, clk , rst_n ,d_in ,q);


        clk=0;
        rst_n=0;
        d_in=0;

        #15 rst_n=1;


        #10 d_in=1;

        #10 d_in=0;
        #15 d_in=1;

        #12 rst_n=0;
        #10 rst_n=1;

        #20 $finish;
    end
endmodule