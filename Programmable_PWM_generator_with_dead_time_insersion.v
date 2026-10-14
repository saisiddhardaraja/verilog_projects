module pwm_design (duty,pwm_A,pwm_B,clk,rst,dead_time);
  
  input clk,rst;
  input [7:0]dead_time;
  input [7:0] duty;
  output reg pwm_A,pwm_B;
  
  reg [7:0] turn_on,count,count1;
  reg active,pwm_ref,pwm_past;
  parameter counter=255;

  always@(posedge clk or posedge rst) begin 
    if(rst) begin   //reset
      pwm_ref<=1'd1;
      pwm_past<=1'd0;
      pwm_A<=1'b0;
      pwm_B<=1'b1;
      count<=8'd0;
      count1<=8'd0;
      active<=1'b0;
      turn_on=8'd0;
    end
    
    else begin
      if(active) begin
        count1<=count1+1;
        pwm_A<=1'b0;
        pwm_B<=1'b0;
        if(count1==dead_time-1) begin
          active<=1'b0;
          count1<=0;
        end
      end
      else begin
        count<=count+1;
        turn_on=(counter*duty)/100;
        pwm_ref<=(count<turn_on);
        pwm_past<=pwm_ref;
        if(pwm_ref!=pwm_past) begin
          active<=1'b1;
          count1<=1'b0;
        end
        else begin
          count1<=8'd0;
          if(pwm_ref) begin
            pwm_A<=1'b1;
            pwm_B<=1'b0;
          end
          else begin
            pwm_A<=1'b0;
            pwm_B<=1'b1;
          end
        end 
      end
    end
  end   

endmodule
