set projDir "C:/Users/1001721/Documents/mojo/light bulbs/work/planAhead"
set projName "light bulbs"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/1001721/Documents/mojo/light bulbs/work/verilog/mojo_top_0.v" "C:/Users/1001721/Documents/mojo/light bulbs/work/verilog/alu_1.v" "C:/Users/1001721/Documents/mojo/light bulbs/work/verilog/counter_2.v" "C:/Users/1001721/Documents/mojo/light bulbs/work/verilog/reset_conditioner_3.v" "C:/Users/1001721/Documents/mojo/light bulbs/work/verilog/register_4.v" "C:/Users/1001721/Documents/mojo/light bulbs/work/verilog/adder_5.v" "C:/Users/1001721/Documents/mojo/light bulbs/work/verilog/compare_6.v" "C:/Users/1001721/Documents/mojo/light bulbs/work/verilog/boolean_7.v" "C:/Users/1001721/Documents/mojo/light bulbs/work/verilog/shifter_8.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list  "C:/Program\ Files/Mojo\ IDE/library/components/io_shield.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
