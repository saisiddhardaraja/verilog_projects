module tb;
  reg clk,rst;
  reg [7:0] duty,dead_time;
  wire pwm_A,pwm_B;
  
  pwm_design u1(.clk(clk),.rst(rst),.dead_time(dead_time),.duty(duty),.pwm_A(pwm_A),.pwm_B(pwm_B));
  
  initial begin
    clk=1'b0;
    rst=1'b1;
    u1.count=8'd0;
    u1.count1=8'd0;
  end
  always #5 clk=~clk;
  initial begin
    $dumpfile("pwm.vcd");
    $dumpvars(0,tb);
    $display(" clk, rst, dead_time, duty, count, active, count1, pwm_A, pwm_B"); 
    $monitor(" %b,   %b,   %d,      %d,   %d,     %b,   %d,     %b,     %b",clk, rst, dead_time, duty, u1.count, u1.active, u1.count1, pwm_A, pwm_B);
    rst=1;#5;rst=0;
    duty=10;dead_time=15;#2550;
    rst=1;#5;rst=0;
    duty=20;dead_time=5;#2550;
    $finish;
  end
endmodule
