transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/parsa/quartusprojects/arm-microprogram-new\ v3 {/home/parsa/quartusprojects/arm-microprogram-new v3/arm.sv}
vlog -sv -work work +incdir+/home/parsa/quartusprojects/arm-microprogram-new\ v3 {/home/parsa/quartusprojects/arm-microprogram-new v3/extend.sv}
vlog -sv -work work +incdir+/home/parsa/quartusprojects/arm-microprogram-new\ v3 {/home/parsa/quartusprojects/arm-microprogram-new v3/mux3.sv}
vlog -sv -work work +incdir+/home/parsa/quartusprojects/arm-microprogram-new\ v3 {/home/parsa/quartusprojects/arm-microprogram-new v3/decode.sv}
vlog -sv -work work +incdir+/home/parsa/quartusprojects/arm-microprogram-new\ v3 {/home/parsa/quartusprojects/arm-microprogram-new v3/top.sv}
vlog -sv -work work +incdir+/home/parsa/quartusprojects/arm-microprogram-new\ v3 {/home/parsa/quartusprojects/arm-microprogram-new v3/shifter.sv}
vlog -sv -work work +incdir+/home/parsa/quartusprojects/arm-microprogram-new\ v3 {/home/parsa/quartusprojects/arm-microprogram-new v3/alu.sv}
vlog -sv -work work +incdir+/home/parsa/quartusprojects/arm-microprogram-new\ v3 {/home/parsa/quartusprojects/arm-microprogram-new v3/flopenr.sv}
vlog -sv -work work +incdir+/home/parsa/quartusprojects/arm-microprogram-new\ v3 {/home/parsa/quartusprojects/arm-microprogram-new v3/flopr.sv}
vlog -sv -work work +incdir+/home/parsa/quartusprojects/arm-microprogram-new\ v3 {/home/parsa/quartusprojects/arm-microprogram-new v3/condcheck.sv}
vlog -sv -work work +incdir+/home/parsa/quartusprojects/arm-microprogram-new\ v3 {/home/parsa/quartusprojects/arm-microprogram-new v3/regfile.sv}
vlog -sv -work work +incdir+/home/parsa/quartusprojects/arm-microprogram-new\ v3 {/home/parsa/quartusprojects/arm-microprogram-new v3/controller.sv}
vlog -sv -work work +incdir+/home/parsa/quartusprojects/arm-microprogram-new\ v3 {/home/parsa/quartusprojects/arm-microprogram-new v3/mux2.sv}
vlog -sv -work work +incdir+/home/parsa/quartusprojects/arm-microprogram-new\ v3 {/home/parsa/quartusprojects/arm-microprogram-new v3/condlogic.sv}
vlog -sv -work work +incdir+/home/parsa/quartusprojects/arm-microprogram-new\ v3 {/home/parsa/quartusprojects/arm-microprogram-new v3/datapath.sv}
vlog -sv -work work +incdir+/home/parsa/quartusprojects/arm-microprogram-new\ v3 {/home/parsa/quartusprojects/arm-microprogram-new v3/ctrlunit.sv}
vlog -sv -work work +incdir+/home/parsa/quartusprojects/arm-microprogram-new\ v3 {/home/parsa/quartusprojects/arm-microprogram-new v3/seqlogic.sv}
vlog -sv -work work +incdir+/home/parsa/quartusprojects/arm-microprogram-new\ v3 {/home/parsa/quartusprojects/arm-microprogram-new v3/ctrlmem.sv}
vlog -sv -work work +incdir+/home/parsa/quartusprojects/arm-microprogram-new\ v3 {/home/parsa/quartusprojects/arm-microprogram-new v3/ctrlbffreg.sv}
vlog -sv -work work +incdir+/home/parsa/quartusprojects/arm-microprogram-new\ v3 {/home/parsa/quartusprojects/arm-microprogram-new v3/mem.sv}

