MODULE MainModule
	CONST robtarget p0:=[[291.39,60.67,401.09],[0.0277526,-0.0812129,0.996307,-0.00248541],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget pFeederAppr:=[[295.71,263.36,253.27],[0.286753,-0.686277,0.613694,0.264909],[0,-2,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget pFeederPick:=[[291.76,307.60,209.97],[0.286792,-0.686279,0.61371,0.264824],[0,-2,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget pBinDrop:=[[510.94,60.62,125.07],[0.0299109,0.357501,0.932956,-0.0298516],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	PROC main()
		MoveJ p0, v500, fine, tGripper;
		WaitDI diPB1, 1;
		Set doPL1;
		FOR i FROM 1 TO 4 DO
		IF diProxFeeder = 0 THEN
			Set doBeaconLight;
			TPWrite "Feeder empty..., Add parts to feeder and press PB1.";
			WaitUntil diProxFeeder = 1 AND diPB1 = 1;
			Reset doBeaconLight;
		ENDIF
		rGetPart;
		rDropPart;
		ENDFOR
		Reset doPL1;
	ENDPROC
	PROC rGetPart()
		Reset doGripActuate;
		MoveJ p0, v500, z5, tGripper;
		MoveJ pFeederAppr, v500, z5, tGripper;
		MoveL pFeederPick, v100, fine, tGripper;
		Set doGripActuate;
		WaitTime 1;
		MoveL pFeederAppr, v100, fine, tGripper;
		MoveJ p0, v500, z20, tGripper;
	ENDPROC
	PROC rDropPart()
		MoveJ pBinDrop, v500, fine, tGripper;
		Reset doGripActuate;
		WaitTime 1;
		MoveJ p0, v500, fine, tGripper;
	ENDPROC
ENDMODULE