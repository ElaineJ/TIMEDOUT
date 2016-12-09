set projDir "C:/Users/SharanSunil/Desktop/MOJOTESTING copy/work/planAhead"
set projName "MOJOTESTING"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/SharanSunil/Desktop/MOJOTESTING copy/work/verilog/mojo_top_0.v" "C:/Users/SharanSunil/Desktop/MOJOTESTING copy/work/verilog/alu_1.v" "C:/Users/SharanSunil/Desktop/MOJOTESTING copy/work/verilog/counter_2.v" "C:/Users/SharanSunil/Desktop/MOJOTESTING copy/work/verilog/counter_3.v" "C:/Users/SharanSunil/Desktop/MOJOTESTING copy/work/verilog/counter_4.v" "C:/Users/SharanSunil/Desktop/MOJOTESTING copy/work/verilog/counter_5.v" "C:/Users/SharanSunil/Desktop/MOJOTESTING copy/work/verilog/counter_6.v" "C:/Users/SharanSunil/Desktop/MOJOTESTING copy/work/verilog/xcounter_7.v" "C:/Users/SharanSunil/Desktop/MOJOTESTING copy/work/verilog/multi_seven_seg_8.v" "C:/Users/SharanSunil/Desktop/MOJOTESTING copy/work/verilog/multi_decimal_counter_9.v" "C:/Users/SharanSunil/Desktop/MOJOTESTING copy/work/verilog/edge_detector_10.v" "C:/Users/SharanSunil/Desktop/MOJOTESTING copy/work/verilog/reset_conditioner_11.v" "C:/Users/SharanSunil/Desktop/MOJOTESTING copy/work/verilog/register_12.v" "C:/Users/SharanSunil/Desktop/MOJOTESTING copy/work/verilog/adder_13.v" "C:/Users/SharanSunil/Desktop/MOJOTESTING copy/work/verilog/compare_14.v" "C:/Users/SharanSunil/Desktop/MOJOTESTING copy/work/verilog/boolean_15.v" "C:/Users/SharanSunil/Desktop/MOJOTESTING copy/work/verilog/shifter_16.v" "C:/Users/SharanSunil/Desktop/MOJOTESTING copy/work/verilog/edge_detector_10.v" "C:/Users/SharanSunil/Desktop/MOJOTESTING copy/work/verilog/button_conditioner_18.v" "C:/Users/SharanSunil/Desktop/MOJOTESTING copy/work/verilog/counter_19.v" "C:/Users/SharanSunil/Desktop/MOJOTESTING copy/work/verilog/sevenseg_20.v" "C:/Users/SharanSunil/Desktop/MOJOTESTING copy/work/verilog/decoder_21.v" "C:/Users/SharanSunil/Desktop/MOJOTESTING copy/work/verilog/decimal_counter_22.v" "C:/Users/SharanSunil/Desktop/MOJOTESTING copy/work/verilog/pipeline_23.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/SharanSunil/Desktop/MOJOTESTING\ copy/constraint/newf.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/io_shield.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
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
