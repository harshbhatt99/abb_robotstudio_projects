MODULE Module1
    CONST robtarget pPallet1:=[[33.182494936,78.194007917,48.835795866],[-0.000000025,-0.000000023,1,-0.000000066],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pPallet2:=[[-14.92,118.49,6.19],[0.000001774,-0.000001213,-1,0.000000188],[1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pPallet3:=[[5.61,54.11,6.19],[0.00000025,0.00000166,-1,0.000000096],[1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pPalletReady:=[[11.162187069,89.780745802,145.476143088],[0.038289003,0.000039617,-0.999265087,-0.00179911],[1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pPick1:=[[29.14,8.05,27.97],[0.0000033,0.707108,-0.707106,0.000001414],[0,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pRBFixtureReady:=[[110.205350548,101.835299778,129.683957197],[0.000000021,-0.707106781,0.707106781,0.000000011],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pFBPFixtureReady:=[[46.804579029,106.959991346,228.777666668],[0.000000168,0.707107143,-0.707106419,-0.000000148],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pFBPick1:=[[44.3,35.19,61.29],[0.000001132,0.707105,-0.707108,-0.000029043],[0,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    
    VAR robtarget pRBPickArray{5,4};
    VAR robtarget pFBPickArray{2,4};
    VAR bool bFixInvArray{5,4};
    VAR bool bFBFixInvArray{2,4};
    VAR num nLoadMode := 0;
    VAR num nObjectSelect := 0;
    VAR num nRBPlaceSelect := 0;
    VAR num nFBPlaceSelect := 0;
    
    VAR num i := 0;
    VAR num j := 0;
    VAR bool FlagFirstPass := TRUE;
    VAR bool bPalletInv_1;
    VAR bool bPalletInv_2;
    VAR bool bPalletInv_3; ! For FB
    VAR num Loop;
    VAR num rowRB := 0;
    VAR num colRB := 0;
    VAR num rowFB := 0;
    VAR num colFB := 0;
    VAR num palletPosRB := 0;
    VAR num palletPosFB := 0;
    
    CONST robtarget pRBFixtureReady2:=[[0.000896173,75.252787669,94.735818364],[0.000000023,-0.70710678,0.707106783,0.00000001],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pRBFixtureReady0:=[[110.000896172,75.252787204,94.735816343],[0.000000023,-0.70710678,0.707106783,0.00000001],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pReady:=[[300.000890659,-124.747215441,194.735828686],[0.000000023,-0.70710678,0.707106783,0.00000001],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    
    PROC Main()
        ! Edit later
        IF FlagFirstPass = TRUE THEN    
            FOR j FROM 1 TO 4 DO
                FOR i FROM 1 TO 5 DO
                    ! We need to create the offset of the position to start from 0
                    pRBPickArray{i,j} := Offs(pPick1,50*i-50,50*j-50,0);
                ENDFOR
            ENDFOR
            FOR j FROM 1 TO 4 DO
                FOR i FROM 1 TO 2 DO
                    ! We need to create the offset of the position to start from 0
                    pFBPickArray{i,j} := Offs(pFBPick1,50*i-50,50*j-50,0);
                ENDFOR
            ENDFOR
            FlagFirstPass := FALSE;
            TPErase;
         ENDIF
         MoveJ pReady, v500,z20,tGripperMain\WObj:=wobj0;
         rSelectMenu;
        
    ENDPROC
    
    
    PROC rSelectMenu()
        ! Read Function Key (FK) from Teach Pendant (TP)
        ! Put stEmpty for the places you don't want but fill 5 positions
        TPReadFK nLoadMode, "Select Load Pallet or Unload Pallet","Load_RB","Unload_RB","Load_FB","Unload_FB","Manual";
        TEST nLoadMode
        CASE 1:
        ! Get 2 parts from Fixture and Place on Pallet
        rSetup;
        ! Old Approach: WaitDI diPLC1, 1;
        rRBFixtureGetPart;
        
        CASE 2:
        ! Get 2 partss from Pallet and Place on Fixture
        rSetupClear;
        rRBFixturePlacePart;
        
        CASE 3:
        ! Get 2 parts from Fixture and Place on Pallet
        rSetup;
        ! Old Approach: WaitDI diPLC1, 1;
        rFBFixtureGetPart;
        
        CASE 4:
        ! Get 2 partss from Pallet and Place on Fixture
        rSetupClear;
        rFBFixturePlacePart;
        
        CASE 5:
        ! Nested Menu
            TPReadFK nObjectSelect, "Select Round Bar or Flat Bar for Manual Operation","Round_Bar","Flat_Bar",stEmpty,stEmpty,stEmpty;
            TEST nObjectSelect    
            CASE 1:
                TPReadFK nRBPlaceSelect, "Select The Operation","Load_RB","Unload_RB",stEmpty,stEmpty,stEmpty;
                TEST nRBPlaceSelect
                    CASE 1:
                        rSetup;
                        TPReadNum rowRB, "Enter Row for Round Bar - Pick (1 to 4)";
                        
                        IF rowRB > 0 AND rowRB < 5 THEN
                            TPReadNum colRB, "Enter Column for Round Bar - Pick (1 to 5)";
                            IF colRB > 0 AND colRB < 6 THEN
                                TPReadNum palletPosRB, "Enter Position of RB Pickup From Pallet (1 or 2)";
                                rRBFixtureGetPartManual;
                            ENDIF
                        ENDIF
                    CASE 2:
                        TPReadNum palletPosRB, "Enter Position of RB Pickup From Pallet (1 or 2)";
                        TPReadNum rowRB, "Enter Row for Round Bar - Place (1 to 4)";
                        TPReadNum colRB, "Enter Column for Round Bar - Place (1 to 5)";
                        IF (rowRB > 0 AND rowRB < 5) THEN
                            IF (colRB > 0 AND colRB < 6) THEN
                                rRBFixturePlacePartManual;
                            ENDIF
                        ENDIF
                    DEFAULT:
                ENDTEST     
            CASE 2: 
            TPReadFK nFBPlaceSelect, "Select The Operation","Load_FB","Unload_FB",stEmpty,stEmpty,stEmpty;
                TEST nFBPlaceSelect
                    CASE 1:
                        TPReadNum rowFB, "Enter Row for Flat Bar - Pick (1 to 4)";
                        TPReadNum colFB, "Enter Column for Flat Bar - Pick (1 to 2)";
                        IF rowRB > 0 AND rowRB < 5 THEN
                            IF colRB > 0 AND colRB < 3 THEN
                                rFBFixtureGetPartManual;
                            ENDIF
                        ENDIF
                    CASE 2:
                        ! FB Pallet position not required as there is only 1 position
                        ! TPReadNum palletPosFB, "Enter Position of RB Pickup From Pallet (1 or 2)";
                        TPReadNum rowFB, "Enter Row for Flat Bar - Place (1 to 4)";
                        TPReadNum colFB, "Enter Column for Flat Bar - Place (1 to 2)";
                        IF rowFB > 0 AND rowFB < 5 THEN
                            IF colFB > 0 AND colFB < 2 THEN
                                rFBFixturePlacePartManual;
                            ENDIF
                        ENDIF
                    DEFAULT:
                ENDTEST
            
            DEFAULT:
            ENDTEST
        
        DEFAULT:
        ENDTEST
    ENDPROC
    
    
    
    PROC rSetup()
        ! Setup procedure to fill the Pallet Inventory Array
        ! By default the RB Fixture should be full so make all position TRUE and one by one make them FALSE
        FOR j FROM 1 TO 4 DO
            FOR i FROM 1 TO 5 DO
                bFixInvArray{i,j}:=TRUE;
            ENDFOR           
        ENDFOR        
    ENDPROC
    
     PROC rSetupClear()
        ! Setup procedure to fill the Pallet Inventory Array
        ! When the RB Fixture is empty, run this PROC so robot knows that the tray is empty and does not go to pick
        FOR j FROM 1 TO 4 DO
            FOR i FROM 1 TO 5 DO
                bFixInvArray{i,j}:=FALSE;
            ENDFOR          
        ENDFOR      
    ENDPROC
    
 
    PROC rRBFixtureGetPart()
        ! Get part from the fixture and deliver to the pallet on the conveyor
        ! Conveyor must have Pallet in position
        ! *************** CODE HERE FOR INTERLOCK TO THAT PALLET IS IN POSITION ******************
        
        ! If pallet is arrived and is not released then do this      
          
        FOR i FROM 1 TO 5 DO
            FOR j FROM 1 TO 4 DO
                IF diPLC2 = 1 AND doPLC1 = 1 THEN
                    MoveJ pRBFixtureReady0, v500, z10, tGripperMain\WObj:=wobjRBFixture;
                    MoveJ Offs(pRBPickArray{i,j},0,0,100),v500,z10,tGripperMain\WObj:=wobjRBFixture;
                    MoveL pRBPickArray{i,j},v50,Fine, tGripperMain\WObj:=wobjRBFixture;
                    rGrasp;
                    MoveL Offs(pRBPickArray{i,j},0,0,100),v500,z10,tGripperMain\WObj:=wobjRBFixture;
                    bFixInvArray{i,j}:=FALSE;
                    ! Place the part on to the pallet
                    rPalletLoadPart;
                    ! Test and Temporary setting of variables
                    
                    IF bPalletInv_1 = TRUE AND bPalletInv_2=TRUE THEN
                        ! ************* CODE HERE TO RELEASE THE PALLET***************
                        ! Releasing the pallet
                        
                        
                        ! Changing the bit values to false for new pallet
                        bPalletInv_1 := FALSE;
                        bPalletInv_2 := FALSE;
                        
                       
                        MoveJ pRBFixtureReady0, v500, z10, tGripperMain\WObj:=wobjRBFixture;
                        Reset doPLC1;
                        ! Waiting for pallet to leave
                        WaitTime 2;
                        ! Set doPLC1;
                    
                ENDIF
                ! Wait for pallet to release so this program does not loop back before pallet is released (physically)
                ELSE
                    ! Robot in waiting position until new command
                    MoveJ pReady, v500,z20,tGripperMain\WObj:=wobj0;
                    
                ENDIF
            ENDFOR
            
        ENDFOR
        
        
        
    ENDPROC
    
    
        PROC rRBFixturePlacePart()
        ! Get part from the pallet on the conveyor and deliver to the fixture
        ! Conveyor must have Pallet in position
        ! *************** CODE HERE FOR INTERLOCK TO THAT PALLET IS IN POSITION ******************
        ! For the first time, we need to tell the robot that the pallet is full
        bPalletInv_1 := TRUE;
        bPalletInv_2 := TRUE;
        FOR i FROM 1 TO 5 DO
            FOR j FROM 1 TO 4 DO
                
                     IF bPalletInv_1 = FALSE AND bPalletInv_2=FALSE THEN
                                ! ************* CODE HERE TO RELEASE THE PALLET***************
                                bPalletInv_1 := TRUE;
                                bPalletInv_2 := TRUE;
                                ! Release pallet interlocks (Inside IF or outside?)
                                Reset doPLC1;
                                ! Waiting for pallet to leave
                                WaitTime 2;
                    ENDIF
                    
                    ! Wait for next pallet (Time + Interlocks) - diPLC1 or 2 or 3 should be ON
                    ! *************** CODE HERE *******************
                    
                IF diPLC2 = 1 AND doPLC1 = 1 THEN
                    rPalletUnloadPart;
                    MoveJ Offs(pRBPickArray{i,j},0,0,100),v500,z10,tGripperMain\WObj:=wobjRBFixture;
                    MoveL pRBPickArray{i,j},v10,Fine, tGripperMain\WObj:=wobjRBFixture;
                    rRelease;
                    MoveL Offs(pRBPickArray{i,j},0,0,100),v10,z10,tGripperMain\WObj:=wobjRBFixture;
                    bFixInvArray{i,j}:=TRUE;   
                ELSE
                ! Robot in waiting position until new command
                MoveJ pReady, v500,z20,tGripperMain\WObj:=wobj0;
                ENDIF
            ENDFOR
            
        ENDFOR
        
    ENDPROC
    
    
    PROC rFBFixtureGetPart()
        ! Get part from the FB fixture and deliver to the pallet on the conveyor
        ! Conveyor must have Pallet in position
        ! *************** CODE HERE FOR INTERLOCK TO THAT PALLET IS IN POSITION ******************
        
        ! If pallet is arrived and is not released then do this      
          
        FOR i FROM 1 TO 2 DO
            FOR j FROM 1 TO 4 DO
                IF diPLC2 = 1 AND doPLC1 = 1 THEN
                    MoveJ pFBPFixtureReady, v500, z10, tGripperMain\WObj:=wobjFBFixture;
                    MoveJ Offs(pFBPickArray{i,j},0,0,100),v500,z10,tGripperMain\WObj:=wobjFBFixture;
                    MoveL pFBPickArray{i,j},v50,Fine, tGripperMain\WObj:=wobjFBFixture;
                    rGrasp;
                    MoveL Offs(pFBPickArray{i,j},0,0,100),v500,z10,tGripperMain\WObj:=wobjFBFixture;
                    bFBFixInvArray{i,j}:=FALSE;
                    ! Place the part on to the pallet
                    rFBPalletLoadPart; 
                    ! Test and Temporary setting of variables
                    
                    IF bPalletInv_3 = TRUE THEN
                        ! ************* CODE HERE TO RELEASE THE PALLET***************
                        ! Releasing the pallet
                        
                        
                        ! Changing the bit values to false for new pallet
                        bPalletInv_3 := FALSE;
                       
                       
                        MoveJ pFBPFixtureReady, v500, z10, tGripperMain\WObj:=wobjFBFixture;
                        Reset doPLC1;
                        ! Waiting for pallet to leave
                        WaitTime 2;
                        ! Set doPLC1;
                    
                ENDIF
                ! Wait for pallet to release so this program does not loop back before pallet is released (physically)
                ELSE
                    ! Robot in waiting position until new command
                    MoveJ pReady, v500,z20,tGripperMain\WObj:=wobj0;
                    
                ENDIF
            ENDFOR
            
        ENDFOR
        
        
        
    ENDPROC
    
    
    PROC rFBFixturePlacePart()
        ! Get part from the pallet on the conveyor and deliver to the fixture
        ! Conveyor must have Pallet in position
        ! *************** CODE HERE FOR INTERLOCK TO THAT PALLET IS IN POSITION ******************
        bPalletInv_3 := TRUE;
        FOR i FROM 1 TO 2 DO
            FOR j FROM 1 TO 4 DO
                
                     IF bPalletInv_3 = FALSE THEN
                                ! ************* CODE HERE TO RELEASE THE PALLET***************
                                bPalletInv_3 := TRUE;
                    
                                ! Release pallet interlocks (Inside IF or outside?)
                                Reset doPLC1;
                                    ! Waiting for pallet to leave
                                WaitTime 2;
                    ENDIF
            
            ! Wait for next pallet (Time + Interlocks) - diPLC1 or 2 or 3 should be ON
            ! *************** CODE HERE *******************
            
                IF diPLC2 = 1 AND doPLC1 = 1 THEN
                    rFBPalletUnloadPart; ! Define
                    MoveJ Offs(pFBPickArray{i,j},0,0,100),v500,z10,tGripperMain\WObj:=wobjFBFixture;
                    MoveL pFBPickArray{i,j},v10,Fine, tGripperMain\WObj:=wobjFBFixture;
                    rRelease;
                    MoveL Offs(pFBPickArray{i,j},0,0,100),v10,z10,tGripperMain\WObj:=wobjFBFixture;
                    bFBFixInvArray{i,j}:=TRUE;  
                ELSE
                ! Robot in waiting position until new command
                MoveJ pReady, v500,z20,tGripperMain\WObj:=wobj0;
                ENDIF
            ENDFOR
            
        ENDFOR
        
    ENDPROC
    
    PROC rPalletUnloadPart()
        ! Unloading the part from the pallet
        IF bPalletInv_1 = TRUE THEN
            MoveJ pPalletReady, v500, z10, tGripperMain\WObj:=wobjPallet;
            MoveJ Offs(pPallet3,0,0,60), v500, z10, tGripperMain\WObj:=wobjPallet;
            MoveL pPallet3, v50, Fine, tGripperMain\WObj:=wobjPallet;
                rGrasp;
            MoveL Offs(pPallet3,0,0,60), v100, z10, tGripperMain\WObj:=wobjPallet;
            MoveJ pPalletReady, v500, z10, tGripperMain\WObj:=wobjPallet;
            bPalletInv_1:=FALSE;
            ! Now the pallet is empty
           
        ELSEIF bPalletInv_2 = TRUE THEN
            MoveJ pPalletReady, v500, z10, tGripperMain\WObj:=wobjPallet;
            MoveJ Offs(pPallet2,0,0,60), v500, z10, tGripperMain\WObj:=wobjPallet;
            MoveL pPallet2, v50, Fine, tGripperMain\WObj:=wobjPallet;
                rGrasp;
            MoveL Offs(pPallet2,0,0,60), v100, z10, tGripperMain\WObj:=wobjPallet;
            MoveJ pPalletReady, v500, z10, tGripperMain\WObj:=wobjPallet;
            bPalletInv_2:=FALSE;
        ENDIF
    ENDPROC
    
    PROC rPalletLoadPart()
        ! Load the part to the pallet (grabbed from RBFixture)
        IF bPalletInv_1 = FALSE THEN
            MoveJ pPalletReady, v500, z10, tGripperMain\WObj:=wobjPallet;
            MoveJ Offs(pPallet3,0,0,60), v500, z10, tGripperMain\WObj:=wobjPallet;
            MoveL pPallet3, v20, Fine, tGripperMain\WObj:=wobjPallet;
                rRelease;
            MoveL Offs(pPallet3,0,0,60), v100, z10, tGripperMain\WObj:=wobjPallet;
            MoveJ pPalletReady, v500, z10, tGripperMain\WObj:=wobjPallet;
            bPalletInv_1:=TRUE;
           
        ELSEIF bPalletInv_2 = FALSE THEN
            MoveJ pPalletReady, v500, z10, tGripperMain\WObj:=wobjPallet;
            MoveJ Offs(pPallet2,0,0,60), v500, z10, tGripperMain\WObj:=wobjPallet;
            MoveL pPallet2, v20, Fine, tGripperMain\WObj:=wobjPallet;
                rRelease;
            MoveL Offs(pPallet2,0,0,60), v100, z10, tGripperMain\WObj:=wobjPallet;
            MoveJ pPalletReady, v500, z10, tGripperMain\WObj:=wobjPallet;
            bPalletInv_2:=TRUE;
        ENDIF
    ENDPROC    
    
    
     PROC rFBPalletLoadPart()
        ! Load the part to the pallet (grabbed from RBFixture)
        IF bPalletInv_3 = FALSE THEN
            MoveJ pPalletReady, v500, z10, tGripperMain\WObj:=wobjPallet;
            MoveJ Offs(pPallet1,0,0,60), v500, z10, tGripperMain\WObj:=wobjPallet;
            MoveL pPallet1, v20, Fine, tGripperMain\WObj:=wobjPallet;
                rRelease;
            MoveL Offs(pPallet1,0,0,60), v100, z10, tGripperMain\WObj:=wobjPallet;
            MoveJ pPalletReady, v500, z10, tGripperMain\WObj:=wobjPallet;
            bPalletInv_3:=TRUE;
           
        ENDIF
    ENDPROC  
    
    PROC rFBPalletUnloadPart()
        ! Unloading the part from the pallet
        IF bPalletInv_3 = TRUE THEN
            MoveJ pPalletReady, v500, z10, tGripperMain\WObj:=wobjPallet;
            MoveJ Offs(pPallet1,0,0,60), v500, z10, tGripperMain\WObj:=wobjPallet;
            MoveL pPallet1, v50, Fine, tGripperMain\WObj:=wobjPallet;
                rGrasp;
            MoveL Offs(pPallet1,0,0,60), v100, z10, tGripperMain\WObj:=wobjPallet;
            MoveJ pPalletReady, v500, z10, tGripperMain\WObj:=wobjPallet;
            bPalletInv_3:=FALSE;
            ! Now the pallet is empty
           
       
        ENDIF
    ENDPROC
    
    PROC rRelease()
        ! Open the gripper to release the part
        ! Stardard practice in programming is to wait for 100 ms
        WaitTime .1; 
        Reset doGripActuate;
        ! Ensure gripper is OPEN before proceding
        WaitDi diGripOpen,1;
        WaitTime .1;
    ENDPROC
    
    PROC rGrasp()
        ! Close the gripper to grab the part
        ! Stardard practice in programming is to wait for 100 ms
        WaitTime .1; 
        Set doGripActuate;
        ! Ensure gripper is CLOSED before proceding
        WaitDi diGripClosed,1;
        WaitTime .1;
    ENDPROC
    
    
    PROC Path_10()
        MoveJ pPallet1,v100,z0,tGripperMain\WObj:=wobjPallet;
        MoveJ pPallet2,v100,z0,tGripperMain\WObj:=wobjPallet;
        MoveJ pPallet3,v100,z0,tGripperMain\WObj:=wobjPallet;
        MoveJ pPalletReady,v100,z0,tGripperMain\WObj:=wobjPallet;
        MoveJ pPick1,v100,z0,tGripperMain\WObj:=wobjRBFixture;
        MoveJ pFBPFixtureReady,v100,z0,tGripperMain\WObj:=wobjFBFixture;
        MoveJ pFBPick1,v100,z0,tGripperMain\WObj:=wobjFBFixture;
        MoveJ pRBFixtureReady0,v100,z0,tGripperMain\WObj:=wobjRBFixture;
        MoveJ pReady,v100,z0,tGripperMain\WObj:=wobj0;
    ENDPROC
    
    PROC rRBFixtureGetPartManual()
        ! Get part from the fixture and deliver to the pallet on the conveyor
        ! Conveyor must have Pallet in position
        ! *************** CODE HERE FOR INTERLOCK TO THAT PALLET IS IN POSITION ******************
        
        ! If pallet is arrived and is not released then do this      
          
             IF bFixInvArray{rowRB,colRB}=TRUE THEN
                IF diPLC2 = 1 AND doPLC1 = 1 THEN
                
                    MoveJ pRBFixtureReady0, v500, z10, tGripperMain\WObj:=wobjRBFixture;
                    MoveJ Offs(pRBPickArray{rowRB,colRB},0,0,100),v500,z10,tGripperMain\WObj:=wobjRBFixture;
                    MoveL pRBPickArray{rowRB,colRB},v50,Fine, tGripperMain\WObj:=wobjRBFixture;
                    rGrasp;
                    MoveL Offs(pRBPickArray{rowRB,colRB},0,0,100),v500,z10,tGripperMain\WObj:=wobjRBFixture;
                    bFixInvArray{rowRB,colRB}:=FALSE;
                    ! Place the part on to the pallet
                    rRBPalletLoadPartManual;
                    ! Test and Temporary setting of variables
                ENDIF
                
            ELSE
                ! Robot in waiting position until new command
                MoveJ pReady, v500,z20,tGripperMain\WObj:=wobj0;
                TPWrite "Condition Wrong";
                
            ENDIF
          
        
        
        
    ENDPROC
    
    
        PROC rRBFixturePlacePartManual()
        ! Get part from the pallet on the conveyor and deliver to the fixture
        ! Conveyor must have Pallet in position
        ! *************** CODE HERE FOR INTERLOCK TO THAT PALLET IS IN POSITION ******************
        ! For the first time, we need to tell the robot that the pallet is full
        bPalletInv_1 := TRUE;
        bPalletInv_2 := TRUE;
       
                
             IF bPalletInv_1 = FALSE AND bPalletInv_2=FALSE THEN
                        ! ************* CODE HERE TO RELEASE THE PALLET***************
                        bPalletInv_1 := TRUE;
                        bPalletInv_2 := TRUE;
                        ! Release pallet interlocks (Inside IF or outside?)
                        Reset doPLC1;
                        ! Waiting for pallet to leave
                        WaitTime 2;
            ENDIF
            
            ! Wait for next pallet (Time + Interlocks) - diPLC1 or 2 or 3 should be ON
            ! *************** CODE HERE *******************
            
        IF diPLC2 = 1 AND doPLC1 = 1 THEN
            rRBPalletUnloadPartManual;
            MoveJ Offs(pRBPickArray{rowRB,colRB},0,0,100),v500,z10,tGripperMain\WObj:=wobjRBFixture;
            MoveL pRBPickArray{rowRB,colRB},v10,Fine, tGripperMain\WObj:=wobjRBFixture;
            rRelease;
            MoveL Offs(pRBPickArray{rowRB,colRB},0,0,100),v10,z10,tGripperMain\WObj:=wobjRBFixture;
            bFixInvArray{rowRB,colRB}:=TRUE;   
        ELSE
        ! Robot in waiting position until new command
        MoveJ pReady, v500,z20,tGripperMain\WObj:=wobj0;
        ENDIF
           
        
    ENDPROC
    
    
    PROC rFBFixtureGetPartManual()
        ! Get part from the FB fixture and deliver to the pallet on the conveyor
        ! Conveyor must have Pallet in position
        ! *************** CODE HERE FOR INTERLOCK TO THAT PALLET IS IN POSITION ******************
        
        ! If pallet is arrived and is not released then do this      
          
        
            IF diPLC2 = 1 AND doPLC1 = 1 THEN
                MoveJ pFBPFixtureReady, v500, z10, tGripperMain\WObj:=wobjFBFixture;
                MoveJ Offs(pFBPickArray{rowFB,colFB},0,0,100),v500,z10,tGripperMain\WObj:=wobjFBFixture;
                MoveL pFBPickArray{rowFB,colFB},v50,Fine, tGripperMain\WObj:=wobjFBFixture;
                rGrasp;
                MoveL Offs(pFBPickArray{rowFB,colFB},0,0,100),v500,z10,tGripperMain\WObj:=wobjFBFixture;
                bFBFixInvArray{rowFB,colFB}:=FALSE;
                ! Place the part on to the pallet
                rFBPalletLoadPart; 
                ! Test and Temporary setting of variables
                
                IF bPalletInv_3 = TRUE THEN
                    bPalletInv_3 := FALSE;                
                    MoveJ pFBPFixtureReady, v500, z10, tGripperMain\WObj:=wobjFBFixture;       
                ENDIF
            ! Wait for pallet to release so this program does not loop back before pallet is released (physically)
            ELSE
                ! Robot in waiting position until new command
                MoveJ pReady, v500,z20,tGripperMain\WObj:=wobj0;
                
            ENDIF
     
           
        
        
    ENDPROC
    
    
    PROC rFBFixturePlacePartManual()
        ! Get part from the pallet on the conveyor and deliver to the fixture
        ! Conveyor must have Pallet in position
        ! *************** CODE HERE FOR INTERLOCK TO THAT PALLET IS IN POSITION ******************
        bPalletInv_3 := TRUE;

       
        IF diPLC2 = 1 AND doPLC1 = 1 THEN
            rFBPalletUnloadPartManual; 
            MoveJ Offs(pFBPickArray{rowFB,colFB},0,0,100),v500,z10,tGripperMain\WObj:=wobjFBFixture;
            MoveL pFBPickArray{rowFB,colFB},v10,Fine, tGripperMain\WObj:=wobjFBFixture;
            rRelease;
            MoveL Offs(pFBPickArray{rowFB,colFB},0,0,100),v10,z10,tGripperMain\WObj:=wobjFBFixture;
            bFBFixInvArray{rowFB,colFB}:=TRUE;  
        ELSE
        ! Robot in waiting position until new command
        MoveJ pReady, v500,z20,tGripperMain\WObj:=wobj0;
        ENDIF

        
    ENDPROC
    
     PROC rRBPalletLoadPartManual()
        ! Load the part to the pallet (grabbed from RBFixture)
        IF bPalletInv_1 =FALSE AND palletPosRB = 1 THEN
            MoveJ pPalletReady, v500, z10, tGripperMain\WObj:=wobjPallet;
            MoveJ Offs(pPallet3,0,0,60), v500, z10, tGripperMain\WObj:=wobjPallet;
            MoveL pPallet3, v20, Fine, tGripperMain\WObj:=wobjPallet;
                rRelease;
            MoveL Offs(pPallet3,0,0,60), v100, z10, tGripperMain\WObj:=wobjPallet;
            MoveJ pPalletReady, v500, z10, tGripperMain\WObj:=wobjPallet;
            bPalletInv_1:=TRUE;
           
        ELSEIF bPalletInv_2 = FALSE AND palletPosRB = 2 THEN
            MoveJ pPalletReady, v500, z10, tGripperMain\WObj:=wobjPallet;
            MoveJ Offs(pPallet2,0,0,60), v500, z10, tGripperMain\WObj:=wobjPallet;
            MoveL pPallet2, v20, Fine, tGripperMain\WObj:=wobjPallet;
                rRelease;
            MoveL Offs(pPallet2,0,0,60), v100, z10, tGripperMain\WObj:=wobjPallet;
            MoveJ pPalletReady, v500, z10, tGripperMain\WObj:=wobjPallet;
            bPalletInv_2:=TRUE;
        ENDIF
    ENDPROC    
    
      PROC rRBPalletUnloadPartManual()
        ! Unloading the part from the pallet
        IF bPalletInv_1 = TRUE THEN
            MoveJ pPalletReady, v500, z10, tGripperMain\WObj:=wobjPallet;
            MoveJ Offs(pPallet3,0,0,60), v500, z10, tGripperMain\WObj:=wobjPallet;
            MoveL pPallet3, v50, Fine, tGripperMain\WObj:=wobjPallet;
                rGrasp;
            MoveL Offs(pPallet3,0,0,60), v100, z10, tGripperMain\WObj:=wobjPallet;
            MoveJ pPalletReady, v500, z10, tGripperMain\WObj:=wobjPallet;
            bPalletInv_1:=FALSE;
            ! Now the pallet is empty
           
        ELSEIF bPalletInv_2 = TRUE THEN
            MoveJ pPalletReady, v500, z10, tGripperMain\WObj:=wobjPallet;
            MoveJ Offs(pPallet2,0,0,60), v500, z10, tGripperMain\WObj:=wobjPallet;
            MoveL pPallet2, v50, Fine, tGripperMain\WObj:=wobjPallet;
                rGrasp;
            MoveL Offs(pPallet2,0,0,60), v100, z10, tGripperMain\WObj:=wobjPallet;
            MoveJ pPalletReady, v500, z10, tGripperMain\WObj:=wobjPallet;
            bPalletInv_2:=FALSE;
        ENDIF
    ENDPROC
    
   
    
    
     PROC rFBPalletLoadPartManual()
        ! Load the part to the pallet (grabbed from RBFixture)
       
            MoveJ pPalletReady, v500, z10, tGripperMain\WObj:=wobjPallet;
            MoveJ Offs(pPallet1,0,0,60), v500, z10, tGripperMain\WObj:=wobjPallet;
            MoveL pPallet1, v20, Fine, tGripperMain\WObj:=wobjPallet;
                rRelease;
            MoveL Offs(pPallet1,0,0,60), v100, z10, tGripperMain\WObj:=wobjPallet;
            MoveJ pPalletReady, v500, z10, tGripperMain\WObj:=wobjPallet;
            bPalletInv_3:=TRUE;
           
       
    ENDPROC  
    
    PROC rFBPalletUnloadPartManual()
        ! Unloading the part from the pallet
        
            MoveJ pPalletReady, v500, z10, tGripperMain\WObj:=wobjPallet;
            MoveJ Offs(pPallet1,0,0,60), v500, z10, tGripperMain\WObj:=wobjPallet;
            MoveL pPallet1, v50, Fine, tGripperMain\WObj:=wobjPallet;
                rGrasp;
            MoveL Offs(pPallet1,0,0,60), v100, z10, tGripperMain\WObj:=wobjPallet;
            MoveJ pPalletReady, v500, z10, tGripperMain\WObj:=wobjPallet;
            bPalletInv_3:=FALSE;
            ! Now the pallet is empty
           
       
      
    ENDPROC
    
ENDMODULE