// rom_64x16.v
// 64x16 ROM with SDF-friendly port names used in bb_proc.v
// Q  = data out [15:0]
// CLK = clock
// CEN = chip enable (active low in many macros; we’ll treat 0 = enable)
// A  = address [5:0]
module rom_64x16 (
  output reg [15:0] Q,
  input  wire       CLK,
  input  wire       CEN,
  input  wire [5:0] A
);
  reg [15:0] mem [0:63];
  initial begin
    // Hex file with 64 lines of 16-bit words
    $readmemh("rom_code.txt", mem);
  end

  always @(posedge CLK) begin
    if (CEN == 1'b0) begin
      Q <= mem[A];
    end
    // else hold last value
  end
endmodule
