# file: simcmds.tcl

# create the simulation script
vcd dumpfile isim.vcd
vcd dumpvars -m /ddr_clk_mod_tb -l 0
wave add /
run 50000ns
quit

