
/////////////////////////////////////////////////////////////
//////////////// MUX BASED DATA synchronizer ////////////////
/////////////////////////////////////////////////////////////

module DATA_SYNC # ( parameter SYNC_TYPE  = 1 )
(
input    wire                      CLK,
input    wire                      RST,
input    wire     [7:0]            unsync_bus,
input    wire                      bus_enable,
output   wire      [7:0]           sync_bus,
output   wire                      enable_pulse
);


 generate 
   case (SYNC_TYPE) 
     0 : BIT_SYNC # ( .NUM_STAGES(2),
	          .BUS_WIDTH(8))
         U0_BIT_SYNC (
                      .CLK(CLK), 
                      .RST(RST), 
                      .ASYNC(unsync_bus),
                      .SYNC(sync_bus));

     1 : MUX_SYNC # ( .NUM_STAGES(2), 
                      .BUS_WIDTH(8)) 
         U0_MUX_SYNC (.CLK(CLK), 
                      .RST(RST), 
                      .unsync_bus(unsync_bus),
                      .bus_enable(bus_enable), 
                      .sync_bus(sync_bus),
                      .enable_pulse_d(enable_pulse)) ;
   endcase
 endgenerate



endmodule
