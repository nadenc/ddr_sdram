
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name ddr_hw_test -dir "D:/Google Drive/Projects/FPGA/ddr_sdram/ddr_hw_test/planAhead_run_3" -part xc6slx9csg324-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "ddr_hw_test.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {../ipcore_dir/ddr_clk_mod.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../ddr_sdram.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ddr_hw_test.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top ddr_hw_test $srcset
add_files [list {ddr_hw_test.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx9csg324-3
