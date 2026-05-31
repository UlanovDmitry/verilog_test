
build:
	iverilog -o build\qqq icarus-tests\counter.v icarus-tests\tcounter.v

test: build
	vvp build\qqq