/*
   This file was generated automatically by the Mojo IDE version B1.3.5.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip,
    input button,
    input reset_btn
  );
  
  
  
  reg rst;
  
  reg sclk;
  
  wire [1-1:0] M_alu1_overadd;
  wire [8-1:0] M_alu1_alu;
  wire [1-1:0] M_alu1_z;
  wire [1-1:0] M_alu1_v;
  wire [1-1:0] M_alu1_n;
  reg [6-1:0] M_alu1_alufn;
  reg [8-1:0] M_alu1_a;
  reg [8-1:0] M_alu1_b;
  alu_1 alu1 (
    .alufn(M_alu1_alufn),
    .a(M_alu1_a),
    .b(M_alu1_b),
    .overadd(M_alu1_overadd),
    .alu(M_alu1_alu),
    .z(M_alu1_z),
    .v(M_alu1_v),
    .n(M_alu1_n)
  );
  
  reg mybutton;
  
  wire [1-1:0] M_slowclk_value;
  counter_2 slowclk (
    .clk(clk),
    .rst(rst),
    .value(M_slowclk_value)
  );
  wire [1-1:0] M_slow2clk_value;
  counter_3 slow2clk (
    .clk(clk),
    .rst(rst),
    .value(M_slow2clk_value)
  );
  wire [1-1:0] M_slow3clk_value;
  counter_4 slow3clk (
    .clk(clk),
    .rst(rst),
    .value(M_slow3clk_value)
  );
  wire [1-1:0] M_slow4clk_value;
  counter_5 slow4clk (
    .clk(clk),
    .rst(rst),
    .value(M_slow4clk_value)
  );
  wire [1-1:0] M_slow5clk_value;
  counter_6 slow5clk (
    .clk(clk),
    .rst(rst),
    .value(M_slow5clk_value)
  );
  reg [7:0] M_lightout_d, M_lightout_q = 1'h0;
  reg [7:0] M_lightdbg_d, M_lightdbg_q = 1'h0;
  wire [3-1:0] M_xcount_count;
  reg [1-1:0] M_xcount_button;
  xcounter_7 xcount (
    .clk(clk),
    .rst(rst),
    .button(M_xcount_button),
    .count(M_xcount_count)
  );
  wire [7-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [16-1:0] M_seg_values;
  multi_seven_seg_8 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  wire [16-1:0] M_dectr_digits;
  reg [1-1:0] M_dectr_inc;
  multi_dec_ctr_9 dectr (
    .clk(clk),
    .rst(rst),
    .inc(M_dectr_inc),
    .digits(M_dectr_digits)
  );
  wire [1-1:0] M_edge_detector_out;
  reg [1-1:0] M_edge_detector_in;
  edge_detector_10 edge_detector (
    .clk(clk),
    .in(M_edge_detector_in),
    .out(M_edge_detector_out)
  );
  wire [1-1:0] M_btn_cond_out;
  reg [1-1:0] M_btn_cond_in;
  button_conditioner_11 btn_cond (
    .clk(clk),
    .in(M_btn_cond_in),
    .out(M_btn_cond_out)
  );
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_12 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  
  wire [8-1:0] M_regs_out;
  reg [1-1:0] M_regs_en;
  reg [8-1:0] M_regs_data;
  register_13 regs (
    .clk(sclk),
    .rst(rst),
    .en(M_regs_en),
    .data(M_regs_data),
    .out(M_regs_out)
  );
  localparam START_testshift = 4'd0;
  localparam SL1_testshift = 4'd1;
  localparam SL2_testshift = 4'd2;
  localparam SL3_testshift = 4'd3;
  localparam SL4_testshift = 4'd4;
  localparam SL5_testshift = 4'd5;
  localparam CHECK2_testshift = 4'd6;
  localparam CHECK3_testshift = 4'd7;
  localparam CHECK4_testshift = 4'd8;
  localparam CHECK5_testshift = 4'd9;
  localparam BUTTON_testshift = 4'd10;
  localparam END_testshift = 4'd11;
  
  reg [3:0] M_testshift_d, M_testshift_q = START_testshift;
  
  always @* begin
    M_testshift_d = M_testshift_q;
    M_lightdbg_d = M_lightdbg_q;
    
    if (io_dip[0+0+0-:1] == 1'h1) begin
      sclk = M_slowclk_value;
    end else begin
      if (io_dip[0+1+0-:1] == 1'h1) begin
        sclk = M_slow2clk_value;
      end else begin
        if (io_dip[0+2+0-:1] == 1'h1) begin
          sclk = M_slow3clk_value;
        end else begin
          if (io_dip[0+3+0-:1] == 1'h1) begin
            sclk = M_slow4clk_value;
          end else begin
            if (io_dip[0+4+0-:1] == 1'h1) begin
              sclk = M_slow5clk_value;
            end else begin
              sclk = M_slowclk_value;
            end
          end
        end
      end
    end
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    M_btn_cond_in = button;
    M_edge_detector_in = M_btn_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_led = 24'h000000;
    io_seg = ~M_seg_seg;
    io_sel = ~M_seg_sel;
    mybutton = ~button;
    M_xcount_button = !mybutton;
    M_edge_detector_in = M_xcount_count;
    M_dectr_inc = M_edge_detector_out;
    M_seg_values = M_dectr_digits;
    M_alu1_alufn = 6'h20;
    M_alu1_b = 1'h1;
    M_alu1_a = M_regs_out;
    M_regs_data = M_alu1_alu;
    M_lightdbg_d = M_regs_out;
    io_led[8+7-:8] = M_lightdbg_q;
    M_regs_en = 1'h0;
    
    case (M_testshift_q)
      START_testshift: begin
        M_regs_data = 8'h01;
        M_regs_en = 1'h1;
        M_testshift_d = SL1_testshift;
      end
      SL1_testshift: begin
        M_regs_en = 1'h1;
        sclk = M_slowclk_value;
        if (M_regs_out == 8'h80) begin
          M_regs_data = 8'h01;
        end
        if (mybutton) begin
          M_testshift_d = BUTTON_testshift;
        end
      end
      SL2_testshift: begin
        M_regs_en = 1'h1;
        sclk = M_slow2clk_value;
        if (M_regs_out == 8'h80) begin
          M_regs_data = 8'h01;
        end
        if (mybutton) begin
          M_testshift_d = CHECK2_testshift;
        end
      end
      SL3_testshift: begin
        M_regs_en = 1'h1;
        sclk = M_slow3clk_value;
        if (M_regs_out == 8'h80) begin
          M_regs_data = 8'h01;
        end
        if (mybutton) begin
          M_testshift_d = CHECK3_testshift;
        end
      end
      SL4_testshift: begin
        M_regs_en = 1'h1;
        sclk = M_slow4clk_value;
        if (M_regs_out == 8'h80) begin
          M_regs_data = 8'h01;
        end
        if (mybutton) begin
          M_testshift_d = CHECK4_testshift;
        end
      end
      SL5_testshift: begin
        M_regs_en = 1'h1;
        sclk = M_slow4clk_value;
        if (M_regs_out == 8'h80) begin
          M_regs_data = 8'h01;
        end
        if (mybutton) begin
          M_testshift_d = CHECK5_testshift;
        end
      end
      BUTTON_testshift: begin
        M_regs_en = 1'h0;
        if (M_regs_out == 8'h20) begin
          M_testshift_d = SL2_testshift;
        end else begin
          M_testshift_d = END_testshift;
        end
      end
      CHECK2_testshift: begin
        M_regs_en = 1'h0;
        if (M_regs_out == 8'h20) begin
          M_testshift_d = SL3_testshift;
        end else begin
          M_testshift_d = END_testshift;
        end
      end
      CHECK3_testshift: begin
        M_regs_en = 1'h0;
        if (M_regs_out == 8'h20) begin
          M_testshift_d = SL4_testshift;
        end else begin
          M_testshift_d = END_testshift;
        end
      end
      CHECK4_testshift: begin
        M_regs_en = 1'h0;
        if (M_regs_out == 8'h20) begin
          M_testshift_d = SL5_testshift;
        end else begin
          M_testshift_d = END_testshift;
        end
      end
      CHECK5_testshift: begin
        M_regs_en = 1'h0;
        if (M_regs_out == 8'h20) begin
          M_testshift_d = END_testshift;
        end else begin
          M_testshift_d = END_testshift;
        end
      end
      END_testshift: begin
        M_regs_data = 8'hff;
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_lightout_q <= 1'h0;
      M_lightdbg_q <= 1'h0;
    end else begin
      M_lightout_q <= M_lightout_d;
      M_lightdbg_q <= M_lightdbg_d;
    end
  end
  
  
  always @(posedge sclk) begin
    if (rst == 1'b1) begin
      M_testshift_q <= 1'h0;
    end else begin
      M_testshift_q <= M_testshift_d;
    end
  end
  
endmodule
