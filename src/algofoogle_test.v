module tt_um_algofoogle_test(
    // 8 dedicated user inputs:
    input   wire [7:0]  ui_in,

    // 8 dedicated user outputs:
    output  wire [7:0]  uo_out,

    // 8 bidirectional user IOs:
    input   wire [7:0]  uio_in,     // Input path.
    output  wire [7:0]  uio_out,    // Output path.
    output  wire [7:0]  uio_oe,     // Enable path (active high: 0=input, 1=output)

    // Control:
    input   wire        ena,        // Can be ignored for now.
    input   wire        clk,        // 25.175MHz ideal, but 25.000MHz is good enough.
    input   wire        rst_n       // Active low reset
);

    reg [255:0] counter;

    assign uo_out = { counter[255:252], counter[3:0] };

    assign uio_oe = 0;

    always @(posedge clk) begin
        if (~rst_n)
            counter <= 0;
        else
            counter <= counter + 1'b1;
    end

endmodule
