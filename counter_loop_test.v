module counter_loop (Buffer_out,bd_rate,d_num,s_num,par,rst,clk,Send_flag,RX_IN,TX_out,data_in,RXready,TXready,error);
  
  wire clk_out_RX,clk_out_TX,CLKstretch;
  
  output [7:0]Buffer_out;
  input bd_rate ;
  input d_num ;
  input s_num ;
  input par  ;
  input rst,clk,Send_flag,RX_IN;          ////////////only physical inputs //rst and enable
  output TX_out;                         ////////////only physical outputs
  input [7:0] data_in;  //output OUT;
  output RXready,TXready,error;
  
  RX_div RX_div1(clk,rst,bd_rate,clk_out_RX);
  TX_div TX_div1(clk,rst,bd_rate,clk_out_TX,CLKstretch);
  
  UART_RX UART_RX11(clk_out_RX,rst,RX_IN,d_num,s_num,par,RXready,Buffer_out,error);
  UART_Tx  UART_Tx1(rst, clk_out_TX,~Send_flag, TX_out, TXready, data_in, d_num, s_num, par,CLKstretch);
  
  //assign data_in = Buffer_out + 1;
  
  
endmodule