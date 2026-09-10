@REM iverilog -o test -I./ -y./ bench.v
@REM vvp test
@REM pause


@REM iverilog -o qqq counter.v tcounter.v
@REM vvp qqq

@REM cd counter
@REM iverilog -o counter.vvp counter.v tcounter.v
@REM vvp counter.vvp
@REM pause


cd signal
iverilog -o test -I./ -y./ bench.v
@REM vvp test
pause