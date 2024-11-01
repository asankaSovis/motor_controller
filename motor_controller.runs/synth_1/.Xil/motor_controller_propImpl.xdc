set_property SRC_FILE_INFO {cfile:/home/asanka/Documents/Vivado/motor_controller/motor_controller.srcs/constrs_1/imports/Downloads/pins.xdc rfile:../../../motor_controller.srcs/constrs_1/imports/Downloads/pins.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:7 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVCMOS33 } [get_ports { int_clk }]; #IO_L13P_T2_MRCC_35 Sch=sysclk
set_property src_info {type:XDC file:1 line:12 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN G17   IOSTANDARD LVCMOS33 } [get_ports { green_LED }]; #IO_L16P_T2_35 Sch=led0_g
set_property src_info {type:XDC file:1 line:13 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN N15   IOSTANDARD LVCMOS33 } [get_ports { red_LED }]; #IO_L21P_T3_DQS_AD14P_35 Sch=led0_r
set_property src_info {type:XDC file:1 line:15 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN L14   IOSTANDARD LVCMOS33 } [get_ports { motor_green_LED }]; #IO_L22P_T3_AD7P_35 Sch=led1_g
set_property src_info {type:XDC file:1 line:16 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN M15   IOSTANDARD LVCMOS33 } [get_ports { motor_red_LED }]; #IO_L23N_T3_35 Sch=led1_r
set_property src_info {type:XDC file:1 line:20 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D19   IOSTANDARD LVCMOS33 } [get_ports { panic_btn }]; #IO_L4P_T0_35 Sch=btn[1]
set_property src_info {type:XDC file:1 line:92 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports { din }]; #IO_L11P_T1_SRCC_34 Sch=ck_io[0]
set_property src_info {type:XDC file:1 line:93 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V13   IOSTANDARD LVCMOS33 } [get_ports { drive_en }]; #IO_L3N_T0_DQS_34 Sch=ck_io[1]
set_property src_info {type:XDC file:1 line:94 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS33 } [get_ports { drive_dir }]; #IO_L5P_T0_34 Sch=ck_io[2]
set_property src_info {type:XDC file:1 line:95 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN T15   IOSTANDARD LVCMOS33 } [get_ports { drive_step }]; #IO_L5N_T0_34 Sch=ck_io[3]
set_property src_info {type:XDC file:1 line:96 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports { motor_relay }]; #IO_L21P_T3_DQS_34 Sch=ck_io[4]
