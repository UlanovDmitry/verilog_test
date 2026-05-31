@REM iverilog -o test -I./ -y./ bench.v
@REM vvp test
@REM pause


iverilog -o qqq counter.v tcounter.v
vvp qqq

