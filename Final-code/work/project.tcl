set projDir "C:/Users/elainejomane/Desktop/sharan-mojotest/work/planAhead"
set projName "MOJOTESTING"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/elainejomane/Desktop/sharan-mojotest/work/verilog/mojo_top_0.v" "C:/Users/elainejomane/Desktop/sharan-mojotest/work/verilog/alu_1.v" "C:/Users/elainejomane/Desktop/sharan-mojotest/work/verilog/counter_2.v" "C:/Users/elainejomane/Desktop/sharan-mojotest/work/verilog/counter_3.v" "C:/Users/elainejomane/Desktop/sharan-mojotest/work/verilog/counter_4.v" "C:/Users/elainejomane/Desktop/sharan-mojotest/work/verilog/counter_5.v" "C:/Users/elainejomane/Desktop/sharan-mojotest/work/verilog/counter_6.v" "C:/Users/elainejomane/Desktop/sharan-mojotest/work/verilog/xcounter_7.v" "C:/Users/elainejomane/Desktop/sharan-mojotest/work/verilog/multi_seven_seg_8.v" "C:/Users/elainejomane/Desktop/sharan-mojotest/work/verilog/multi_decimal_counter_9.v" "C:/Users/elainejomane/Desktop/sharan-mojotest/work/verilog/edge_detector_10.v" "C:/Users/elainejomane/Desktop/sharan-mojotest/work/verilog/button_conditioner_11.v" "C:/Users/elainejomane/Desktop/sharan-mojotest/work/verilog/reset_conditioner_12.v" "C:/Users/elainejomane/Desktop/sharan-mojotest/work/verilog/register_13.v" "C:/Users/elainejomane/Desktop/sharan-mojotest/work/verilog/adder_14.v" "C:/Users/elainejomane/Desktop/sharan-mojotest/work/verilog/compare_15.v" "C:/Users/elainejomane/Desktop/sharan-mojotest/work/verilog/boolean_16.v" "C:/Users/elainejomane/Desktop/sharan-mojotest/work/verilog/shifter_17.v" "C:/Users/elainejomane/Desktop/sharan-mojotest/work/verilog/edge_detector_18.v" "C:/Users/elainejomane/Desktop/sharan-mojotest/work/verilog/button_conditioner_11.v" "C:/Users/elainejomane/Desktop/sharan-mojotest/work/verilog/counter_20.v" "C:/Users/elainejomane/Desktop/sharan-mojotest/work/verilog/sevenseg_21.v" "C:/Users/elainejomane/Desktop/sharan-mojotest/work/verilog/decoder_22.v" "C:/Users/elainejomane/Desktop/sharan-mojotest/work/verilog/decimal_counter_23.v" "C:/Users/elainejomane/Desktop/sharan-mojotest/work/verilog/pipeline_24.v" "C:/Users/elainejomane/Desktop/sharan-mojotest/work/verilog/pipeline_24.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/elainejomane/Desktop/sharan-mojotest/constraint/newf.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/io_shield.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
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
