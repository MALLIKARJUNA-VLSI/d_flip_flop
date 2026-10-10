module d_flip_flop(
    input wire clk,
    input wire rst_n,
    input wire d_in,
    output reg q
);
    always @(posedge clk or negedge rst_n)begin
        if (!rst_n)begin
           q<=1'b0;
        end else begin
           q<=d_in;
        end
    end
endmodule