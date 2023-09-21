onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top/alu_if/clk
add wave -noupdate /top/alu_if/reset
add wave -noupdate -radix decimal /top/alu_if/A
add wave -noupdate -radix decimal /top/alu_if/B
add wave -noupdate /top/alu_if/op_code
add wave -noupdate -radix decimal /top/alu_if/result
add wave -noupdate /top/alu_if/CarryOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {357 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 73
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {0 ns} {208 ns}
