
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name ddr_hw_test -dir "D:/Projects/FPGA/ddr_hw_test/planAhead_run_1" -part xc6slx9csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/Projects/FPGA/ddr_hw_test/ddr_hw_test.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/Projects/FPGA/ddr_hw_test} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "ddr_hw_test.ucf" [current_fileset -constrset]
add_files [list {ddr_hw_test.ucf}] -fileset [get_property constrset [current_run]]
link_design
