module subtractor (
    input [19:0] a,
    input [19:0] b,
    output [19:0] diff
);
    assign diff = a - b;
endmodule


