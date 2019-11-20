transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos {/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos/writeback.sv}
vlog -sv -work work +incdir+/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos {/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos/signext.sv}
vlog -sv -work work +incdir+/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos {/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos/regfile.sv}
vlog -sv -work work +incdir+/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos {/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos/processor_arm.sv}
vlog -sv -work work +incdir+/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos {/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos/mux2.sv}
vlog -sv -work work +incdir+/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos {/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos/memory.sv}
vlog -sv -work work +incdir+/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos {/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos/maindec.sv}
vlog -sv -work work +incdir+/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos {/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos/imem.sv}
vlog -sv -work work +incdir+/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos {/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos/flopr.sv}
vlog -sv -work work +incdir+/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos {/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos/fetch.sv}
vlog -sv -work work +incdir+/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos {/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos/execute.sv}
vlog -sv -work work +incdir+/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos {/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos/decode.sv}
vlog -sv -work work +incdir+/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos {/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos/datapath.sv}
vlog -sv -work work +incdir+/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos {/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos/controller.sv}
vlog -sv -work work +incdir+/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos {/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos/aludec.sv}
vlog -sv -work work +incdir+/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos {/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos/alu.sv}
vlog -sv -work work +incdir+/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos {/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos/adder.sv}
vcom -93 -work work {/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos/dmem.vhd}

vlog -sv -work work +incdir+/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos {/home/ignalau/Programacion/Famaf/Arquitectura/ARMv8/Modulos/processor_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  processor_arm

add wave *
view structure
view signals
run -all
