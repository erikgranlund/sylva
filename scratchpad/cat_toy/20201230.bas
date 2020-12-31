>LIST
20     CLEAR R: CLEAR C: CLEAR D: CLEAR O: CLEAR B
40     ONTIME 1,10000: TIC 1
100    REM FIRST TIME SETUP
110    INIT=60
120    ACCUM=INIT
200    REM MAIN LOOP
999    REM END MAIN LOOP
1000   GOTO 200
2000   REM MOTOR OFF
2010   OTU 000: OTU 001: OTU 002: OTU 003: LIO 
2020   PRINT "Motor Off"
2030   RETURN 
3000   REM MOTOR CLOCKWISE
3010   OTU 000: OTU 001: OTL 002: OTL 003: LIO 
3020   PRINT "Motor CW"
3030   RETURN 
4000   REM MOTOR COUNTER CLOCKWISE
4010   OTL 000: OTL 001: OTU 002: OTU 003: LIO 
4020   PRINT "Motor CCW"
4030   RETURN 
10000  REM TICK INTERRUPT START
10010  REM PRINT ACCUM
10005  IF (ABS(RND)*100)>=45 THEN GOSUB 2000 : GOTO 10100 : REM RNDMLY STOP
10020  ACCUM=ACCUM-INT(11*ABS(RND))
10030  IF ACCUM<=0 THEN ACCUM=INIT : GOTO 10100 : REM RESET
10040  IS_ODD=ACCUM.AND.1
10050  IF IS_ODD=1 THEN  GOSUB 3000 ELSE  GOSUB 4000
10100  REM TICK INTERRUPT END
10110  TIC 1: RETI 

READY