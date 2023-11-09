MODULE Module1
    VAR bool rTrace := FALSE;
    
    CONST robtarget Target_0_Appr:=[[322.94,39.47,50],[0,-0.707106781,0.707106781,0],[0,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_10:=[[322.94,39.47,0],[0,-0.707106781,0.707106781,0],[0,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_20:=[[317.13,39.47,0],[0,-0.707106781,0.707106781,0],[0,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_30:=[[312.41,41.14,0],[0,-0.707106781,0.707106781,0],[0,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_40:=[[309.79,45.41,0],[0,-0.707106781,0.707106781,0],[0,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_50:=[[300.58,51.1,0],[0,-0.707106781,0.707106781,0],[0,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_60:=[[295.28,41.65,0],[0,-0.707106781,0.707106781,0],[0,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_70:=[[295,36.51,0],[0,-0.707106781,0.707106781,0],[0,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_80:=[[291.46,32.76,0],[0,-0.707106781,0.707106781,0],[0,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_90:=[[281.88,27.96,0],[0,-0.707106781,0.707106781,0],[0,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_100:=[[276.41,27.48,0],[0,-0.707106781,0.707106781,0],[0,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_110:=[[272.08,30.84,0],[0,-0.707106781,0.707106781,0],[0,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_120:=[[265.63,34.45,0],[0,-0.707106781,0.707106781,0],[0,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_130:=[[258.41,29.05,0],[0,-0.707106781,0.707106781,0],[0,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_140:=[[255.05,24.65,0],[0,-0.707106781,0.707106781,0],[0,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_150:=[[249.59,23.76,0],[0,-0.707106781,0.707106781,0],[0,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_160:=[[169.96,41.17,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_170:=[[165.6,43.9,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_180:=[[164.07,48.86,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_190:=[[158.18,56.54,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_200:=[[149.62,52.02,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_210:=[[146.17,48.19,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_220:=[[141.06,47.49,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_230:=[[70.5,62.92,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_240:=[[66.17,65.65,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_250:=[[64.6,70.52,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_260:=[[59.29,77.96,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_270:=[[50.74,74.74,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_280:=[[45.97,71.37,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_290:=[[40.23,72.43,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_300:=[[30.18,81.49,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_310:=[[23.28,93.13,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_320:=[[23.37,98.97,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_330:=[[27.62,102.97,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_340:=[[32.5,110,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_350:=[[27.62,117.03,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_360:=[[23.37,121.03,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_370:=[[23.28,126.87,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_380:=[[30.18,138.51,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_390:=[[40.23,147.57,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_400:=[[45.97,148.63,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_410:=[[50.74,145.26,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_420:=[[59.29,142.04,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_430:=[[64.6,149.48,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_440:=[[66.17,154.35,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_450:=[[70.5,157.08,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_460:=[[141.06,172.51,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_470:=[[146.17,171.81,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_480:=[[149.17,167.98,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_490:=[[158.18,163.46,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_500:=[[164.07,171.14,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_510:=[[165.6,176.06,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_520:=[[169.96,178.83,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_530:=[[249.59,196.24,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_540:=[[255.05,195.35,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_550:=[[258.41,190.95,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_560:=[[264.65,185.55,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_570:=[[272.08,189.16,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_580:=[[276.41,192.52,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_590:=[[281.88,192.04,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_600:=[[291.46,187.24,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_610:=[[295,183.49,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_620:=[[295.28,178.35,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_630:=[[300.58,168.9,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_640:=[[309.79,174.59,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_650:=[[312.41,178.86,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_660:=[[317.13,180.53,0],[0,-0.707106781,0.707106781,0],[0,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_670:=[[322.94,180.53,0],[0,-0.707106781,0.707106781,0],[0,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_680:=[[327.39,179.07,0],[0,-0.707106781,0.707106781,0],[0,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_690:=[[330.1,175.25,0],[0,-0.707106781,0.707106781,0],[0,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_700:=[[332.85,165.64,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_710:=[[332.32,160.43,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_720:=[[328.51,156.84,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_730:=[[324.06,148.54,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_740:=[[331.23,142.43,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_750:=[[336.09,140.47,0],[0,-0.707106781,0.707106781,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_760:=[[338.48,135.81,0],[0,-0.707106781,0.707106781,0],[0,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_770:=[[340,110,0],[0,-0.707106781,0.707106781,0],[0,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_780:=[[338.48,84.19,0],[0,-0.707106781,0.707106781,0],[0,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_790:=[[336.09,79.53,0],[0,-0.707106781,0.707106781,0],[0,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_800:=[[331.23,77.57,0],[0,-0.707106781,0.707106781,0],[0,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_810:=[[324.06,71.46,0],[0,-0.707106781,0.707106781,0],[0,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_820:=[[328.51,63.16,0],[0,-0.707106781,0.707106781,0],[0,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_830:=[[332.32,59.57,0],[0,-0.707106781,0.707106781,0],[0,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_840:=[[332.85,54.36,0],[0,-0.707106781,0.707106781,0],[0,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_850:=[[330.1,44.75,0],[0,-0.707106781,0.707106781,0],[0,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_860:=[[327.39,40.93,0],[0,-0.707106781,0.707106781,0],[0,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_0_Dept:=[[317.13,39.47,50],[0,-0.707106781,0.707106781,0],[0,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pReady:=[[222.94,39.47,140],[0,-0.707106781,0.707106781,0],[0,1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PROC RTV_Trace()
        MoveL Target_0_Appr,v100,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveL Target_10,v100,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveL Target_20,v100,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_30,Target_40,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_50,Target_60,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveL Target_60,v100,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_70,Target_80,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveL Target_90,v100,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_100,Target_110,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_120,Target_130,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_140,Target_150,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveL Target_160,v100,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_170,Target_180,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_190,Target_200,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_210,Target_220,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveL Target_230,v100,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_240,Target_250,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_260,Target_270,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_280,Target_290,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_300,Target_310,v100,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_320,Target_330,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_340,Target_350,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_360,Target_370,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_380,Target_390,v100,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_400,Target_410,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_420,Target_430,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_440,Target_450,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveL Target_460,v100,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_470,Target_480,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_490,Target_500,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_510,Target_520,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveL Target_530,v100,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_540,Target_550,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_560,Target_570,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_580,Target_590,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveL Target_600,v100,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_610,Target_620,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_630,Target_640,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_650,Target_660,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveL Target_670,v100,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_680,Target_690,v100,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveL Target_700,v100,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_710,Target_720,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_730,Target_740,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_750,Target_760,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_770,Target_780,v100,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_790,Target_800,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_810,Target_820,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_830,Target_840,v50,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveL Target_850,v100,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveC Target_860,Target_10,v100,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveL Target_20,v100,fine,TCPMarker\WObj:=WobjWhiteboard;
        MoveL Target_0_Dept,v100,fine,TCPMarker\WObj:=WobjWhiteboard;
    ENDPROC
    PROC main()
        MoveJ pReady,v100,fine,TCPMarker\WObj:=WobjWhiteboard;
        TPWrite "Press PB1 To Start ..";
        WHILE rTrace = FALSE DO
            Set doPL1;
            WaitTime 1;
            Reset doPL1;
            WaitTime 1;
            
            IF diPB1=1 THEN
                rTrace := TRUE;
            ENDIF
            
        ENDWHILE
        
             
        ! WaitDI diPB1,1;
        IF rTrace = TRUE THEN
            Set doPL1;
            RTV_Trace;
            rTrace := FALSE;       
        ENDIF
        
    ENDPROC
ENDMODULE