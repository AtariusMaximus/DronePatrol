    ;──═◙ "Drone Patrol" v0.39, Steve Engelhardt, 3/21/2023

    ;──═◙ Set 7800Basic Options
    set tv ntsc
    set tallsprite on
    set zoneheight 8
    set zoneprotection on
    set screenheight 192
    set romsize 272k
    set extradlmemory on
    set trackersupport basic
    set plotvalueonscreen on
    set avoxvoice on
    displaymode 160A

    ;──═◙ Dim Variables
    dim textZoneRAM = $2300
    dim textZoneRAMAdd = $2300+32
     
    dim pointer = a
    dim pointerHi = b
    dim index = c
    dim speed = d
    dim offset = e
    dim offsetX = f
    dim offsetY = g
    dim textZoneIndex = h
    dim direction = i
    dim beam_counter = j
    dim tank1_speed=k.l
    dim tank2_speed=m.n
    dim tank3_speed=o.p
    dim missile1_speed=q.r
    dim missile2_speed=s.t
    dim missile3_speed=u.v
    dim cannon2_speed=w.x
    dim drone_speed=y.z
    dim bomb2_xpos = var0 
    dim bomb2_ypos = var1
    dim bomb1_xpos = var2 
    dim bomb1_ypos = var3
    dim man1_flag = var4 
    dim man2_flag = var5
    dim man3_flag = var6
    dim man1_speed = var7.var8
    dim man2_speed = var9.var10
    dim man3_speed = var11.var12
    dim cannon1_speed  = var13.var14
    dim shield_top_xpos = var15
    dim shield_top_ypos = var16
    dim shield_bottom_xpos = var17
    dim shield_bottom_ypos = var18
    dim temporary = var19
    dim animate1 = var20
    dim animate2 = var21
    dim animate3 = var22
    dim frame_counter = var23
    dim drone_xpos = var24
    dim drone_ypos = var25
    dim joydir = var26
    dim crosshair_x_offset_1 = var27
    dim laser_y_offset_1 = var28
    dim laser_y_offset_2 = var29
    dim laser_y_offset_3 = var30
    dim laser_y_offset_4 = var31
    dim laser_y_offset_5 = var32
    dim laser_y_offset_6 = var33
    dim laser_y_offset_7 = var34
    dim laser_y_offset_8 = var35
    dim laser_y_offset_9 = var36
    dim laser_y_offset_10 = var37
    dim laser_x_offset_1 = var38
    dim laser_counter = var39
    dim laser_fire_flag = var40
    dim frame = var41
    dim fadevalue = var42
    dim init_flag = var43
    dim medtruck_flag = var44
    dim smart_bomb = var45
    dim frame_counter2 = var46
    dim boss_move_flag1 = var47
    dim boss_move_flag2 = var48
    dim boss_move_flag3 = var49
    dim boss_move_flag4 = var50
    dim boss_move_counter = var51
    dim boss_counter = var52
    dim defensebeam_y_offset_1 = var53
    dim defensebeam_y_offset_2 = var54
    dim defensebeam_y_offset_3 = var55
    dim defensebeam_y_offset_4 = var56
    dim defensebeam_y_offset_5 = var57
    dim defensebeam_y_offset_6 = var58
    dim defensebeam_y_offset_7 = var59
    dim defensebeam_y_offset_8 = var60
    dim defensebeam_y_offset_9 = var61
    dim defensebeam_y_offset_10 = var62
    dim defensebeam_x_offset_1 = var63
    dim fire_debounce_0 = var64
    dim fire_debounce_1 = var65
    dim laser_powerup_xpos = var66
    dim laser_powerup_ypos = var67
    dim tank1_flag = var68
    dim tank2_flag = var69
    dim tank3_flag = var70
    dim missile_flag = var71
    dim laser_powerup_flag = var72
    dim player_flag = var73
    dim debounce_up = var74                   
    dim debounce_down = var75               
    dim debounce_left = var76                 
    dim debounce_right = var77          
    dim debounce_fire = var78               
    dim menu_xposition = var79
    dim menu_yposition = var80
    dim menu_option_skill = var81
    dim menu_option_lives = var82
    dim menu_option_level = var83
    dim menu_selection_color1 = var84
    dim menu_selection_color2 = var85
    dim menu_selection_color3 = var86
    dim menu_selection_color4 = var87
    dim animate6 = var88
    dim level_flag = var89
    dim shake_rnd = var90
    dim animation_counter = var91
    dim cannon_xpos = var92
    dim cannon_ypos = var93
    dim cannon_fire_xpos = var94
    dim cannon_fire_ypos = var95
    dim temp_xpos = var96
    dim temp_ypos = var97
    dim animate4 = var98
    dim animate5 = var99

    dim boss1_defeated_flag=$2600
    dim boss2_defeated_flag=$2601
    dim boss3_defeated_flag=$2602
    dim boss4_defeated_flag=$2603
    dim boss5_defeated_flag=$2604
    dim boss6_defeated_flag=$2605
    dim boss7_defeated_flag=$2606
    dim boss8_defeated_flag=$2607
    dim boss9_defeated_flag=$2608
    dim boss10_defeated_flag=$2609

    dim sprite_move_counter = $2701
    dim sprite_move_flag = $2702
    dim transition_timer = $2703
    dim transition_flag = $2704
    dim boss_vertical_flag = $2705
    dim rocket1_xpos_save = $2706
    dim rocket2_xpos_save = $2707
    dim rocket3_xpos_save = $2708
    dim rocket4_xpos_save = $2709
    dim boss_init_counter = $270A
    dim boss_color = $270B
    dim menupos_flag = $270C

    dim scoref=$270D                                                               ; Boss Health
    dim bossHi=scoref : dim bossMed=scoref+1 : dim bossLo=scoref+2                 ; 
    dim scoree=$2710                                                               ; For High Score Saving
    dim hsHi=scoree : dim hsMed=scoree+1 : dim hsLo=scoree+2                       ; 
    dim scorea=$2713                                                               ; Points - Player Score - Also uses b and c
    dim pointsHi=scorea : dim pointsMed=scorea+1 : dim pointsLo=scorea+2           ; Points - Player Score - Also uses b and c
    dim scoreb=$2716                                                               ; Laser Cooldown - Also uses e and f
    dim laserHi=scoreb  : dim laserMed=scoreb+1  : dim laserLo=scoreb+2            ; Laser Cooldown - Also uses e and f
    dim scorec=$2719                                                               ; Game Level - also uses h and i
    dim levelHi=scorec  : dim levelMed=scorec+1  : dim levelLo=scorec+2            ; Game Level - also uses h and i
    dim scored=$271C                                                               ; Player Health - als use k and l
    dim healthHi=scored : dim healthMed=scored+1 : dim healthLo=scored+2           ; Player Health - als use k and l

    dim man1_xpos = $2720.$2721
    dim man1_ypos = $2722
    dim man2_xpos = $2723.$2724
    dim man2_ypos = $2725
    dim man3_xpos = $2726.$2727
    dim man3_ypos = $2728

    dim tank1_xpos = $2729.$272A
    dim tank1_ypos = $272B
    dim tank2_xpos = $272C.$272D
    dim tank2_ypos = $272E
    dim tank3_xpos = $272F.$2730
    dim tank3_ypos = $2731

    dim missile1_xpos = $2732.$2733
    dim missile1_ypos = $2734
    dim missile2_xpos = $2735.$2736
    dim missile2_ypos = $2737
    dim missile3_xpos = $2738.$2739
    dim missile3_ypos = $273A

    dim cannon1_xpos = $273B.$273C
    dim cannon1_ypos = $273D
    dim medical_truck_xpos = $273E.$273F
    dim medical_truck_ypos = $2740

    dim boss1a_xpos = $2741.$2742
    dim boss1a_ypos = $2743.$2744
    dim boss1b_xpos = $2745.$2746
    dim boss1b_ypos = $2747.$2748
    dim boss1c_xpos = $2749.$274A
    dim boss1c_ypos = $274B.$274C
    dim boss1d_xpos = $274D.$274E
    dim boss1d_ypos = $274F.$2750

    ; Variables re-used from boss1 - they'll never be used at the same time
    dim boss2a_xpos = $2741.$2742
    dim boss2a_ypos = $2743.$2744
    dim boss2b_xpos = $2745.$2746
    dim boss2b_ypos = $2747.$2748
    dim boss2c_xpos = $2749.$274A
    dim boss2c_ypos = $274B.$274C
    dim boss2d_xpos = $274D.$274E
    dim boss2d_ypos = $274F.$2750

    ; Variables re-used from boss1 - they'll never be used at the same time
    dim boss3a_xpos = $2741.$2742
    dim boss3a_ypos = $2743.$2744
    dim boss3b_xpos = $2745.$2746
    dim boss3b_ypos = $2747.$2748
    dim boss3c_xpos = $2749.$274A
    dim boss3c_ypos = $274B.$274C
    dim boss3d_xpos = $274D.$274E
    dim boss3d_ypos = $274F.$2750

    ; Variables re-used from boss1 - they'll never be used at the same time
    dim boss4a_xpos = $2741.$2742
    dim boss4a_ypos = $2743.$2744
    dim boss4b_xpos = $2745.$2746
    dim boss4b_ypos = $2747.$2748
    dim boss4c_xpos = $2749.$274A
    dim boss4c_ypos = $274B.$274C
    dim boss4d_xpos = $274D.$274E
    dim boss4d_ypos = $274F.$2750

    ; Variables re-used from boss1 - they'll never be used at the same time
    dim boss5a_xpos = $2741.$2742
    dim boss5a_ypos = $2743.$2744
    dim boss5b_xpos = $2745.$2746
    dim boss5b_ypos = $2747.$2748
    dim boss5c_xpos = $2749.$274A
    dim boss5c_ypos = $274B.$274C
    dim boss5d_xpos = $274D.$274E
    dim boss5d_ypos = $274F.$2750

    ; Variables re-used from boss1 - they'll never be used at the same time
    dim boss6a_xpos = $2741.$2742
    dim boss6a_ypos = $2743.$2744
    dim boss6b_xpos = $2745.$2746
    dim boss6b_ypos = $2747.$2748
    dim boss6c_xpos = $2749.$274A
    dim boss6c_ypos = $274B.$274C
    dim boss6d_xpos = $274D.$274E
    dim boss6d_ypos = $274F.$2750

    ; Variables re-used from boss1 - they'll never be used at the same time
    dim boss7a_xpos = $2741.$2742
    dim boss7a_ypos = $2743.$2744
    dim boss7b_xpos = $2745.$2746
    dim boss7b_ypos = $2747.$2748
    dim boss7c_xpos = $2749.$274A
    dim boss7c_ypos = $274B.$274C
    dim boss7d_xpos = $274D.$274E
    dim boss7d_ypos = $274F.$2750

    ; Variables re-used from boss1 - they'll never be used at the same time
    dim boss8a_xpos = $2741.$2742
    dim boss8a_ypos = $2743.$2744
    dim boss8b_xpos = $2745.$2746
    dim boss8b_ypos = $2747.$2748
    dim boss8c_xpos = $2749.$274A
    dim boss8c_ypos = $274B.$274C
    dim boss8d_xpos = $274D.$274E
    dim boss8d_ypos = $274F.$2750

    ; Variables re-used from boss1 - they'll never be used at the same time
    dim boss9a_xpos = $2741.$2742
    dim boss9a_ypos = $2743.$2744
    dim boss9b_xpos = $2745.$2746
    dim boss9b_ypos = $2747.$2748
    dim boss9c_xpos = $2749.$274A
    dim boss9c_ypos = $274B.$274C
    dim boss9d_xpos = $274D.$274E
    dim boss9d_ypos = $274F.$2750

    ; Variables re-used from boss1 - they'll never be used at the same time
    dim boss10a_xpos = $2741.$2742
    dim boss10a_ypos = $2743.$2744
    dim boss10b_xpos = $2745.$2746
    dim boss10b_ypos = $2747.$2748
    dim boss10c_xpos = $2749.$274A
    dim boss10c_ypos = $274B.$274C
    dim boss10d_xpos = $274D.$274E
    dim boss10d_ypos = $274F.$2750 

    dim flame4_xpos = $2751.$2752
    dim flame4_ypos = $2753.$2754
    dim flame5_xpos = $2755.$2756
    dim flame5_ypos = $2757.$2758
    dim flame6_xpos = $2759.$275A
    dim flame6_ypos = $275B.$275C
    dim flame7_xpos = $275D.$275E
    dim flame7_ypos = $275F.$2760
    
    dim rocket1_xpos = $27F1.$27F2
    dim rocket1_ypos = $27F3.$27F4
    dim rocket2_xpos = $27F5.$27F6
    dim rocket2_ypos = $27F7.$27F8
    dim rocket3_xpos = $27F9.$27FA
    dim rocket3_ypos = $27FB.$27FC
    dim rocket4_xpos = $27FD.$27FE
    dim rocket4_ypos = $27FF.$2700

    dim rocket5_xpos = $2761.$2762
    dim rocket5_ypos = $2763.$2764
    dim rocket6_xpos = $2765.$2766
    dim rocket6_ypos = $2767.$2768
    dim rocket7_xpos = $2769.$276A
    dim rocket7_ypos = $276B.$276C
    dim rocket8_xpos = $276D.$276E
    dim rocket8_ypos = $276F.$2770

    dim rocketflame1_ypos = $2771
    dim rocketflame2_ypos = $2772
    dim rocketflame3_ypos = $2773
    dim rocketflame4_ypos = $2774
    dim temp_laser_xpos = $2775.$2776
    dim temp_laser_ypos = $2777.$2778
    dim notused35 = $2779.$277A
    dim notused36 = $277B.$277C
    dim arrow_up_xpos = $277D
    dim arrow_down_xpos = $277E
    dim start_option = $277F

    const password1_easy = $2780
    const password2_easy = $2781
    const password3_easy = $2782
    const password4_easy = $2783
    const password5_easy = $2784
    const password6_easy = $2785
    const password7_easy = $2786
    const password8_easy = $2787

    const password1_standard = $2788
    const password2_standard = $2789
    const password3_standard = $278A
    const password4_standard = $278B
    const password5_standard = $278C
    const password6_standard = $278D
    const password7_standard = $278E
    const password8_standard = $278F

    const password1_advanced = $2790
    const password2_advanced = $2791
    const password3_advanced = $2792
    const password4_advanced = $2793
    const password5_advanced = $2794
    const password6_advanced = $2795
    const password7_advanced = $2796
    const password8_advanced = $2797

    const password1_expert = $2798
    const password2_expert = $2799
    const password3_expert = $279A
    const password4_expert = $279B
    const password5_expert = $279C
    const password6_expert = $279D
    const password7_expert = $279E
    const password8_expert = $279F

    dim pwdpos1 = $27E7
    dim pwdpos2 = $27E8 
    dim pwdpos3 = $27E9 
    dim pwdpos4 = $27EA 
    dim pwdpos5 = $27EB
    dim pwdpos6 = $27EC
    dim pwdpos7 = $27ED
    dim pwdpos8 = $27EF

    dim password1 = $27F0
    dim password2 = $27F1
    dim password3 = $27F2
    dim password4 = $27F3 
    dim password5 = $27F4 
    dim password6 = $27F5 
    dim password7 = $27F6 
    dim password8 = $27F7 
    dim pwdcolor1 = $27F8 
    dim pwdcolor2 = $27F9 
    dim pwdcolor3 = $27FA 
    dim pwdcolor4 = $27FB 
    dim pwdcolor5 = $27FC 
    dim pwdcolor6 = $27FD 
    dim pwdcolor7 = $27FE 
    dim pwdcolor8 = $27FF 

    ;──═◙ Import Graphics
    incgraphic gfx/ex2/font4.png 160A 0 1 2 3
    incgraphic gfx/ex2/text_score.png 160A 1 0 2 3
    incgraphic gfx/ex2/text_laser.png 160A 1 0 2 3
    incgraphic gfx/ex2/text_level.png 160A 1 0 2 3
    incgraphic gfx/ex2/text_health.png 160A 1 0 2 3
    incgraphic gfx/ex2/text_gameover.png 160A 1 0 2 3
    incgraphic gfx/ex2/text_bomb.png
    incgraphic gfx/ex2/bottomlayer1.png 160A 0 1 2 3
    incgraphic gfx/ex2/bottomlayer2.png 160A 1 0 2 3
    incgraphic gfx/ex2/bottomlayer3.png 160A 1 0 2 3
    incgraphic gfx/ex2/bottomlayer41.png 160A 1 0 2 3
    incgraphic gfx/ex2/bottomlayer42.png 160A 1 0 2 3
    incgraphic gfx/ex2/top_bar_1.png 160A 1 0 2 3
    incgraphic gfx/ex2/top_bar_2.png 160A 1 0 2 3
    incgraphic gfx/ex2/top_bar_3.png 160A 1 0 2 3
    incgraphic gfx/ex2/laser.png 160A 1 0 2 3
    newblock
    incgraphic gfx/ex2/drone1.png 160A 1 0 2 3
    incgraphic gfx/ex2/drone2.png 160A 1 0 2 3
    incgraphic gfx/ex2/drone3.png 160A 1 0 2 3
    incgraphic gfx/ex2/drone4.png 160A 1 0 2 3
    incgraphic gfx/ex2/drone1_left.png 160A 1 0 2 3
    incgraphic gfx/ex2/drone2_left.png 160A 1 0 2 3
    incgraphic gfx/ex2/drone3_left.png 160A 1 0 2 3
    incgraphic gfx/ex2/drone4_left.png 160A 1 0 2 3
    incgraphic gfx/ex2/drone1_right.png 160A 1 0 2 3
    incgraphic gfx/ex2/drone2_right.png 160A 1 0 2 3
    incgraphic gfx/ex2/drone3_right.png 160A 1 0 2 3
    incgraphic gfx/ex2/drone4_right.png 160A 1 0 2 3
    incgraphic gfx/ex2/drone_explode1.png 160A 1 0 2 3
    incgraphic gfx/ex2/drone_explode2.png 160A 1 0 2 3
    incgraphic gfx/ex2/drone_explode3.png 160A 1 0 2 3
    incgraphic gfx/ex2/drone_explode4.png 160A 1 0 2 3
    incgraphic gfx/ex2/bomb_large_up.png 160A 1 0 2 3
    incgraphic gfx/ex2/bomb_small_up.png 160A 1 0 2 3
    incgraphic gfx/ex2/shield_top.png 160A 1 0 2 3
    incgraphic gfx/ex2/shield_bottom.png 160A 1 0 2 3

    characterset font4
    alphachars '0123456789abcdefghijklmnopqrstuvwxyz! >`?/.,:-_()[]&AB@*"#'

    gosub aa_logo_display bank8
game_restart
    gosub menuscreen bank3
    if start_option>0 then gosub init_with_password bank2
    if start_option=0 then gosub Init bank2
    mutesfx tia7
    drawscreen

    ;------------------------------------------MAIN LOOP-----------------------------------------------------------------

MainLoop

    ; ════════════════════════════════════════════════════════════════════════════
    ; Section 1: Game Logic
    ; ════════════════════════════════════════════════════════════════════════════
    
    if transition_flag=0 then BACKGRND=$00

    ; Pause for a sec when the game first starts
    ; It prevents you from firing the laser for the first few seconds of the game, and plots the "glitch" offscreen.  
    frame=frame+1
    if frame<20 && init_flag=0 then laser_x_offset_1=200:tank1_xpos=200:tank2_xpos=200:tank3_xpos=200:man1_xpos=200:man2_xpos=200:man3_xpos=200
    if frame=20 && init_flag=0 then gosub draw_laser_alt:init_flag=1

    gosub game_logic bank2

    ;gosub boss1_battle bank4
    ;goto password_screen bank16


    ; If in transition phase, skip collision detection
    if transition_flag=1 then goto DefenseBeamEnd

    ; ═══════════════════════════════
    ; Section 2: Collision Detection
    ; ═══════════════════════════════

    ; * Idle Collisions
    ;────────────────────────────────────────
    ;──═◙ Detect Hit with Laser Powerup/Recharge Sprite
    asm
    QBOXCOLLISIONCHECK laser_powerup_xpos,laser_powerup_ypos,16,8,drone_xpos,drone_ypos,16,8
end
    if CARRY && gamedifficulty=0 then laserLo=$99:gosub sfx_powerup bank2
    if CARRY && gamedifficulty=1 then laserLo=$75:gosub sfx_powerup bank2
    if CARRY && gamedifficulty=2 then laserLo=$50:gosub sfx_powerup bank2
    if CARRY && gamedifficulty=3 then laserLo=$25:gosub sfx_powerup bank2


    if gamedifficulty<2 then goto skip_cannon_fire
    ;────────────────────────────────────────
    ;──═◙ Detect Hit with Cannon Fire (Advanced and Expert Modes only)
    asm
    QBOXCOLLISIONCHECK cannon_fire_xpos,cannon_fire_ypos,16,8,drone_xpos,drone_ypos,16,8
end
     if CARRY then dec scored=scored-1:gosub shake_drone:gosub sfx_defense_beam
skip_cannon_fire


    ; skip missiles 1 and 2 that aren't in the easy level.
    if gamedifficulty<1 then goto skip_missile_coll
   
    ;────────────────────────────────────────
    ;──═◙ Detect hits between the drone and the cruise missiles
    asm
    QBOXCOLLISIONCHECK missile1_xpos,missile1_ypos,16,8,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone
    asm
    QBOXCOLLISIONCHECK missile2_xpos,missile2_ypos,16,8,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone
skip_missile_coll
    asm
    QBOXCOLLISIONCHECK missile3_xpos,missile3_ypos,16,8,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone

    
    if fire_debounce_1<>1 then goto skipcoll2 ; If you're not pressing the fire button, you can't hit the tanks, soldiers, or medical truck. skip the next 3 sections of code.
    if laserLo=$00 then goto skipcoll0 ; Avoid collisions if your laser energy level is at zero
    ;────────────────────────────────────────
    ;──═◙ Detect hits with Medical Truck
    asm
    QBOXCOLLISIONCHECK crosshair_x_offset_1,laser_y_offset_10,4,4,medical_truck_xpos,medical_truck_ypos,16,8
end
    if CARRY then dec healthLo=healthLo-1:healthMed=$00:gosub sfx_medical_truck:medtruck_flag=1 else medtruck_flag=0
skipcoll0   


    ;────────────────────────────────────────
    ;──═◙ Detect hits with enemy tanks
    if crosshair_x_offset_1=200 then goto skipcoll1 ; Avoid additional scoring after death animation shows up
    if laserLo=$00 then goto skipcoll1 ; Avoid collisions if your laser energy level is at zero
    asm
    QBOXCOLLISIONCHECK crosshair_x_offset_1,laser_y_offset_10,4,4,tank1_xpos,tank1_ypos,16,8
end
    if CARRY then tank1_flag=1:animate3=0: gosub sfx_tanks
    asm
    QBOXCOLLISIONCHECK crosshair_x_offset_1,laser_y_offset_10,4,4,tank2_xpos,tank2_ypos,16,8
end
    if CARRY then tank2_flag=1:animate4=0: gosub sfx_tanks
    asm
    QBOXCOLLISIONCHECK crosshair_x_offset_1,laser_y_offset_10,4,4,tank3_xpos,tank3_ypos,16,8
end
    if CARRY then tank3_flag=1:animate5=0: gosub sfx_tanks
skipcoll1


    ;────────────────────────────────────────
    ;──═◙ Detect hits with Soldiers  
    if crosshair_x_offset_1=200 then goto skipcoll2 ; Avoid additional scoring after death animation shows up
    if laserLo=$00 then goto skipcoll2 ; Avoid collisions if your laser energy level is at zero
    asm
    QBOXCOLLISIONCHECK crosshair_x_offset_1,laser_y_offset_10,4,4,man1_xpos,man1_ypos,8,8
end
    if CARRY then man1_flag=1:animate6=0: gosub sfx_roarcheep
    asm
    QBOXCOLLISIONCHECK crosshair_x_offset_1,laser_y_offset_10,4,4,man2_xpos,man2_ypos,8,8
end
    if CARRY then man2_flag=1:animate6=0: gosub sfx_roarcheep
    asm
    QBOXCOLLISIONCHECK crosshair_x_offset_1,laser_y_offset_10,4,4,man3_xpos,man3_ypos,8,8
end
    if CARRY then man3_flag=1:animate6=0: gosub sfx_roarcheep
skipcoll2


    ;────────────────────────────────────────
    ;──═◙ Detect hits with City Defense Beam 
    if beam_counter<30 && fire_debounce_1=1 then goto DefenseBeamEnd ; Beam is firing, however it's not plotted because the fire button is pressed. Skip collision detection. 
    if beam_counter>29 then goto DefenseBeamEnd  ; Beam is not firing, don't detect collision
    asm
    QBOXCOLLISIONCHECK defensebeam_x_offset_1,defensebeam_y_offset_1,4,8,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_defense_beam:gosub shake_drone:goto DefenseBeamEnd
    asm
    QBOXCOLLISIONCHECK defensebeam_x_offset_1,defensebeam_y_offset_2,4,8,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_defense_beam:gosub shake_drone:goto DefenseBeamEnd
    asm
    QBOXCOLLISIONCHECK defensebeam_x_offset_1,defensebeam_y_offset_3,4,8,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_defense_beam:gosub shake_drone:goto DefenseBeamEnd
    asm
    QBOXCOLLISIONCHECK defensebeam_x_offset_1,defensebeam_y_offset_4,4,8,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_defense_beam:gosub shake_drone:goto DefenseBeamEnd
    asm
    QBOXCOLLISIONCHECK defensebeam_x_offset_1,defensebeam_y_offset_5,4,8,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_defense_beam:gosub shake_drone:goto DefenseBeamEnd
    asm
    QBOXCOLLISIONCHECK defensebeam_x_offset_1,defensebeam_y_offset_6,4,8,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_defense_beam:gosub shake_drone:goto DefenseBeamEnd
    asm
    QBOXCOLLISIONCHECK defensebeam_x_offset_1,defensebeam_y_offset_7,4,8,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_defense_beam:gosub shake_drone:goto DefenseBeamEnd
    asm
    QBOXCOLLISIONCHECK defensebeam_x_offset_1,defensebeam_y_offset_8,4,8,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_defense_beam:gosub shake_drone:goto DefenseBeamEnd
    asm
    QBOXCOLLISIONCHECK defensebeam_x_offset_1,defensebeam_y_offset_9,4,8,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_defense_beam:gosub shake_drone:goto DefenseBeamEnd
DefenseBeamEnd

    ; ═══════════════════════════════════════════════════
    ; Section 3: Display Logic (Plot Sprites and Values)
    ; ═══════════════════════════════════════════════════

    restorescreen
    
    ;──═◙ Plot Crosshair Targeting on the ground
    if drone_ypos>21 then plotsprite crosshair2 0 temp_xpos temp_ypos ; crosshair only shows up when you're able to shoot, disabled less than y22

    ;──═◙ Subroutine for drawing all on-screen sprites.  It won't fit in bank 1.
    gosub sprite_draw bank2
    
    ;──═◙ Plot the city defense beam
    ;  Defense beam will not fire if you're firing your laser
    if cannon1_xpos>160 then goto skip_plot_defensebeam ; If the cannon is off screen, don't plot it or play the sound effect
    if beam_counter<30 && fire_debounce_1<>1 && animate2=3 then gosub draw_defensebeam bank2:gosub sfx_plainlaser bank2:goto skiplaserfire ; 37b skip laserfire when defense beam is active
skip_plot_defensebeam

    ;──═◙ Plot the laser when you press the fire button
    if joy0left || joy0right then goto skiplaserfire  ; You can only fire when you're not moving
    if joy0up || joy0down then goto skiplaserfire     ; ...
    if laser_fire_flag=1 || init_flag=0 then goto skiplaserfire
    if laserLo=$00 && fire_debounce_1=1 then gosub sfx_no_ammo bank2:goto skiplaserfire
    if drone_ypos<22 then goto skiplaserfire ; If you are too high up you can't fire
    if laserLo<>0 && fire_debounce_1=1 && animate2=3 then gosub sfx_pulsecannon bank2:gosub draw_laser bank2
    if fire_debounce_1<>1 then crosshair_x_offset_1=200
skiplaserfire


    if gamedifficulty>1 then gosub cannon_fire bank2 ; Add cannon for advanced and expert levels

    ;Shield displays properly, however it adds some graphical glitches.  There's already too many sprites on the screen.
    ;if fire_debounce_0=2 then gosub draw_shield bank2

    gosub draw_medical_truck



    drawscreen

  goto MainLoop

 ;------------------------------------------END MAIN LOOP-----------------------------------------------------------------

shake_drone
   shake_rnd=rand&7
   if shake_rnd=0 then drone_xpos=drone_xpos+1
   if shake_rnd=1 then drone_xpos=drone_xpos+2
   if shake_rnd=2 then drone_xpos=drone_xpos-1
   if shake_rnd=3 then drone_xpos=drone_xpos-2
   if shake_rnd=4 then drone_ypos=drone_ypos+1
   if shake_rnd=5 then drone_ypos=drone_ypos+2
   if shake_rnd=6 then drone_ypos=drone_ypos-1
   if shake_rnd=7 then drone_ypos=drone_ypos-2
   return

   ;note - add variable pitch
   ;temp7=rand&3 : rem set temp7 to a random number from 0-3
   ;playsfx sfx_lasershot temp7

sfx_defense_beam
   temp7=rand&3
   playsfx sfx_simplebuzz temp7
   return

sfx_missiles
   playsfx sfx_simplebuzz
   return

sfx_tanks
   playsfx sfx_bigboom
   return

sfx_plainlaser
   playsfx sfx_plainlaser
   return

sfx_no_ammo
   playsfx sfx_no_ammo
   return

sfx_pulsecannon
   playsfx sfx_pulsecannon
   return

sfx_powerup
   playsfx sfx_powerup
   return

sfx_simplebuzz
   playsfx sfx_simplebuzz
   return

sfx_roarcheep
   playsfx sfx_roarcheep
   return

sfx_medical_truck
   playsfx sfx_medical_truck
   return

   ;──═◙ Audio Data
    data sfx_plainlaser
    $10,$01,$00 ; version, priority, frames per chunk
    $10,$04,$01 ; first chunk of freq,channel,volume
    $13,$04,$08
    $16,$04,$08
    $16,$04,$07
    $1c,$04,$09
    $0b,$0c,$0f
    $0d,$0c,$0f
    $0e,$0c,$0f
    $0e,$0c,$0f
    $12,$0c,$0f
    $03,$06,$0d
    $1e,$0c,$0a
    $1e,$0c,$0c
    $0a,$06,$04
    $00,$00,$00
end

    data sfx_no_ammo
    $10,$02,$00 ; version, priority, frames per chunk
    $07,$08,$04 ; first chunk of freq,channel,volume
    $07,$08,$06
    $07,$08,$08
    $09,$08,$08
    $0c,$08,$0a
    $09,$08,$0a
    $0c,$08,$0a
    $09,$08,$0a
    $0d,$08,$08
    $0e,$08,$06
    $09,$08,$04
    $09,$08,$02
    $00,$00,$00
end

    data sfx_pulsecannon
    $10,$03,$00 ; version, priority, frames per chunk
    $1e,$0c,$0a ; first chunk of freq,channel,volume
    $07,$06,$0f
    $07,$06,$0f
    $1e,$06,$0f
    $17,$0c,$0b
    $1b,$0c,$0b
    $1e,$0c,$0f
    $07,$06,$0f
    $07,$06,$0f
    $1e,$06,$08
    $17,$0c,$06
    $1b,$0c,$0f
    $1e,$0c,$0f
    $07,$06,$0f
    $07,$06,$0f
    $0a,$06,$0a
    $17,$0c,$0a
    $1e,$0c,$04
    $1e,$06,$09
    $1b,$04,$05
    $07,$06,$0f
    $0a,$06,$09
    $17,$0c,$0d
    $1b,$0c,$09
    $0a,$06,$05
    $17,$0c,$03
    $00,$00,$00
end

    data sfx_bigboom
    $10,$04,$00 ; version, priority, frames per chunk
    $1d,$07,$0f ; first chunk of freq,channel,volume
    $1e,$06,$0f
    $00,$06,$0f
    $14,$07,$0f
    $13,$0f,$0f
    $1b,$07,$0f
    $0e,$07,$0f
    $1b,$07,$0f
    $0f,$07,$0f
    $10,$07,$0f
    $10,$06,$0f
    $16,$07,$0f
    $0d,$0f,$0f
    $1e,$0c,$0f
    $16,$01,$0f
    $17,$01,$0f
    $10,$07,$0f
    $10,$0f,$0f
    $15,$07,$0d
    $1a,$07,$0f
    $1a,$01,$0f
    $1a,$07,$0f
    $14,$0f,$0f
    $16,$07,$0f
    $16,$07,$0f
    $15,$07,$0f
    $17,$07,$0f
    $13,$0f,$0f
    $13,$0f,$0f
    $19,$0f,$0f
    $18,$07,$0c
    $0b,$06,$0c
    $1e,$01,$0d
    $10,$01,$0d
    $14,$07,$0f
    $16,$06,$0c
    $17,$07,$0c
    $1a,$01,$0c
    $12,$06,$0d
    $17,$07,$0c
    $0b,$0f,$0c
    $19,$07,$09
    $19,$07,$0b
    $0b,$0f,$09
    $0d,$0e,$0b
    $0d,$0e,$0b
    $19,$0f,$09
    $0e,$0f,$06
    $1b,$0c,$08
    $18,$0f,$08
    $13,$07,$05
    $1a,$01,$05
    $17,$0f,$08
    $16,$06,$08
    $0c,$06,$05
    $1c,$0f,$06
    $16,$06,$08
    $0b,$06,$06
    $12,$06,$04
    $0f,$0f,$05
    $11,$07,$06
    $09,$06,$05
    $10,$06,$05
    $10,$06,$05
    $10,$06,$05
    $11,$0f,$04
    $15,$0f,$04
    $1e,$07,$05
    $16,$01,$04
    $16,$01,$04
    $1a,$0f,$04
    $19,$0f,$02
    $1e,$0f,$02
    $1b,$0f,$02
    $1e,$0f,$02
    $1c,$0f,$02
    $0d,$0f,$01
    $0f,$06,$02
    $0e,$06,$01
    $18,$0f,$01
    $0b,$06,$02
    $16,$0f,$01
    $17,$0f,$01
    $13,$06,$01
    $0f,$0e,$01
    $00,$00,$00
end

    data sfx_powerup
    $10,$05,$00 ; version, priority, frames per chunk
    $0a,$08,$04 ; first chunk of freq,channel,volume
    $12,$08,$06
    $09,$08,$08
    $11,$08,$08
    $08,$08,$0a
    $10,$08,$0a
    $07,$08,$0a
    $0F,$08,$0a
    $06,$08,$08
    $0E,$08,$06
    $05,$08,$04
    $0D,$08,$02
    $00,$00,$00
end

 data sfx_simplebuzz ; bass bump
    $10,$06,$00 ; version, priority, frames per chunk
    $1b,$0c,$0f ; first chunk of freq,channel,volume
    $0f,$06,$0c
    $07,$06,$0e
    $0f,$06,$0f
    $0f,$06,$0f
    $0f,$06,$0f
    $07,$06,$06
    $0f,$06,$0f
    $1b,$0c,$04
    $0f,$06,$05
    $0f,$06,$06
    $07,$06,$01
    $0f,$06,$03
    $00,$00,$00
end

    data sfx_roarcheep
    $10,$10,$00 ; version, priority, frames per chunk
    $0a,$06,$00 ; first chunk of freq,channel,volume
    $0e,$0f,$01
    $12,$0e,$09
    $0a,$0e,$07
    $0a,$0f,$0e
    $1b,$07,$0f
    $1b,$06,$0c
    $13,$0f,$0e
    $15,$0f,$0d
    $0f,$0e,$0f
    $19,$0f,$0f
    $0d,$0f,$07
    $0e,$0e,$08
    $0f,$0f,$08
    $0a,$01,$09
    $0d,$0e,$0b
    $19,$07,$0c
    $10,$0f,$0f
    $16,$07,$0f
    $10,$04,$0f
    $17,$04,$0f
    $15,$04,$0e
    $1b,$07,$0f
    $1f,$06,$0c
    $12,$0f,$0b
    $1a,$06,$04
    $1f,$01,$04
    $0a,$0e,$09
    $0f,$0e,$0b
    $0f,$0e,$07
    $0f,$0e,$06
    $0f,$0e,$05
    $0f,$0e,$03
    $0f,$0e,$01
    $00,$00,$00
end

    data sfx_medical_truck
    $10,$10,$00 ; version, priority, frames per chunk
    $1c, $07, $0f
    $1b, $07, $0f
    $1c, $07, $0f
    $1a, $0c, $0f
    $12, $0c, $0f
    $1e, $07, $0e
    $17, $0c, $0e
    $1d, $07, $08
    $12, $0c, $08
    $18, $07, $09
    $17, $0c, $08
    $12, $0c, $07
    $1b, $0c, $04
    $14, $0c, $01
    $13, $01, $01
    $00,$00,$00
end

 


 bank 2

    incgraphic gfx/ex2/progress_bar_full.png  160A 1 0 2 3
    incgraphic gfx/ex2/progress_bar_line.png  160A 1 0 2 3
    ;incbanner gfx/ex2/drone_title_bar_alt.png 160A 0 1 2 3

    ;──═◙ On-Screen Scrolling Text Display

CopyTextZoneContentToRam

    ; Change message based on laser charge and drone health
    if laserLo>$15 && healthMed<$01 && healthLo<$26 then goto msg_health       ; laser level normal, health low
    if laserLo<$16 && healthLo>$26 then goto msg_laser                         ; laser level low, health normal
    if laserLo<$16 && healthMed<$01 && healthLo<$26 then goto msg_laser_health ; laser and health are low
    
msg_default
    asm
    SET_POINTER pointer,textZoneContent_default
end
    goto continue_1

msg_laser
    asm
    SET_POINTER pointer,textZoneContent_laser
end
    goto continue_1

msg_health
    asm
    SET_POINTER pointer,textZoneContent_health
end
    goto continue_1

msg_laser_health
    asm
    SET_POINTER pointer,textZoneContent_laser_health
end
    goto continue_1

continue_1
    temp1 = IncrementPointerBy(textZoneIndex)
    for offsetX = 0 to 39
    textZoneRAM[offsetX] = pointer[[offsetX]]
    next

    ;──═◙ Scrolling Speed
    data scrollZoneSpeed
    1
    2,2
    3,3,3
    4,4,4,4
end

    asm
IncrementPointerBy
    sta temp1
    lda pointer
    clc
    adc temp1
    sta pointer
    bcc exitIncrementPointerBy
    inc pointerHi
exitIncrementPointerBy
    rts
end

    ;──═◙ On-Screen Text Data
    alphadata textZoneContent_default font4
    '                                        '
    'take out the soldiers!                                                                                        '
    'destroy enemy tanks!                                                                                          '
    '                                        '
end
    alphadata textZoneContent_laser font4
    '                                        '
    'laser charge is low!                                                                                          '
    'recharge your laser commander!                                                                                '
    '                                        '
end
    alphadata textZoneContent_health font4
    '                                        '
    'drone health is low!                                                                                          '
    'fly defensively commander!                                                                                    '
    '                                        '
end
    alphadata textZoneContent_laser_health font4
    '                                        '
    'laser charge and health are low!                                                                              '
    'be careful out there commander!                                                                               '
    '                                        '
end

    inline blockbank8.asm

game_logic

    ;──═◙ Health Check
    if healthLo=$00 && healthMed = $01 then goto skiphealthcheck
    ; Game Over
    if healthLo<$01 || healthMed>$01 then healthLo=$00:healthMed=$00:player_flag=1; if health falls to zero, you are dead - add animation, explosion, game over, etc.
    if player_flag=1 then goto game_over bank2
skiphealthcheck

    ;──═◙ Level Check
    gosub level_check bank8
    if player_flag=1 then goto game_over bank2

    ;──═◙ Control Transition to Boss Area
    if transition_flag=1 then transition_timer=transition_timer+1
    if transition_flag=1 && transition_timer<100 then gosub move_sprites_offscreen
    if transition_flag=1 && transition_timer>90 then gosub sfx_defense_beam  ;: BACKGRND=$40
    if transition_timer=99 && level_flag=2 && boss1_defeated_flag=0 then transition_flag=0:gosub boss_l2 bank8:gosub level_up bank2
    if transition_timer=99 && level_flag=4 && boss2_defeated_flag=0 then transition_flag=0:gosub boss_l3 bank8:gosub level_up bank2
    if transition_timer=99 && level_flag=6 && boss3_defeated_flag=0 then transition_flag=0:gosub boss_l4 bank8:gosub level_up bank2
    if transition_timer=99 && level_flag=8 && boss4_defeated_flag=0 then transition_flag=0:gosub boss_l5 bank8:gosub level_up bank2
    if transition_timer=99 && level_flag=10 && boss5_defeated_flag=0 then transition_flag=0:gosub boss_l6 bank8:gosub level_up bank2
    if transition_timer=99 && level_flag=12 && boss6_defeated_flag=0 then transition_flag=0:gosub boss_l7 bank8:gosub level_up bank2
    if transition_timer=99 && level_flag=14 && boss7_defeated_flag=0 then transition_flag=0:gosub boss_l8 bank8:gosub level_up bank2
    if transition_timer=99 && level_flag=16 && boss8_defeated_flag=0 then transition_flag=0:gosub boss_l9 bank8:gosub level_up bank2
    if transition_timer=99 && level_flag=18 && boss9_defeated_flag=0 then transition_flag=0:gosub boss_l10 bank8:gosub level_up bank2
    if transition_timer=99 && level_flag=20 && boss10_defeated_flag=0 then transition_flag=0:gosub boss_l11 bank8:gosub level_up bank2

    ;──═◙ Background Color
    BACKGRND = $00; Top of Screen 

    ;──═◙ Plot Crosshair Targeting on the ground
    temp_ypos = drone_ypos+81
    temp_xpos = drone_xpos+6
    
    if fire_debounce_0=2 && smart_bomb>0 then gosub sfx_tanks:gosub fire_smart_bomb

    ;──═◙ Fire Cannon (Bottom of the screen)
    if beam_counter<30 then cannon_fire_ypos=cannon_fire_ypos-4 
    if beam_counter>29 || cannon_fire_ypos<6 then cannon_fire_ypos=163

    ;──═◙ Check for Game Reset
    if switchreset then reboot

   ;──═◙ Debounce Fire Buttons
    if joy0fire1 then fire_debounce_1=1
    if !joy0fire1 && fire_debounce_1=1 then fire_debounce_1=2

    if joy0fire0 then fire_debounce_0=1
    if !joy0fire0 && fire_debounce_0=1 then fire_debounce_0=2

    ;──═◙ Increment frame and animation counters
    beam_counter=beam_counter+1
    if beam_counter>100 then beam_counter=1
    frame_counter=frame_counter+1
    if frame_counter>2 then frame_counter=0:man1_xpos=man1_xpos+0.6:man2_xpos=man2_xpos+1.0:man3_xpos=man3_xpos+1.4
    if frame_counter=2 then animate1=animate1+1:cannon_xpos=cannon_xpos+1 :cannon_fire_xpos=cannon_fire_xpos+1
    if animate1>3 then animate1=0 : tank1_xpos=tank1_xpos+0.5: tank2_xpos=tank2_xpos+0.9: tank3_xpos=tank3_xpos+1.3
    animate2=animate2+1
    if animate2>4 then animate2=0
    if animate2=3 then animate3=animate3+1:animate4=animate4+1:animate5=animate5+1  
    if animate3>3 && tank1_flag=1 then tank1_flag=0:dec scorea=scorea+175:tank1_xpos=200:crosshair_x_offset_1=200
    if animate4>3 && tank2_flag=1 then tank2_flag=0:dec scorea=scorea+175:tank2_xpos=200:crosshair_x_offset_1=200
    if animate5>3 && tank3_flag=1 then tank3_flag=0:dec scorea=scorea+175:tank3_xpos=200:crosshair_x_offset_1=200
    if animate3>3 then animate3=0
    if animate4>3 then animate4=0
    if animate5>3 then animate5=0
    frame_counter2=frame_counter2+1
    if frame_counter2>20 then frame_counter2=0
    
    ;──═◙ Medical truck
    medical_truck_xpos=medical_truck_xpos+0.4
    if medical_truck_ypos=168 && medical_truck_xpos=180 then medical_truck_ypos=136:medical_truck_xpos=181
    if medical_truck_ypos=136 && medical_truck_xpos=180 then medical_truck_ypos=168:medical_truck_xpos=181

    animation_counter=animation_counter+1
    if animation_counter>3 then animation_counter=0:animate6=animate6+1
    if animate6>7 && man1_flag=1 then man1_flag=0:man1_xpos=200:dec scorea=scorea+225:crosshair_x_offset_1=200
    if animate6>7 && man2_flag=1 then man2_flag=0:man2_xpos=200:dec scorea=scorea+225:crosshair_x_offset_1=200
    if animate6>7 && man3_flag=1 then man3_flag=0:man3_xpos=200:dec scorea=scorea+225:crosshair_x_offset_1=200
    if animate6>7 then animate6=0

    ;──═◙ Tank and Soldier Speed based on level selection
    tank1_xpos=tank1_xpos+tank1_speed:tank2_xpos=tank2_xpos+tank2_speed:tank3_xpos=tank3_xpos+tank3_speed
    man1_xpos=man1_xpos+man1_speed:man2_xpos=man2_xpos+man2_speed:man3_xpos=man3_xpos+man3_speed 
    ;cannon1_xpos=cannon1_xpos+cannon1_speed        
  
    ;──═◙ Laser Fire Counter / Status
    if laserLo<1 then laserLo=0
    if fire_debounce_1=1 && frame_counter=2 && laserLo<>0 && drone_ypos>21 && laser_fire_flag=0 then dec laserLo=laserLo-1 ; fire button pressed, frame counter at 2, in firing range below Y22

    if laser_counter>10 then laser_fire_flag=1 
    if fire_debounce_1=1 then laser_counter=laser_counter+1 else laser_fire_flag=0:laser_counter=0

    ;──═◙ Flip direction of the drone based on facing left or right
    if joy0left then joydir = 1   ; Face Left
    if joy0right then joydir = 2  ; Face Right

    ;──═◙ Move the drone on the screen
    if joy0right then drone_xpos=drone_xpos+1+drone_speed
    if joy0left then drone_xpos=drone_xpos-1-drone_speed
    if joy0up then drone_ypos=drone_ypos-1-drone_speed
    if joy0down then drone_ypos=drone_ypos+1+drone_speed

    ;──═◙ Keep the drone on the screen
    if transition_flag=1 then goto skipdrone
    if player_flag=1 || player_flag=2 then goto skipdrone
    if drone_ypos>90 then drone_ypos=90
    if drone_ypos<8 then drone_ypos=8
    if drone_xpos<8 then drone_xpos=8
    if drone_xpos>128 then drone_xpos=128
skipdrone

    ;──═◙ Change direction of the landscape scrolling based on the direction you're moving the drone
    if joy0left then direction = 1 : medical_truck_xpos=medical_truck_xpos+0.8
    if joy0right then direction = 0: medical_truck_xpos=medical_truck_xpos-0.9

    ;──═◙ Increase/decrease speed of enemies on the ground based on helicopter movement
    if joy0right then tank1_xpos=tank1_xpos-1.4:tank2_xpos=tank2_xpos-1.3:tank3_xpos=tank3_xpos-1.2:cannon1_xpos=cannon1_xpos-1.6:man1_xpos=man1_xpos-1.5:man2_xpos=man2_xpos-1.3:man3_xpos=man3_xpos-1.1
    if joy0left then tank1_xpos=tank1_xpos+1.4:tank2_xpos=tank2_xpos+1.3:tank3_xpos=tank3_xpos+1.2:cannon1_xpos=cannon1_xpos+1.6:man1_xpos=man1_xpos+1.5:man2_xpos=man2_xpos+1.3:man3_xpos=man3_xpos+1.1
    if gamedifficulty>2 then cannon1_xpos=cannon1_xpos+0.8
    
    if gamedifficulty<1 then goto skip_missile12 ; Only missile3 on the easy level
    ;──═◙ Move the cruise missiles on the screen &     
    ; Missiles track the drone randomly
    ;──═◙ if missile is off-screen, reposition Y value
    if missile1_xpos>180 && missile1_xpos<200 then missile1_ypos=(rand&32)+27
    if missile2_xpos>180 && missile2_xpos<200 then missile2_ypos=(rand&32)+37
    if (rand&7)<2 && missile1_ypos<drone_ypos && missile1_xpos>drone_xpos then missile1_ypos=missile1_ypos+1
    if (rand&7)<2 && missile1_ypos>drone_ypos && missile1_xpos>drone_xpos then missile1_ypos=missile1_ypos-1
    if (rand&7)<1 && missile2_ypos<drone_ypos && missile2_xpos>drone_xpos then missile2_ypos=missile2_ypos+1
    if (rand&7)<1 && missile2_ypos>drone_ypos && missile2_xpos>drone_xpos then missile2_ypos=missile2_ypos-1
    if missile1_ypos>90 && missile1_xpos>180 then missile1_ypos=(rand&64)+4
    if missile2_ypos>90 && missile2_xpos>180 then missile2_ypos=(rand&64)-4
    missile1_xpos=missile1_xpos-missile1_speed
    missile2_xpos=missile2_xpos-missile2_speed
skip_missile12
    if missile3_xpos>180 && missile3_xpos<200 then missile3_ypos=(rand&32)+47
    if (rand&7)<2 && missile3_ypos<drone_ypos && missile3_xpos>drone_xpos then missile3_ypos=missile3_ypos+1
    if (rand&7)<2 && missile3_ypos>drone_ypos && missile3_xpos>drone_xpos then missile3_ypos=missile3_ypos-1
    if missile3_ypos>90 && missile3_xpos>180 then missile3_ypos=rand&64
    missile3_xpos=missile3_xpos-missile3_speed
    
    ;Move laser recharge laser_powerup
    laser_powerup_xpos=laser_powerup_xpos+1
    if beam_counter<30 then laser_powerup_xpos=laser_powerup_xpos+2
    ;if beam_counter>29 && beam_counter<71 then laser_powerup_xpos=laser_powerup_xpos-3
    if beam_counter>70 then laser_powerup_xpos=laser_powerup_xpos-3

    ;──═◙ Scroll zone
    if transition_flag=1 then direction=1:speed=speed+1:goto transition_skip
    ; If you're not moving the joystick, don't scroll.  Still scrolls in last direction when you move up or down.
    if !joy0any then goto skip1
    if joy0up && !joy0left && !joy0left && frame_counter=1 then goto skip1
    if joy0down && !joy0left && !joy0left && frame_counter=1 then goto skip1
transition_skip
    for index = 0 to 9
    speed = scrollZoneSpeed[index] : if direction then speed = (speed^$ff)+1
    offsetY = 12+index
    temp1 = ShiftZone(3,offsetY,speed)
    next
skip1
    ;──═◙ Scrolling Text
    ;──═◙ Set Scrolling text message

    if (framecounter&7) > 0 then goto mainLoopSkipUpdateText
    ; Increment Text Zone
    textZoneIndex = textZoneIndex+1 : gosub CopyTextZoneContentToRam
    ; When the text rotates change the direction of the scrolling
    if textZoneIndex = 0 then direction = direction+1 : if direction > 1 then direction = 0
mainLoopSkipUpdateText

    return

fire_smart_bomb
   tank1_flag=1:tank2_flag=1:tank3_flag=1:man1_flag=1:man2_flag=1:man3_flag=1:missile1_xpos=200:missile2_xpos=200:missile3_xpos=200:medical_truck_xpos=162
   tank1_xpos=162:tank2_xpos=162:tank3_xpos=162:man1_flag=162:man2_flag=162:man3_flag=162:cannon1_xpos=170
   BACKGRND=$40
   if smart_bomb=3 then smart_bomb=2:fire_debounce_0=0:return
   if smart_bomb=2 then smart_bomb=1:fire_debounce_0=0:return
   if smart_bomb=1 then smart_bomb=0:fire_debounce_0=0:return
   return

checkhighscore 
   rem  ** Checks for a new high score.
   if pointsHi > hsHi then goto New_High_Score
   if pointsHi < hsHi then goto Skip_High_Score
   rem  ** First byte equal. Do the next test. 
   if pointsMed > hsMed then goto New_High_Score
   if pointsMed < hsMed then goto Skip_High_Score
   rem  ** Second byte equal. Do the next test. 
   if pointsLo > hsLo then goto New_High_Score
   if pointsLo < hsLo then goto Skip_High_Score
   rem  ** All bytes equal. Current score is the same as the high score.
   goto Skip_High_Score
New_High_Score
   rem  ** save new high score.
   hsHi = pointsHi : hsMed = pointsMed : hsLo = pointsLo
Skip_High_Score
  return

game_over
    playsfx sfx_bigboom
    beam_counter=0
    start_option=0
game_over_loop

    frame_counter=frame_counter+1
    if frame_counter>2 then frame_counter=0
    if frame_counter=2 then animate1=animate1+1 
    if animate1>3 then animate1=0 

    if joy0fire0 then debounce_fire=7
    if !joy0fire0 && debounce_fire=7 then debounce_fire=8
    if debounce_fire=8 then debounce_fire=0:player_flag=0:goto game_restart

    if beam_counter<>81 then beam_counter=beam_counter+1
    if beam_counter>80 then beam_counter=81

    drone_ypos=drone_ypos+1

    if switchreset then reboot

    restorescreen

    if player_flag=1 then plotsprite  drone_explode1  1  drone_xpos  drone_ypos  animate1 
    
    if drone_ypos>115 then player_flag=2:plotsprite  drone_explode1  1  200 0
    if player_flag=2 then     plotsprite text_gameover_top 0 24 40:    plotsprite text_gameover_bottom 0 24 48 
    gosub status_bar


    ; bug - need to check for high and low values on pointsHi

    if beam_counter<>81 then goto skip_text_draw


    ; L1 - Private                                   
    if pointsHi<=$01 && pointsMed<=$49 && pointsMed<=$99 then plotchars 'rank: private' 3 48 8             ; level_1
    ; L2   Specialist    Low:  5,000   High: 09,900
    if pointsHi<=$01 && pointsMed>=$50 && pointsMed<=$99 then plotchars 'rank: specialist' 3 43 8          ; level_2
    ; L3   Corporal      Low: 10,000   High: 19,900 
    if pointsHi>=$01 && pointsHi<$02 && pointsMed<=$99                   then plotchars 'rank: corporal' 3 47 8            ; level_3  
    ; L4   Sergeant      Low: 20,000   High: 29,900  
    if pointsHi>=$02 && pointsHi<$03 && pointsMed<=$99                   then plotchars 'rank: sergeant' 3 47 8            ; level_4 
    ; L5   Sergeant Major    Low: 30,000   High: 39,900  
    if pointsHi>=$03 && pointsHi<$04 && pointsMed<=$99                   then plotchars 'rank: sergeant major' 3 35 8      ; level_5  
    ; L6   Lieutenant    Low: 40,000   High  49,900  
    if pointsHi>=$04 && pointsHi<$05 && pointsMed<=$99                   then plotchars 'rank: lieutenant' 3 43 8          ; level_6 
    ; L7   Captain    Low: 50,000   High  59,900  
    if pointsHi>=$05 && pointsHi<$06 && pointsMed<=$99                   then  plotchars 'rank: captain' 3 48 8            ; level_7 
    ; L8   Major    Low: 60,000   High  69,900  
    if pointsHi>=$06 && pointsHi<$07 && pointsMed<=$99                   then plotchars 'rank: major' 3 53 8               ; level_8 
    ; L9   Lieutenant Colonel    Low: 70,000   High  79,900 
    if pointsHi>=$07 && pointsHi<$08 && pointsMed<=$99                   then plotchars 'rank: lieutenant colonel' 3 27 8  ; level_9  
    ; L10  Colonel    Low: 80,000   High  89,900 
    if pointsHi>=$08 && pointsHi<$09 && pointsMed<=$99                   then plotchars 'rank: colonel' 3 48 8             ; level_10 
    ; L11+ General     Low: 90,000+
    if pointsHi>=$09                                                     then plotchars 'rank: general' 3 48 8             ; level_11+
    plotchars 'press right fire to restart' 3  23  10
skip_text_draw

    drawscreen
    goto game_over_loop

level_up
    if player_flag=1 then return
    playsfx sfx_bigboom
    healthMed = $01 : healthLo = $00 ; recharge health on level up
    tank1_xpos=1.0      :  tank1_ypos=168
    tank2_xpos=36.0     :  tank2_ypos=136
    tank3_xpos=96.0     :  tank3_ypos=112
    cannon1_xpos=142   :  cannon1_ypos=96
    missile1_xpos=181.0 :  missile1_ypos=25
    missile2_xpos=189.0 :  missile2_ypos=50
    missile3_xpos=185.0 :  missile3_ypos=75
    laser_powerup_xpos=45:laser_powerup_ypos=10
    beam_counter=0
    temporary=40
    drone_xpos=70 : drone_ypos=18

    ; Recharge Laser
    if gamedifficulty=0 then laserLo=$99
    if gamedifficulty=1 then laserLo=$75
    if gamedifficulty=2 then laserLo=$50
    if gamedifficulty=3 then laserLo=$25

    ;animation_counter=animation_counter+1
    ;if animation_counter>3 then animation_counter=0:animate6=animate6+1
    ;if animate6>7 then animate6=0

level_up_loop

    frame_counter=frame_counter+1
    if frame_counter>2 then frame_counter=0
    if frame_counter=2 then animate1=animate1+1 
    if animate1>3 then animate1=0 

    ; Counter for recharge bar, and to pause before you can continue
    if beam_counter<81 then temporary=temporary+1:beam_counter=beam_counter+1
    if beam_counter>80 then beam_counter=81:temporary=200

    ; Everything goes off the screen   
    if man1_xpos<179 then man1_xpos=man1_xpos+2
    if man2_xpos<179 then man2_xpos=man2_xpos+2
    if man3_xpos<179 then man3_xpos=man3_xpos+2
    if tank1_xpos<179 then tank1_xpos=tank1_xpos+2
    if tank2_xpos<179 then tank2_xpos=tank2_xpos+2
    if tank3_xpos<179 then tank3_xpos=tank3_xpos+2

    if switchreset then reboot

    if beam_counter<81 then fire_debounce_1=99
    if joy0fire0 then fire_debounce_1=12
    if !joy0fire0 && fire_debounce_1=12 then fire_debounce_1=13
    if fire_debounce_1=13 then fire_debounce_1=0:beam_counter=0:gosub switch_screen bank2:return

    restorescreen

    ; Plot the Level Up graphic on screen
    plotsprite text_levelup_top 0 34 38
    plotsprite text_levelup_bottom 0 34 46
    if beam_counter<64 then gosub sprite_draw bank2 else gosub status_bar:plotsprite drone1 1 drone_xpos drone_ypos animate1 
  
    temporary=beam_counter+34

    ; Plot recharge progress bar
    plotsprite progress_bar_full 4 32 60 
    plotsprite progress_bar_line 4 temporary 60


    plotchars 'health / laser recharged' 3 29 9
    plotchars 'press right fire to continue' 3  21  10

    drawscreen
    goto level_up_loop

draw_shield
   shield_top_xpos=drone_xpos-4
   shield_top_ypos=drone_ypos-4
   shield_bottom_xpos=drone_xpos-4
   shield_bottom_ypos=drone_ypos+4
   ;┌───────────────────────────────────┬────────────────────────┬─────────┬──────────────┬──────────────┬─────────────────┬─────────────────────────────────────────┐       
   ;│ Code                              │   sprite               │ palette │      X       │      Y       │ animation frame │   Notes                                 │
   ;└───────────────────────────────────┴────────────────────────┴─────────┴──────────────┴──────────────┴─────────────────┴─────────────────────────────────────────┘
   plotsprite                              shield_top                 5      shield_top_xpos    shield_top_ypos
   plotsprite                              shield_bottom              5      shield_bottom_xpos shield_bottom_ypos
   return

draw_medical_truck
   ;┌───────────────────────────────────┬────────────────────────┬─────────┬──────────────┬──────────────┬─────────────────┬─────────────────────────────────────────┐       
   ;│ Code                              │   sprite               │ palette │      X       │      Y       │ animation frame │   Notes                                 │
   ;└───────────────────────────────────┴────────────────────────┴─────────┴──────────────┴──────────────┴─────────────────┴─────────────────────────────────────────┘
   if medtruck_flag=0 then plotsprite    medical_truck_1b            3      medical_truck_xpos    medical_truck_ypos    animate3
   if medtruck_flag=1 then plotsprite    medical_truck_1b_hit        3      medical_truck_xpos    medical_truck_ypos    animate3
   return

bomb1_fire
   ;┌───────────────────────────────────┬────────────────────────┬─────────┬──────────────┬──────────────┬─────────────────┬─────────────────────────────────────────┐       
   ;│ Code                              │   sprite               │ palette │      X       │      Y       │ animation frame │   Notes                                 │
   ;└───────────────────────────────────┴────────────────────────┴─────────┴──────────────┴──────────────┴─────────────────┴─────────────────────────────────────────┘
   plotsprite                              bomb_small_up              5      bomb1_xpos     bomb1_ypos
   return

cannon_fire
   ;┌───────────────────────────────────┬────────────────────────┬─────────┬──────────────┬──────────────┬─────────────────┬─────────────────────────────────────────┐       
   ;│ Code                              │   sprite               │ palette │      X       │      Y       │ animation frame │   Notes                                 │
   ;└───────────────────────────────────┴────────────────────────┴─────────┴──────────────┴──────────────┴─────────────────┴─────────────────────────────────────────┘
   plotsprite                              bomb_large_up              5      cannon_fire_xpos  cannon_fire_ypos
   return

sprite_draw

   ;┌───────────────────────────────────┬────────────────────────┬─────────┬──────────────┬──────────────┬─────────────────┬─────────────────────────────────────────┐       
   ;│ Code                              │   sprite               │ palette │      X       │      Y       │ animation frame │   Notes                                 │
   ;└───────────────────────────────────┴────────────────────────┴─────────┴──────────────┴──────────────┴─────────────────┴─────────────────────────────────────────┘
    if tank3_flag=0 then plotsprite        tank3                       1      tank3_xpos      tank3_ypos      animate3        ; Tank3 Sprite
    if tank3_flag=1 then plotsprite        implosion1                  2      tank3_xpos      tank3_ypos      animate3        ; Tank3 Explosion Animation
    if tank2_flag=0 then plotsprite        tank2                       5      tank2_xpos      tank2_ypos      animate4        ; Tank2 Sprite
    if tank2_flag=1 then plotsprite        implosion1                  2      tank2_xpos      tank2_ypos      animate4        ; Tank2 Explosion Animation
    if tank1_flag=0 then plotsprite        tank1                       6      tank1_xpos      tank1_ypos      animate5        ; Tank1 Sprite
    if tank1_flag=1 then plotsprite        implosion1                  2      tank1_xpos      tank1_ypos      animate5        ; Tank1 Explosion Animation
    plotsprite                             radar                       0      cannon1_xpos     cannon1_ypos     animate3        ; Missile Defense Sprite
    if gamedifficulty>0 then plotsprite    missile1                    5      missile1_xpos   missile1_ypos   animate1        ; Enemy Missile 1
    if gamedifficulty>0 then plotsprite    missile1                    3      missile2_xpos   missile2_ypos   animate1        ; Enemy Missile 2
    plotsprite                             missile1                    6      missile3_xpos   missile3_ypos   animate1        ; Enemy Missile 3
    if gamedifficulty>1 then plotsprite    radar                       1      cannon_xpos     cannon_ypos     animate3        ; Cannon
    if laserLo=$00 then plotsprite         laser_powerup               5      laser_powerup_xpos   laser_powerup_ypos         ; Laser Powerup 
    if man1_flag=0 then plotsprite         man8_run_anim1              4      man1_xpos       man1_ypos       animate6
    if man1_flag=1 then plotsprite         man8_explode1               4      man1_xpos       man1_ypos       animate6
    if man2_flag=0 then plotsprite         man8_run_anim1              4      man2_xpos       man2_ypos       animate6
    if man2_flag=1 then plotsprite         man8_explode1               4      man2_xpos       man2_ypos       animate6
    if man3_flag=0 then plotsprite         man8_run_anim1              4      man3_xpos       man3_ypos       animate6
    if man3_flag=1 then plotsprite         man8_explode1               4      man3_xpos       man3_ypos       animate6
    if joy0left && player_flag<>2 then plotsprite      drone1_left     1      drone_xpos      drone_ypos      animate1        :goto status_bar ; Drone
    if joy0right && player_flag<>2 then plotsprite     drone1_right    1      drone_xpos      drone_ypos      animate1        :goto status_bar ; Drone
    if player_flag<>2 then plotsprite      drone1                      1      drone_xpos      drone_ypos      animate1        ; Drone

status_bar

   ;┌───────────────────────────────────┬────────────────────────┬─────────┬──────────────┬──────────────┬─────────────────┬─────────────────────────────────────────┐       
   ;│ Code                              │   sprite               │ palette │      X       │      Y       │ animation frame │   Notes                                 │
   ;└───────────────────────────────────┴────────────────────────┴─────────┴──────────────┴──────────────┴─────────────────┴─────────────────────────────────────────┘
    plotsprite                             text_score                 0           0              176
    plotsprite                             text_level                 0           47             176  
    plotsprite                             text_laser                 0           78             176
    plotsprite                             text_bomb                  0           109            176
    plotsprite                             text_health                0           124            176

   ;┌──────────┬─────────────────────┬─────────┬───────┬──────────┬─────┬─────┬─────────────────────────┐       
   ;│ Code     │  score graphics     │ palette │ Value │ # Digits │  X  │  Y  │   Notes                 │
   ;└──────────┴─────────────────────┴─────────┴───────┴──────────┴─────┴─────┴─────────────────────────┘    
    plotvalue    scoredigits              3     scorea       6       22    22    ; Score  (23 Bottom Y)
    plotvalue    scoredigits              3     levelLo      2       69    22    ; Level  (23 Bottom Y)
    plotvalue    scoredigits              3     laserLo      2       100   22    ; Laser  (23 Bottom Y)
    plotvalue    scoredigits              3     smart_bomb   1       119   22    ; Laser  (23 Bottom Y)
    plotvalue    scoredigits              3     healthMed    1       149   22    ; Health  (23 Bottom Y)
    plotvalue    scoredigits              3     healthLo     2       153   22    ; Health  (23 Bottom Y)

  return

draw_laser

    if frame_counter=1 then return

    ;──═◙ Set Y Positions for the Laser
    laser_y_offset_1 = drone_ypos+8 ; Top of laser beam
    laser_y_offset_2 = drone_ypos+16    
    laser_y_offset_3 = drone_ypos+24
    laser_y_offset_4 = drone_ypos+32
    laser_y_offset_5 = drone_ypos+40
    laser_y_offset_6 = drone_ypos+48
    laser_y_offset_7 = drone_ypos+56
    laser_y_offset_8 = drone_ypos+64
    laser_y_offset_9 = drone_ypos+72
    laser_y_offset_10 = drone_ypos+80
    ;──═◙ Set X Position for the Laser
    laser_x_offset_1 = drone_xpos+5
    crosshair_x_offset_1 = laser_x_offset_1+1 ; Center crosshair under the laser

draw_laser_alt  
   ;┌───────────────────────────────────┬────────────────────────┬─────────┬──────────────────────┬─────────────────────┬─────────────────┬─────────────────────────────────────────┐       
   ;│ Code                              │   sprite               │ palette │          X           │         Y           │ animation frame │   Notes                                 │
   ;└───────────────────────────────────┴────────────────────────┴─────────┴──────────────────────┴─────────────────────┴─────────────────┴─────────────────────────────────────────┘
    plotsprite                              crosshair                 2       crosshair_x_offset_1  laser_y_offset_10
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_1
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_2
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_3
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_4
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_5
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_6
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_7
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_8
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_9
    
  return 

draw_defensebeam

    ;──═◙ Set Y Positions for the City Defense Beam
    defensebeam_y_offset_1 = cannon1_ypos-8
    defensebeam_y_offset_2 = cannon1_ypos-16
    defensebeam_y_offset_3 = cannon1_ypos-24
    defensebeam_y_offset_4 = cannon1_ypos-32
    defensebeam_y_offset_5 = cannon1_ypos-40
    defensebeam_y_offset_6 = cannon1_ypos-48
    defensebeam_y_offset_7 = cannon1_ypos-56
    defensebeam_y_offset_8 = cannon1_ypos-64
    defensebeam_y_offset_9 = cannon1_ypos-72
    defensebeam_x_offset_1 = cannon1_xpos+1
    
   ;┌───────────────────────────────────┬────────────────────────┬─────────┬─────────────────────────┬────────────────────────┬─────────────────┬─────────────────────────────────────────┐       
   ;│ Code                              │   sprite               │ palette │          X              │         Y              │ animation frame │   Notes                                 │
   ;└───────────────────────────────────┴────────────────────────┴─────────┴─────────────────────────┴────────────────────────┴─────────────────┴─────────────────────────────────────────┘
    plotsprite                              beam                     0      defensebeam_x_offset_1      defensebeam_y_offset_1
    plotsprite                              beam                     0      defensebeam_x_offset_1      defensebeam_y_offset_2
    plotsprite                              beam                     0      defensebeam_x_offset_1      defensebeam_y_offset_3
    plotsprite                              beam                     0      defensebeam_x_offset_1      defensebeam_y_offset_4 
    plotsprite                              beam                     0      defensebeam_x_offset_1      defensebeam_y_offset_5
    plotsprite                              beam                     0      defensebeam_x_offset_1      defensebeam_y_offset_6
    plotsprite                              beam                     0      defensebeam_x_offset_1      defensebeam_y_offset_7
    plotsprite                              beam                     0      defensebeam_x_offset_1      defensebeam_y_offset_8
    plotsprite                              beam                     0      defensebeam_x_offset_1      defensebeam_y_offset_9

  return

move_sprites_offscreen  

    sprite_move_counter=sprite_move_counter+1
    direction = 1

    restorescreen

    if tank1_xpos<190 then tank1_xpos=tank1_xpos+2
    if tank2_xpos<190 then tank2_xpos=tank2_xpos+2
    if tank3_xpos<190 then tank3_xpos=tank3_xpos+2
    if man1_xpos<190 then man1_xpos=man1_xpos+2
    if man2_xpos<190 then man2_xpos=man2_xpos+2
    if man3_xpos<190 then man3_xpos=man3_xpos+2
    if drone_xpos<190 then drone_xpos=drone_xpos+2
    if medical_truck_xpos<190 then medical_truck_xpos=medical_truck_xpos+2

    if drone_xpos>189 then drone_xpos=189
    if tank1_xpos>189 then tank1_xpos=189
    if tank2_xpos>189 then tank1_xpos=189
    if man1_xpos>189 then man1_xpos=189
    if man2_xpos>189 then man2_xpos=189
    if man3_xpos>189 then man3_xpos=189
    if medical_truck_xpos>189 then medical_truck_xpos=189

    missile1_xpos=200
    missile2_xpos=200
    missile3_xpos=200
    
    cannon1_xpos=170

    gosub sprite_draw bank2

    drawscreen

    return

    ;if sprite_move_counter>200 then sprite_move_counter=0:return

    ;goto move_sprites_offscreen


switch_screen  

    clearscreen

    ;──═◙ Set Palette Colors
    P0C1 = $F7 : P0C2 = $1C : P0C3 = $0F  ; City Defense Beam              
    P1C1 = $0F : P1C2 = $46 : P1C3 = $08  ; Drone: c1 rotors  c2 body  c3 middle
    P2C1 = $42 : P2C2 = $4A : P2C3 = $0C  ; Drone Laser  
    P3C1 = $38 : P3C2 = $36 : P3C3 = $32  ; Top Enemy Vehicle
    P4C1 = $08 : P4C2 = $0A : P4C3 = $0F  ; Top Line of Scrolling Background  |  C1:shadow  C2:bldg color  C3:window color
    P5C1 = $82 : P5C2 = $84 : P5C3 = $88  ; Middle Enemy Vehicle & Missile
    P6C1 = $42 : P6C2 = $44 : P6C3 = $46  ; Bottom Enemy Vehicle & Laser
    P7C1 = $02 : P7C2 = $04 : P7C3 = $06  ; Bottom three rows (City Colors) 

    ;──═◙ Set Initial Location of sprites
    ; <X POSITION>    |   <Y POSITION>
    drone_xpos=70     :  drone_ypos=22
    tank1_xpos=1      :  tank1_ypos=168
    tank2_xpos=36     :  tank2_ypos=136
    tank3_xpos=96     :  tank3_ypos=112
    cannon1_xpos=192   :  cannon1_ypos=96
    missile1_xpos=181 :  missile1_ypos=25
    missile2_xpos=189 :  missile2_ypos=50
    missile3_xpos=185 :  missile3_ypos=75
    laser_powerup_xpos=45:laser_powerup_ypos=10
    cannon_xpos=72     :  cannon_ypos=168
    cannon_fire_xpos=73:  cannon_fire_ypos=163
    man1_xpos=35      :  man1_ypos=168
    man2_xpos=65      :  man2_ypos=136
    man3_xpos=90      :  man3_ypos=112
    medical_truck_xpos = 0 : medical_truck_ypos=168

    ;──═◙ Set Flags
    tank1_flag=0
    tank2_flag=0
    tank3_flag=0
    man1_flag=0
    man2_flag=0
    man3_flag=0
    player_flag=0
    laser_fire_flag=0
    smart_bomb=3
    frame_counter2=0
    
    ;──═◙ Set Bottom scroll area (switch_screen Init)
    for x = 0 to 3
        offsetX = (x*64)
        plotsprite bottomlayer1 4 offsetX 96
        plotsprite bottomlayer2 7 offsetX 104
        plotsprite bottomlayer3 7 offsetX 120
        if x = 0 || x = 2 then plotsprite bottomlayer41 7 offsetX 144 else plotsprite bottomlayer42 7 offsetX 144
    next 

    ;──═◙ Copy the text zone RAM to the screen
    plotchars textZoneRAM 3 0 23 32 : plotchars textZoneRAMAdd 3 128 23 8
    textZoneIndex = 0 : gosub CopyTextZoneContentToRam

    ;──═◙ Top of Screen Graphic
    plotsprite top_bar_1 7 0 4
    plotsprite top_bar_3 7 32 4
    plotsprite top_bar_1 7 64 4
    plotsprite top_bar_2 7 96 4
    plotsprite top_bar_1 7 128 4


    ;──═◙ Save the Screen to restore in the main loop
    savescreen
    drawscreen
    return
  
   ;GameInit

Init

    clearscreen

    boss1_defeated_flag=0
    boss2_defeated_flag=0
    boss3_defeated_flag=0
    boss4_defeated_flag=0
    boss5_defeated_flag=0
    boss6_defeated_flag=0
    boss7_defeated_flag=0
    boss8_defeated_flag=0
    boss9_defeated_flag=0
    boss10_defeated_flag=0
    level_flag=0   
    transition_flag=0

    ;──═◙ Score Values
    pointsHi = $00 : pointsMed = $00 : pointsLo = $00
    levelHi = $00  : levelMed = $00  : levelLo = $01

    goto init_next

init_with_password

    clearscreen
init_next

    ;──═◙ Score Values
    healthHi = $00 : healthMed = $01 : healthLo = $00
    laserHi = $00  : laserMed = $00  

    ;──═◙ Set Flags
    tank1_flag=0
    tank2_flag=0
    tank3_flag=0
    man1_flag=0
    man2_flag=0
    man3_flag=0
    player_flag=0
    laser_fire_flag=0
    smart_bomb=3
    frame_counter2=0
    frame=0
    init_flag=0
     

    ;──═◙ Set Palette Colors
    P0C1 = $F7 : P0C2 = $1C : P0C3 = $0F  ; City Defense Beam              
    P1C1 = $0F : P1C2 = $46 : P1C3 = $08  ; Drone: c1 rotors  c2 body  c3 middle
    P2C1 = $42 : P2C2 = $4A : P2C3 = $0C  ; Drone Laser  
    P3C1 = $38 : P3C2 = $36 : P3C3 = $32  ; Top Enemy Vehicle
    P4C1 = $08 : P4C2 = $0A : P4C3 = $0F  ; Top Line of Scrolling Background  |  C1:shadow  C2:bldg color  C3:window color
    P5C1 = $82 : P5C2 = $84 : P5C3 = $88  ; Middle Enemy Vehicle & Missile
    P6C1 = $42 : P6C2 = $44 : P6C3 = $46  ; Bottom Enemy Vehicle & Laser
    P7C1 = $02 : P7C2 = $04 : P7C3 = $06  ; Bottom three rows (City Colors) 

    ;──═◙ Set Initial Location of sprites
    ; <X POSITION>    |   <Y POSITION>
    drone_xpos=70     :  drone_ypos=22
    tank1_xpos=1      :  tank1_ypos=168
    tank2_xpos=36     :  tank2_ypos=136
    tank3_xpos=96     :  tank3_ypos=112
    cannon1_xpos=192   :  cannon1_ypos=96
    missile1_xpos=181 :  missile1_ypos=25
    missile2_xpos=189 :  missile2_ypos=50
    missile3_xpos=185 :  missile3_ypos=75
    laser_powerup_xpos=45:laser_powerup_ypos=10
    cannon_xpos=72     :  cannon_ypos=168
    cannon_fire_xpos=73:  cannon_fire_ypos=163
    man1_xpos=35      :  man1_ypos=168
    man2_xpos=65      :  man2_ypos=136
    man3_xpos=90      :  man3_ypos=112
    medical_truck_xpos = 0 : medical_truck_ypos=168


    ;──═◙ Set Bottom scroll area (Init)
    for x = 0 to 3
        offsetX = (x*64)
        plotsprite bottomlayer1 4 offsetX 96
        plotsprite bottomlayer2 7 offsetX 104
        plotsprite bottomlayer3 7 offsetX 120
        if x = 0 || x = 2 then plotsprite bottomlayer41 7 offsetX 144 else plotsprite bottomlayer42 7 offsetX 144
    next 

    ;──═◙ Copy the text zone RAM to the screen
    plotchars textZoneRAM 3 0 23 32 : plotchars textZoneRAMAdd 3 128 23 8
    textZoneIndex = 0 : gosub CopyTextZoneContentToRam

    ;──═◙ Set Initial direction of scrolling
    direction = 0

    ;──═◙ Reset frame counters
    animate1=0

    ;──═◙ Set initial direction of drone
    joydir = 2

     if gamedifficulty=0 then laserLo=$99
     if gamedifficulty=1 then laserLo=$75
     if gamedifficulty=2 then laserLo=$50
     if gamedifficulty=3 then laserLo=$25

    ;──═◙ Top of Screen Graphic
    plotsprite top_bar_1 7 0 4
    plotsprite top_bar_3 7 32 4
    plotsprite top_bar_1 7 64 4
    plotsprite top_bar_2 7 96 4
    plotsprite top_bar_1 7 128 4

    ;──═◙ ]ve the Screen to restore in the main loop
    savescreen

    return
 
 bank 3

  ;──═◙ Import Graphics for the Title/Menu Screen
  incbanner gfx/ex2/drone_title10.png 160A 0 1 2 3
  incbanner gfx/ex2/drone_title_bar.png 160A 0 1 2 3
  incbanner gfx/ex2/drone_title_bar_text.png 160A 0 1 2 3

     ; ###################################### MENU SCREEN LOOP ######################################
menuscreen  

    P0C1 = $80 : P0C2 = $84 : P0C3 = $88  ; title/background   C1 - Sky  C2 - Middle Row  C3 - Back Row  |  Background - Front Row    
    P2C1 = $88 : P2C2 = $86 : P2C3 = $84  ; menu
    P3C1 = $98 : P3C2 = $96 : P3C3 = $94  ; menu
    P5C1 = $80 : P5C2 = $40 : P5C3 = $36  ; drone patrol title text  C1 - background  c2- letter background   c3-  letter color
    P6C1 = $48 : P6C2 = $46 : P6C3 = $44
    P7C1 = $28 : P7C2 = $26 : P7C3 = $24  ; menu

    BACKGRND=$00

    ;──═◙ Set Y Positions for theSet initial Menu Index and Position Variables
    menu_yposition=7

    ;──═◙ Set Y Positions for theSet Initial Menu Choices
    menu_option_skill = 2
    menu_option_lives = 3
    menu_option_level = 1

    ;──═◙ Set Y Positions for theSet Initial Menu Colors
    menu_selection_color1=7 ; First Menu Line Starts off a different color than the other three
    menu_selection_color2=2
    menu_selection_color3=2
    menu_selection_color4=2
     ;playsong titlesong 140
menuscreen_loop
    drawwait
    clearscreen  

    gosub checkhighscore bank2

    plotbanner drone_title_bar 0 0 0
    plotbanner drone_title_bar_text 5 0 8
    plotbanner drone_title_bar 0 0 24
    plotbanner drone_title_bar 0 0 32
    plotbanner drone_title_bar 0 0 40
    plotbanner drone_title_bar 0 0 48
    plotbanner drone_title_bar 0 0 56
    plotbanner drone_title_bar 0 0 64
    plotbanner drone_title_bar 0 0 72
    plotbanner drone_title_bar 0 0 80
    plotbanner drone_title10 0 0 88

    plotchars 'current score' 3  18  23
    plotchars 'high score' 6  94  23
    plotvalue scoredigits 3 scorea 6   32    22    ; Current Score  (23 Bottom Y)
    plotvalue scoredigits 6 scoree 6   102    22    ; High Score  (23 Bottom Y)

    ;──═◙ Debounce Left Joystick
    ;--------------------------
    ; If the fire button is being pressed or the joystick is being pressed in a direction, the vlaue is 5
    ; After the fire button or the joystick direction is released, the value is 6
    ;--------------------------
    ; We want to execute code when the value is 6 (after the button or stick has been released), rather than when it is pressed/pushed.
    ;--------------------------
    if joy0fire then debounce_fire=5
    if !joy0fire && debounce_fire=5 then debounce_fire=6
    if joy0right then debounce_right=5
    if !joy0right && debounce_right=5 then debounce_right=6
    if joy0left then debounce_left=5
    if !joy0left && debounce_left=5 then debounce_left=6
    if joy0up then debounce_up=5
    if !joy0up && debounce_up=5 then debounce_up=6
    if joy0down then debounce_down=5
    if !joy0down && debounce_down=5 then debounce_down=6  
    ;--------------------------

    ;──═◙ Change the color of the selected menu item
    ;--------------------------
    ; This changes the color of the menu item you're on, making it easier to keep track of which menu item you're currently selecting.  
    if menu_yposition=7 then menu_selection_color1=7:menu_selection_color2=2:menu_selection_color3=2 ; 1st Line Highlighted | Other lines alternate color
    if menu_yposition=8 then menu_selection_color1=2:menu_selection_color2=7:menu_selection_color3=2 ; 1st Line Highlighted | Other lines alternate color
    if menu_yposition=9 then menu_selection_color1=2:menu_selection_color2=2:menu_selection_color3=7 ; 2nd Line Highlighted | Other lines alternate color

    ;──═◙ Plot Menu Choices on screen
    ; The palette choice for each line is a variable based on the preceding section of code.
    ;--------------------------
    plotchars 'skill:'     menu_selection_color1  50  7        ; {5=Skill} Menu Selection is based on the Y value of where this is plotted
    plotchars 'enter password'     menu_selection_color2  50  8        ; {5=Skill} Menu Selection is based on the Y value of where this is plotted
    plotchars 'start game' menu_selection_color3  50  9        ; {8=Start} Menu Selection is based on the Y value of where this is plotted

    ;──═◙ Plot Rank   
    ;if pointsHi=$00 && pointsMed=$00 && pointsMed=$00    then plotchars 'rank: unranked' 2 47 2  
    ;gosub draw_ranks bank8

    ;──═◙ Move Menu Selection - Joystick Down [Choose Skill, Lives, or Level when pressing down]
    ; If you press the joystick down, it will move down the menu by one.  If you're already at hte bottom, it stays on the bottom line.
    ;--------------------------
    if debounce_down=6 && menu_yposition=7 then gosub menu_sound:debounce_down=0:menu_yposition=8         ;If you are on the second line of the menu and push down, move down to the third
    if debounce_down=6 && menu_yposition=8 then gosub menu_sound:debounce_down=0:menu_yposition=9         ;If you are on the third line of the menu and push down, move down to the fourth
    if debounce_down=6 && menu_yposition=9 then gosub menu_sound:debounce_down=0:menu_yposition=9         ;If you are on the fourth line of the menu and push down, stay on that line (you could also scroll back up to the top)

    ;──═◙ Move Menu Selection - Joystick Up [Choose Skill, Lives, or Level when pressing up]
    ; If you press the joystick up, it will move up the menu by one.  If you're already at the top, it stays on the top line.
    ;--------------------------
    if debounce_up=6 && menu_yposition=7 then gosub menu_sound:debounce_up=0:menu_yposition=7             ;If you are on the second line of the menu and push up, go up to the first
    if debounce_up=6 && menu_yposition=8 then gosub menu_sound:debounce_up=0:menu_yposition=7             ;If you are on the third line of the menu and push up, go up to the second
    if debounce_up=6 && menu_yposition=9 then gosub menu_sound:debounce_up=0:menu_yposition=8             ;If you are on the fourth line of the menu and push up, go up to the third

    ;──═◙ Move left/Right on a Menu Selection [Choose a specific option for each menu item by pushing left or right]
    ;  If you keep pressing right or left after you've gone through all of the available choices, it will continue to cycle through all of them starting over from the beginning.
    ;--------------------------
    ;Set Skill Level [First Menu Item] Pushing Right on Joystick
    if menu_yposition=7 && debounce_right=6 && menu_option_skill=1 then gosub menu_sound:menu_option_skill=2:debounce_right=0     ; YPos=5 {Skill} | Current Skill=1 => Set Skill to 2 and reset debounce
    if menu_yposition=7 && debounce_right=6 && menu_option_skill=2 then gosub menu_sound:menu_option_skill=3:debounce_right=0     ; YPos=5 {Skill} | Current Skill=2 => Set Skill to 3 and reset debounce
    if menu_yposition=7 && debounce_right=6 && menu_option_skill=3 then gosub menu_sound:menu_option_skill=4:debounce_right=0     ; YPos=5 {Skill} | Current Skill=3 => Set Skill to 4 and reset debounce
    if menu_yposition=7 && debounce_right=6 && menu_option_skill=4 then gosub menu_sound:menu_option_skill=1:debounce_right=0     ; YPos=5 {Skill} | JoyRight Pressed & Released | Current Skill=3 => Set Skill to 1 and reset debounce
    ;Set Skill Level [First Menu Item] Pushing Left on Joystick
    if menu_yposition=7 && debounce_left=6 && menu_option_skill=1 then gosub menu_sound:menu_option_skill=4:debounce_left=0       ; YPos=5 {Skill} | Current Skill=1 => Set Skill to 4 and reset debounce
    if menu_yposition=7 && debounce_left=6 && menu_option_skill=2 then gosub menu_sound:menu_option_skill=1:debounce_left=0       ; YPos=5 {Skill} | Current Skill=2 => Set Skill to 1 and reset debounce
    if menu_yposition=7 && debounce_left=6 && menu_option_skill=3 then gosub menu_sound:menu_option_skill=2:debounce_left=0       ; YPos=5 {Skill} | Current Skill=3 => Set Skill to 2 and reset debounce
    if menu_yposition=7 && debounce_left=6 && menu_option_skill=4 then gosub menu_sound:menu_option_skill=3:debounce_left=0       ; YPos=5 {Skill} | Current Skill=4 => Set Skill to 3 and reset debounce
    ;--------------------------

    ;──═◙ Plot Menu Choices based on the current value of the menu option   
    ;--------------------------
    ;Plot Skill Choice Text
    if menu_option_skill = 1 then gamedifficulty=0:plotchars 'easy' 2 74 7
    if menu_option_skill = 2 then gamedifficulty=1:plotchars 'standard' 2 74 7
    if menu_option_skill = 3 then gamedifficulty=2:plotchars 'advanced' 2 74 7
    if menu_option_skill = 4 then gamedifficulty=3:plotchars 'expert' 2 74 7

    ;──═◙ Start the game if you push the button while the Start Game Menu Option is selected
    ;--------------------------   
    if debounce_fire=6 && menu_yposition=9 then clearscreen:debounce_fire=0:beam_counter=0:playsfx sfx_longgongsilver:goto set_speed

    if debounce_fire=6 && menu_yposition=8 then debounce_fire=0:beam_counter=0:gosub menu_sound:goto password_screen bank16


    
    drawscreen
    goto menuscreen_loop

  data tiatrill
  $10,$18,$01 ; version, priority, frames per chunk
  $00,$0a ; note offset, Volume
  $0c,$0a
  $00,$0a
  $0c,$0a
  $00,$0a
  $0c,$0a
  $00,$08
  $0c,$08
  $00,$04
  $0c,$04
  $00,$00
end

 data tiashort
  $10,$00,$00 ; version, priority, frames per chunk
  $00,$06 ; note offset, Volume
  $00,$04 ; note offset, Volume
  $00,$00
end

 data tiaplain
  $10,$00,$00 ; version, priority, frames per chunk
  $00,$08 ; note offset, Volume
  $00,$08
  $00,$06
  $00,$04
  $00,$00
end

;Octave 0 – Electronic
;note is very out of tune:      . .  . .  . * .  . .  * .  .
;                               c c# d d# e f f# g g# a a# b
;Octave 1 – Somewhat Buzzy
;note is very out of tune:      . .  . .  . . .  . .  . .  .
;                               c c# d d# e f f# g g# a a# b
;Octave 2 – Buzzy
;note is very out of tune:      . .  . .  . . .  . .  . .  .
;                               c c# d d# e f f# g g# a a# b
;Octave 3 – Buzzy from c3 to d#3, Pure from e3 to b3
;note is very out of tune:      . .  . *  . . .  . .  . .  .
;                               c c# d d# e f f# g g# a a# b
;Octave 4 – Pure
;note is very out of tune:      . .  . .  . . .  * .  . .  .
;                               c c# d d# e f f# g g# a a# b
;Octave 5 – Pure
;note is very out of tune:      . .  . .  . . .  . .  . .  .
;                               c c# d d# e f f# g g# a a# b
;Octave 6 – Tuned Wind
;note is very out of tune:      . .  . .  . . .  . .  . .  .
;                               c c# d d# e f f# g g# a a# b
;Octave 11 – Drum Kit
;note drum pattern number:      0 1  2 3  4 5 6  7
;                               c c# d d# e f f# g
;
; 1=whole note, 2=half note, 4=quarter note, 8=eighth note
;
;      0=Bass/Kick, 1=Low Tom, 2=High Tom, 3=Snare, 
;      4=Closed Hat, 5=Open Hat, 6=Bass/Kick+ClosedHat, 
;      7=Snare+Closed Hat
 
  songdata titlesong
main1
  k=a3
  i=tiamedium
  verse1a

main2
  k=a3
  i=tiamedium
  verse1balt

verse1a
       ;  oh       christmas tree oh            christmas tree   how     lovely  are your       bra-nches
          c4       f8 f8 f4       g4            a8 a8 a8       r8 a4     g8 a8   b4   e4         g4 f4

       ;  oh       christmas tree oh            christmas tree   how     lovely  are your       bra-nches
          c4       f8 f8 f4       g4            a8 a8 a8       r8 a4     g8 a8   b4   e4         g4 f4

       ;  So       faithful green through       out the year     in      summer and   when     winters here
        > c4       c8 < a8 > d8 r8 c8           c8 < b8 b8     r8 b4     b8 g8 > c8 < r8 b8     b8 a8   a4

       ;  oh       christmas tree oh            christmas tree   how     lovely  are your       bra-nches
          c4       f8 f8 f4       g4            a8 a8 a8       r8 a4     g8 a8    b4   e4        g4 f4

verse1b
       ;    oh       christmas tree oh            christmas tree     how        lovely     are your      bra-nches
          > c4 <       a8 a8 a4     b4            > c8 c8 c8         r8 c4 <     b8 > c8 <  d4  > c4 <    b4 a4
       ;    oh       christmas tree oh            christmas tree     how        lovely     are your      bra-nches
          > c4 <       a8 a8 a4     b4            > c8 c8 c8         r8 c4 <     b8 > c8 <  d4  > c4 <    b4 a4

       ;  So         faithful green through        out the year     in        summer and   when     winters here
          r4         r8 r8 r8 r8    r8             r8 r8 r8         r8 g4     g8 e8  a8   r8 g8     g8 f8   f4

       ;  oh        christmas tree oh              christmas tree   how        lovely     are your       bra-nches
         > c4 <     a8 a8 a4       b4              > c8 c8 c8       r8 c4 <     b8 > c8 <  d4  > c4 <    b4 a4

verse1balt
       ;    oh       christmas tree oh            christmas tree     how        lovely     are your      bra-nches
          > c4 <       a8 a8 a4     r4            > c8 c8 c8         r8 r4 <     r8 > r8 <  r4  > r4 <    r4 r4
       ;    oh       christmas tree oh            christmas tree     how        lovely     are your      bra-nches
          > c4 <       a8 a8 a4     r4            > c8 c8 c8         r8 r4 <     r8 > r8 <  r4  > r4 <    r4 r4

       ;  So         faithful green through        out the year     in        summer and   when     winters here
          r4         r8 r8 r8 r8    r8             r8 r8 r8         r8 g4     g8 e8  a8   r8 g8     g8 f8   f4
       ;  oh        christmas tree oh              christmas tree   how        lovely     are your       bra-nches
         > c4 <     a8 a8 a4       r4              > c8 c8 c8       r8 c4 <     r8 > r8 <  r4  > r4 <    b4 a4
end

 data tiamedium
  $10,$03,$03 ; version, priority, frames per chunk
  $00,$08 ; note offset, Volume
  $00,$08
  $00,$06
  $00,$04
  $00,$00
end


 data tialong
  $10,$00,$05 ; version, priority, frames per chunk
  $00,$08 ; note offset, Volume
  $00,$08
  $00,$06
  $00,$04
  $00,$00
end

 data tiabass
  $10,$00,$02 ; version, priority, frames per chunk
  $00,$06 ; note offset, Volume
  $00,$04 ; note offset, Volume
  $00,$04 ; note offset, Volume
  $00,$00
end

set_speed

    drawwait
    clearscreen

    rem ** fade in and out...
    if frame<18 then fadevalue=fadevalue+1
    if frame>127 && frame<143 then fadevalue=fadevalue-1

    rem ** set the global fade value...
    setfade fadevalue

    rem ** fetch the fade values appropriate for our colors.
    rem ** note the "black" argument, which zeroes the hue nibble
    rem ** when the luminance nibble is zero.

    P0C1=getfade($36,black)
    P0C2=getfade($84,black)
    P0C3=getfade($D2,black)
    
    frame=frame+1

    plotsprite text_getready_top 0 24 40:    plotsprite text_getready_bottom 0 24 48 ; plotchars 'get ready!' 2 58 8

    if start_option=0 then goto skip_accept_msg
    plotchars 'password accepted' 2 42 22
skip_accept_msg

    if menu_option_skill=1 then goto speed_1 ; Easy 
    if menu_option_skill=2 then goto speed_2 ; Standard 
    if menu_option_skill=3 then goto speed_3 ; Advanced
    if menu_option_skill=4 then goto speed_4 ; Expert

speed_1                ;Easy Mode
    tank1_speed=0.1
    tank2_speed=0.2
    tank3_speed=0.3
    cannon1_speed=0.1
    cannon2_speed=0.2
    man1_speed=0.1
    man2_speed=0.2
    man3_speed=0.3
    missile1_speed=0.1
    missile2_speed=0.2
    missile3_speed=0.3
    drone_speed=0.0
    goto speed_end
speed_2                ;Standard Mode
    tank1_speed=0.2
    tank2_speed=0.3
    tank3_speed=0.4
    cannon1_speed=0.2
    cannon2_speed=0.3
    man1_speed=0.3
    man2_speed=0.4
    man3_speed=0.5
    missile1_speed=0.3
    missile2_speed=0.4
    missile3_speed=0.5
    drone_speed=0.6
    goto speed_end
speed_3                ;Advanced Mode
    tank1_speed=0.5
    tank2_speed=0.6
    tank3_speed=0.7
    cannon1_speed=0.3
    cannon2_speed=0.4
    man1_speed=0.5
    man2_speed=0.6
    man3_speed=0.7
    missile1_speed=0.6
    missile2_speed=0.7
    missile3_speed=0.8
    drone_speed=1.0
    goto speed_end
speed_4                ;Expert Mode
    tank1_speed=1.2
    tank2_speed=1.4
    tank3_speed=1.6
    cannon1_speed=0.4
    cannon2_speed=0.5
    man1_speed=0.7
    man2_speed=0.8
    man3_speed=0.9
    missile1_speed=1.0
    missile2_speed=1.2
    missile3_speed=1.3
    drone_speed=1.3
speed_end
    drawscreen
   beam_counter=beam_counter+1
   if beam_counter>127 then clearscreen:drawscreen:P0C1 = $F7 : P0C2 = $1C : P0C3 = $0F:return
    goto set_speed

menu_sound
   playsfx sfx_dropmedium
   return

 data sfx_dropmedium
    $10,$10,$00 ; version, priority, frames per chunk
    $00,$04,$00 ; first chunk of freq,channel,volume
    $03,$06,$0c
    $0d,$0c,$0f
    $1b,$04,$04
    $06,$0c,$00
    $00,$06,$00
    $07,$06,$00
    $10,$0c,$00
    $0d,$0c,$00
    $10,$0c,$00
    $03,$06,$00
    $10,$0c,$00
    $1b,$04,$00
    $10,$0c,$00
    $10,$0c,$00
    $03,$06,$00
    $00,$00,$00
end

 data sfx_longgongsilver
    $10,$10,$00 ; version, priority, frames per chunk
    $1b,$0c,$0b ; first chunk of freq,channel,volume
    $06,$0c,$07
    $1b,$0c,$0f
    $0a,$06,$0d
    $1b,$0c,$0b
    $0a,$06,$0f
    $0a,$06,$0c
    $12,$0c,$0a
    $1b,$0c,$0f
    $12,$0c,$0b
    $1b,$0c,$0f
    $1b,$0c,$0f
    $12,$0c,$0c
    $1b,$0c,$0f
    $0a,$06,$0d
    $12,$0c,$07
    $0a,$06,$0f
    $1b,$0c,$0f
    $0a,$06,$07
    $1b,$0c,$0f
    $0a,$06,$06
    $1b,$0c,$0f
    $0a,$06,$0f
    $06,$0c,$07
    $0a,$06,$0e
    $1b,$0c,$0f
    $12,$0c,$08
    $1b,$0c,$0f
    $1b,$0c,$0c
    $1b,$0c,$0f
    $1b,$0c,$0e
    $12,$0c,$08
    $0a,$06,$0c
    $1b,$0c,$0d
    $12,$0c,$08
    $1b,$0c,$0f
    $1b,$0c,$0f
    $1b,$0c,$0a
    $1b,$0c,$0f
    $0a,$06,$0a
    $0a,$06,$08
    $0a,$06,$0f
    $1b,$0c,$09
    $0a,$06,$0c
    $1b,$0c,$0f
    $06,$0c,$05
    $1b,$0c,$0f
    $0a,$06,$0b
    $12,$0c,$06
    $0a,$06,$0c
    $1b,$0c,$08
    $12,$0c,$0a
    $1b,$0c,$0d
    $1b,$0c,$06
    $1b,$0c,$0c
    $1b,$0c,$0b
    $1b,$0c,$04
    $0a,$06,$06
    $0a,$06,$07
    $0a,$06,$04
    $1b,$0c,$09
    $1b,$0c,$07
    $1b,$0c,$06
    $1b,$0c,$07
    $12,$0c,$07
    $1b,$0c,$06
    $12,$0c,$07
    $12,$0c,$05
    $0a,$06,$05
    $1b,$0c,$06
    $0a,$0c,$02
    $1b,$0c,$08
    $0a,$06,$03
    $1b,$0c,$04
    $0a,$06,$06
    $12,$0c,$02
    $1b,$0c,$02
    $1b,$0c,$05
    $12,$0c,$02
    $1b,$0c,$05
    $0a,$06,$04
    $1b,$0c,$02
    $1b,$0c,$04
    $1b,$0c,$01
    $12,$0c,$03
    $0a,$06,$04
    $1b,$0c,$02
    $1b,$0c,$01
    $1b,$0c,$04
    $0a,$06,$02
    $1b,$0c,$02
    $0a,$06,$02
    $00,$00,$00
end

 ; ##################################################################################################################################################################3

 bank 4

    ;incgraphic gfx/ex2/font4.png 160A 0 1 2 3
    ;incgraphic gfx/ex2/bottomlayer11.png 160A 1 0 2 3
    ;incgraphic gfx/ex2/bottomlayer12.png 160A 1 0 2 3
    ;incgraphic gfx/ex2/bottomlayer13.png 160A 1 0 2 3
    ;incgraphic gfx/ex2/bottomlayer14.png 160A 1 0 2 3
    ;incgraphic gfx/ex2/bottomlayer15.png 160A 1 0 2 3
    ;incgraphic gfx/ex2/bomb_large_up.png 160A 1 0 2 3
    ;incgraphic gfx/ex2/long_laser.png 160A 1 0 2 3

    incgraphic gfx/ex2/boss1_explode1.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss1_explode2.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss1_explode3.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss1_explode4.png 160A 1 0 2 3

    incgraphic gfx/ex2/boss1a.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss1b.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss1c.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss1d.png 160A 1 0 2 3

    newblock

    incgraphic gfx/ex2/flame1a.png 160A 1 0 2 3
    incgraphic gfx/ex2/flame1b.png 160A 1 0 2 3
    incgraphic gfx/ex2/flame1c.png 160A 1 0 2 3
    incgraphic gfx/ex2/flame1d.png 160A 1 0 2 3

    incgraphic gfx/ex2/rocket.png 160A 1 0 2 3

    incgraphic gfx/ex2/short_laser.png 160A 1 0 2 3
    ;incgraphic gfx/ex2/long_laser2.png 160A 1 0 2 3
    ;incgraphic gfx/ex2/long_laser3.png 160A 1 0 2 3
    ;incgraphic gfx/ex2/long_laser4.png 160A 1 0 2 3

    incgraphic gfx/ex2/text_boss_predator.png 160A 1 0 2 3
    incgraphic gfx/ex2/text_boss_drone.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss_status_bar_middle.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss_hp.png 160A 1 0 2 3


boss1_battle

    ;──═◙ Start───────────────────────────────────────────────────────────────────────────────────

    ;──═◙ Set Palette Colors
     P0C1 = $0A : P0C2 = $34 : P0C3 = $42  ; Flame             
     P1C1 = $0F : P1C2 = $46 : P1C3 = $08  ; Drone: c1 rotors  c2 body  c3 middle
     P2C1 = $48 : P2C2 = $4A : P2C3 = $40  ; Big Laser
     P3C1 = $08 : P3C2 = $04 : P3C3 = $02  ; Rockets
     ;P4C1 = $98 : P4C2 = $0A : P4C3 = $90  ; Status bar
     P5C1 = $92 : P5C2 = $84 : P5C3 = $98  ; Boss   c1 base ship color c2 mid-ship highlights  c3  Edge Outline
     P6C1 = $98 : P6C2 = $0A : P6C3 = $90  ; Status bar
    playsfx sfx_museboom
    plotsprite text_boss_predator 6 0 176
    plotsprite boss_status_bar_middle 4 58 176
    plotsprite boss_hp 5 52 176
    plotsprite text_boss_drone 0 110 176
    plotsprite boss_hp 0 151 176
    drawscreen
    savescreen

    if levelLo=$02 then P4C1=$08:P4C2=$0A:P4C3=$06
    if levelLo=$03 then P4C1=$22:P4C2=$26:P4C3=$08
    if levelLo=$04 then P4C1=$32:P4C2=$36:P4C3=$0A
    if levelLo=$05 then P4C1=$62:P4C2=$66:P4C3=$08
    if levelLo=$06 then P4C1=$52:P4C2=$56:P4C3=$0A
    if levelLo=$07 then P4C1=$42:P4C2=$46:P4C3=$08
    if levelLo=$08 then P4C1=$72:P4C2=$76:P4C3=$0A
    if levelLo=$09 then P4C1=$82:P4C2=$86:P4C3=$08
    if levelLo=$10 then P4C1=$A2:P4C2=$A6:P4C3=$0A
    if levelLo>$10 then P4C1=$C2:P4C2=$C6:P4C3=$0A

    ;──═◙ Set Drone Health for this Boss Battle
    healthHi = $00 : healthMed = $01 : healthLo = $00

    ;──═◙ Set Boss Health for this battle
    bossHi = $00 : bossMed = $03 : bossLo = $00

    ;──═◙ Set Initial values for Boss Frame Counters
    boss_move_counter=0 :  boss_counter = 0

    ;──═◙ Set Initial Location for Boss
    boss1a_xpos = 200.0 : boss1a_ypos = 132.1
    boss1b_xpos = 200.0 : boss1b_ypos = 140.1
    boss1c_xpos = 200.0 : boss1c_ypos = 148.1
    boss1d_xpos = 200.0 : boss1d_ypos = 156.1

    drone_xpos=0:drone_ypos=22

    boss_vertical_flag=0
    boss_init_counter = 0

    direction = 0

    scorea=scorea+100

    boss_color=5

boss1_battle_transition

    ;──═◙ Transition───────────────────────────────────────────────────────────────────────────────────
    BACKGRND=$00

    if drone_xpos<70 then drone_xpos=drone_xpos+1

    ;──═◙ Increment frame and animation counters
    frame_counter=frame_counter+1
    if frame_counter>2 then frame_counter=0
    if frame_counter=2 then animate1=animate1+1
    if animate1>3 then animate1=0 

    ;──═◙ Move boss in from the right side of the screen
    boss1a_xpos=boss1a_xpos-0.8:boss1b_xpos=boss1b_xpos-0.8:boss1c_xpos=boss1c_xpos-0.8:boss1d_xpos=boss1d_xpos-0.8
    rocket1_xpos=rocket1_xpos-0.8:rocket2_xpos=rocket2_xpos-0.8:rocket3_xpos=rocket3_xpos-0.8:rocket4_xpos=rocket4_xpos-0.8

    restorescreen

    ;plotvalue    scoredigits      6     scoref       6       36    22    ; Boss Health   ;  36 22 (for 6 digits)
    ;plotvalue    scoredigits      6     scored       6       137   22    ; Drone Health  ; 137 22 (for 6 digits)

    plotvalue    scoredigits      6     bossMed        2       36    22    ; Boss Health   ;  36 22 (for 6 digits)
    plotvalue    scoredigits      6     bossLo         2       44    22    ; Boss Health   ;  36 22 (for 6 digits)
    plotvalue    scoredigits      2     healthMed      2       135   22    ; Drone Health  ; 137 22 (for 6 digits)
    plotvalue    scoredigits      2     healthLo       2       143   22    ; Drone Health  ; 137 22 (for 6 digits)

    ;plotsprite text_boss_predator 4 0 176
    ;plotsprite text_boss_drone 4 084 176

    plotsprite boss1a boss_color boss1a_xpos boss1a_ypos
    plotsprite boss1b boss_color boss1b_xpos boss1b_ypos
    plotsprite boss1c boss_color boss1c_xpos boss1c_ypos
    plotsprite boss1d boss_color boss1d_xpos boss1d_ypos
    plotsprite drone1 1 drone_xpos drone_ypos animate1 
 
    drawscreen

    if boss1a_xpos>20 then goto boss1_battle_transition

boss1_battle_init
    
    ;──═◙ Init───────────────────────────────────────────────────────────────────────────────────
    ;──═◙ Set Initial Location for Boss
    boss1a_xpos = 20.0 : boss1a_ypos = 132.1
    boss1b_xpos = 20.0 : boss1b_ypos = 140.1
    boss1c_xpos = 20.0 : boss1c_ypos = 148.1
    boss1d_xpos = 20.0 : boss1d_ypos = 156.1

    ;──═◙ Set Initial Location for Boss Rocket Flames
    flame4_xpos = 25.0 : flame4_ypos = 164.0  ; x+7
    flame5_xpos = 44.0 : flame5_ypos = 164.0  ; x+28
    flame6_xpos = 53.0 : flame6_ypos = 164.0  ; x+54
    flame7_xpos = 72.0 : flame7_ypos = 164.0  ; x+54

    ;──═◙ Set Boss Movement Flags
    boss_move_flag1=0  :  boss_move_flag2=0  :  boss_move_flag3=0   :  boss_move_flag4=0 

    ;──═◙ Set Initial Location for Boss Rockets
    rocket1_xpos = 42.0 : rocket1_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket2_xpos = 54.0 : rocket2_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket3_xpos = 77.0 : rocket3_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket4_xpos = 89.0 : rocket4_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos

    fire_debounce_1=0
    boss_vertical_flag=1


    temp_laser_xpos=boss1a_xpos+32
    temp_laser_ypos=boss1a_ypos

    drawscreen

boss1_battle_loop

    ;──═◙ Main Loop───────────────────────────────────────────────────────────────────────────────
    boss_counter=boss_counter+1
    if boss_counter>254 then boss_counter=0
    if boss_init_counter<30 then boss_init_counter=boss_init_counter+1
    if boss_init_counter=30 then boss_init_counter=30
    if boss_init_counter<30 then rocket1_xpos_save=boss1a_xpos+12 : rocket2_xpos_save=boss1a_xpos+34 : rocket3_xpos_save=boss1a_xpos+57 : rocket4_xpos_save=boss1a_xpos+69
    
    BACKGRND=$00

    ;──═◙ Increment frame and animation counters
    frame_counter=frame_counter+1
    if frame_counter>2 then frame_counter=0
    if frame_counter=2 then animate1=animate1+1
    if animate1>3 then animate1=0 
    animate2=animate2+1
    if animate2>2 then animate2=0

    ;──═◙ DRONE DEFEATED: Check for Game Over if drone health reaches zero
    if healthLo=$00 && healthMed=$01 then goto skiphealthcheck_boss1
    if healthHi=$99 && healthMed=$99 then healthLo=$00:healthMed=$00:player_flag=1:gosub boss1_restore_color:return     ; if a hit drops you below zero to 999,9xx health, detect it and die
    if healthLo<$01 || healthMed>$01 then healthLo=$00:healthMed=$00:player_flag=1:gosub boss1_restore_color:return     ; if health falls to zero, you are dead 
skiphealthcheck_boss1

    ;──═◙ Move Boss Left and Right
    if boss_counter>100 && boss_counter<180 then goto skip_boss_move1
    if boss1a_xpos>96 then boss_move_counter=1
    if boss1a_xpos<2 then boss_move_counter=0
    if boss_move_counter=0 then gosub boss_move_right
    if boss_move_counter=1 then gosub boss_move_left
skip_boss_move1

    if boss1a_ypos>134 then boss_vertical_flag=1    ; boss too far down, set vertical flag to move up
    if boss1a_ypos<100 then boss_vertical_flag=2    ; boss too far up, set vertical flag to move down

boss_up_only
    if boss_counter>80 && boss_counter<160 && boss_vertical_flag=1 then gosub boss_move_up

boss_down_only
    if boss_counter>160 && boss_counter<240 && boss_vertical_flag=2 then gosub boss_move_down

    if rocket1_ypos=136 then gosub sfx_bosslaser

    ;──═◙  Boss Fire cannons 
    if rocket1_ypos>190 && rocket1_ypos<200 then rocket1_ypos=130.0:rocket1_xpos_save=rocket1_xpos:rocket2_xpos_save=rocket2_xpos:rocket3_xpos_save=rocket3_xpos:rocket4_xpos_save=rocket4_xpos:gosub sfx_bosslaser
    rocket1_ypos=rocket1_ypos-1.4
    if rocket1_ypos>190 && rocket1_ypos<200 then rocket2_ypos=130.0:gosub sfx_bosslaser
    rocket2_ypos=rocket2_ypos-1.4
    if rocket1_ypos>190 && rocket1_ypos<200 then rocket3_ypos=130.0:gosub sfx_bosslaser
    rocket3_ypos=rocket3_ypos-1.4
    if rocket1_ypos>190 && rocket1_ypos<200 then rocket4_ypos=130.0:gosub sfx_bosslaser
    rocket4_ypos=rocket4_ypos-1.4

    ;──═◙ Check for Game Reset
    if switchreset then reboot

    ;──═◙ Debounce Fire Buttons
    if joy0fire1 then fire_debounce_1=1  ; Left Button
    if !joy0fire1 && fire_debounce_1=1 then fire_debounce_1=2
 
    ;──═◙ Move the drone on the screen
    if joy0right then drone_xpos=drone_xpos+1+drone_speed
    if joy0left then drone_xpos=drone_xpos-1-drone_speed
    if joy0up then drone_ypos=drone_ypos-1-drone_speed
    if joy0down then drone_ypos=drone_ypos+1+drone_speed

    ;──═◙ Keep the drone on the screen
    if drone_ypos>90 then drone_ypos=90
    if drone_ypos<8 then drone_ypos=8
    if drone_xpos<5 then drone_xpos=5
    if drone_xpos>140 then drone_xpos=140

    if laser_counter>15 then laser_fire_flag=1 
    if fire_debounce_1=1 then laser_counter=laser_counter+1 else laser_fire_flag=0:laser_counter=0

    if animate1=0 then boss_color=5 ; reset boss color back to default after hit


    ;──═◙ Detect Super Laser Hit───────────────────────────────────────────────────────────────────
    if boss_counter<90 then goto skip_super_laser_collision
    asm
    QBOXCOLLISIONCHECK temp_laser_xpos,temp_laser_ypos,8,8,drone_xpos,drone_ypos,16,8
end
    if CARRY then gosub boss1_shake_drone:gosub sfx_boss1_missiles:dec scored=scored-1
skip_super_laser_collision
    ;──────────────────────────────────────────────────────────────────────────────────────────────

    ;──═◙ Detect Boss Hit──────────────────────────────────────────────────────────────────────────
    if crosshair_x_offset_1=200 then goto skip_boss1_coll 
    asm
    QBOXCOLLISIONCHECK boss1b_xpos,boss1b_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1:boss_color=animate1: playsfx sfx_boss_hit
    asm
    QBOXCOLLISIONCHECK boss1c_xpos,boss1c_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1:boss_color=animate1: playsfx sfx_boss_hit
    asm
    QBOXCOLLISIONCHECK boss1d_xpos,boss1d_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1:boss_color=animate1: playsfx sfx_boss_hit
skip_boss1_coll
    ;──────────────────────────────────────────────────────────────────────────────────────────────

    ;──═◙ Detect Drone Hit─────────────────────────────────────────────────────────────────────────
    asm
    QBOXCOLLISIONCHECK rocket1_xpos,rocket1_ypos,10,10,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_boss1_missiles:gosub boss1_shake_drone
    asm
    QBOXCOLLISIONCHECK rocket2_xpos,rocket2_ypos,10,10,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_boss1_missiles:gosub boss1_shake_drone
    asm
    QBOXCOLLISIONCHECK rocket3_xpos,rocket3_ypos,10,10,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_boss1_missiles:gosub boss1_shake_drone
    asm
    QBOXCOLLISIONCHECK rocket4_xpos,rocket4_ypos,10,10,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_boss1_missiles:gosub boss1_shake_drone
    ;──────────────────────────────────────────────────────────────────────────────────────────────


    ;──═◙ BOSS DEFEATED: this sets the defeated flag for Boss 1, resets health to 100, takes you back to the game
    if bossLo=$00 && bossMed>$00 then goto skipbosscheck_boss1
    if bossHi=$99 && bossMed=$99 then boss_counter=0:frame_counter=0:animate1=0:levelLo=$02:goto boss1_transition_return  ; if a hit drops boss below zero to 999,9xx health, detect it - just a failsafe check
    if bossMed<$01 && bossLo<$02 then boss_counter=0:frame_counter=0:animate1=0:levelLo=$02:goto boss1_transition_return  
skipbosscheck_boss1

    ;──═◙ Sets position of Super Laser
    if temp_laser_ypos>50 then temp_laser_ypos=temp_laser_ypos-10.2 
    if temp_laser_ypos<=51 then temp_laser_ypos=boss1a_ypos

    ;──═◙ Sets position of rocket flames underneath the four rockets shot by the boss
    rocketflame1_ypos=rocket1_ypos+8
    rocketflame2_ypos=rocket2_ypos+8
    rocketflame3_ypos=rocket3_ypos+8
    rocketflame4_ypos=rocket4_ypos+8

    ;──═◙ Scroll zone [Unused]
    ;if transition_flag=1 then direction=1:speed=speed+1:goto transition_skip_boss1
    ; If you're not moving the joystick, don't scroll.  Still scrolls in last direction when you move up or down.
    ;if !joy0any then goto skip1
    ;if joy0up && !joy0left && !joy0left && frame_counter=1 then goto skip1_boss1
    ;if joy0down && !joy0left && !joy0left && frame_counter=1 then goto skip1_boss1
transition_skip_boss1
    ;for index = 0 to 9
    ;speed = scrollZoneSpeed_boss1[index] : if direction then speed = (speed^$ff)+1
    ;offsetY = 12+index
    ;temp1 = ShiftZone(3,offsetY,speed)
    ;next
skip1_boss1

    ;──═◙ Set Scrolling text message
    if (framecounter&7) > 0 then goto mainLoopSkipUpdateText_boss1
    ; Increment Text Zone
    textZoneIndex = textZoneIndex+1 : gosub CopyTextZoneContentToRam_boss1
    ; When the text rotates change the direction of the scrolling
    if textZoneIndex = 0 then direction = direction+1 : if direction > 1 then direction = 0
mainLoopSkipUpdateText_boss1

   restorescreen

    if boss_counter<90 then goto skip_super_laser

    ;──═◙ Set Super Laser X Position
    temp_laser_xpos=boss1b_xpos+30.0 

    plotsprite short_laser 2 temp_laser_xpos temp_laser_ypos 
skip_super_laser    

    if joy0left then plotsprite      drone1_left     1      drone_xpos      drone_ypos      animate1        : goto skip_next2
    if joy0right then plotsprite     drone1_right    1      drone_xpos      drone_ypos      animate1        : goto skip_next2
    plotsprite      drone1                      1      drone_xpos      drone_ypos      animate1        ; Drone
skip_next2

    plotsprite boss1a boss_color boss1a_xpos boss1a_ypos
    plotsprite boss1b boss_color boss1b_xpos boss1b_ypos
    plotsprite boss1c boss_color boss1c_xpos boss1c_ypos
    plotsprite boss1d boss_color boss1d_xpos boss1d_ypos

    ;──═◙ Plot the laser when you press the fire button
    ;if joy0left || joy0right then goto skiplaserfire_boss1  ; You can only fire when you're not moving
    ;if joy0up || joy0down then goto skiplaserfire_boss1     ; ...
    if laser_fire_flag=1 then goto skiplaserfire_boss1
    if drone_ypos<22 then goto skiplaserfire_boss1 ; If you are too high up you can't fire
    if fire_debounce_1=1 && animate1=2 then gosub sfx_pulsecannon bank2:gosub draw_laser_bank4
    if fire_debounce_1<>1 then crosshair_x_offset_1=200
skiplaserfire_boss1

    plotvalue    scoredigits      6     bossMed        2       36    22    ; Boss Health   ;  36 22 (for 6 digits)
    plotvalue    scoredigits      6     bossLo         2       44    22    ; Boss Health   ;  36 22 (for 6 digits)
    plotvalue    scoredigits      2     healthMed      2       135   22    ; Drone Health  ; 137 22 (for 6 digits)
    plotvalue    scoredigits      2     healthLo       2       143   22    ; Drone Health  ; 137 22 (for 6 digits)

    plotsprite flame1a 0 rocket1_xpos_save rocketflame1_ypos animate1
    plotsprite flame1a 0 rocket2_xpos_save rocketflame2_ypos animate1
    plotsprite flame1a 0 rocket3_xpos_save rocketflame3_ypos animate1
    plotsprite flame1a 0 rocket4_xpos_save rocketflame4_ypos animate1 

    plotsprite rocket 3 rocket1_xpos_save rocket1_ypos
    plotsprite rocket 3 rocket2_xpos_save rocket2_ypos
    plotsprite rocket 3 rocket3_xpos_save rocket3_ypos
    plotsprite rocket 3 rocket4_xpos_save rocket4_ypos

    plotsprite flame1a 1 flame4_xpos flame4_ypos animate1
    plotsprite flame1a 1 flame5_xpos flame5_ypos animate1
    plotsprite flame1a 1 flame6_xpos flame6_ypos animate1
    plotsprite flame1a 1 flame7_xpos flame7_ypos animate1

   drawscreen
   
  goto boss1_battle_loop

CopyTextZoneContentToRam_boss1
    asm
    SET_POINTER pointer,textZoneContent_boss1
end

    temp1 = IncrementPointerBy_boss1(textZoneIndex)
    for offsetX = 0 to 39
    textZoneRAM[offsetX] = pointer[[offsetX]]
    next

    ;──═◙ Scrolling Speed
    data scrollZoneSpeed_boss1
    1
    2,2
    3,3,3
    4,4,4,4
end

    asm
IncrementPointerBy_boss1
    sta temp2
    lda pointer
    clc
    adc temp2
    sta pointer
    bcc exitIncrementPointerBy_boss1
    inc pointerHi
exitIncrementPointerBy_boss1
    rts
end
 ;──═◙ On-Screen Text Data
    alphadata textZoneContent_boss1 font4
    '                                        '
    'enemy forces have unleashed the predator!                                                                  '
    'avoid the super laser commander!                                                                           '
    '                                        '
end
  
boss_move_up

    boss1a_ypos=boss1a_ypos-0.6:boss1b_ypos=boss1b_ypos-0.6:boss1c_ypos=boss1c_ypos-0.6:boss1d_ypos=boss1d_ypos-0.6
    rocket1_ypos=rocket1_ypos-0.6:rocket2_ypos=rocket1_ypos-0.6:rocket3_ypos=rocket1_ypos-0.6:rocket4_ypos=rocket1_ypos-0.6
    flame4_ypos=flame4_ypos-0.6:flame5_ypos=flame5_ypos-0.6:flame6_ypos=flame6_ypos-0.6:flame7_ypos=flame7_ypos-0.6

  return

boss_move_down

    boss1a_ypos=boss1a_ypos+0.6:boss1b_ypos=boss1b_ypos+0.6:boss1c_ypos=boss1c_ypos+0.6:boss1d_ypos=boss1d_ypos+0.6
    rocket1_ypos=rocket1_ypos+0.6:rocket2_ypos=rocket1_ypos+0.6:rocket3_ypos=rocket1_ypos+0.6:rocket4_ypos=rocket1_ypos+0.6
    flame4_ypos=flame4_ypos+0.6:flame5_ypos=flame5_ypos+0.6:flame6_ypos=flame6_ypos+0.6:flame7_ypos=flame7_ypos+0.6

  return

boss_move_right

    boss1a_xpos=boss1a_xpos+1.6:boss1b_xpos=boss1b_xpos+1.6:boss1c_xpos=boss1c_xpos+1.6:boss1d_xpos=boss1d_xpos+1.6
    rocket1_xpos=rocket1_xpos+0.8:rocket2_xpos=rocket2_xpos+0.8:rocket3_xpos=rocket3_xpos+0.8:rocket4_xpos=rocket4_xpos+0.8
    flame4_xpos=flame4_xpos+1.6:flame5_xpos=flame5_xpos+1.6:flame6_xpos=flame6_xpos+1.6:flame7_xpos=flame7_xpos+1.6

    boss_vertical_flag=1

  return

boss_move_left

    boss1a_xpos=boss1a_xpos-1.6:boss1b_xpos=boss1b_xpos-1.6:boss1c_xpos=boss1c_xpos-1.6:boss1d_xpos=boss1d_xpos-1.6
    rocket1_xpos=rocket1_xpos-0.8:rocket2_xpos=rocket2_xpos-0.8:rocket3_xpos=rocket3_xpos-0.8:rocket4_xpos=rocket4_xpos-0.8
    flame4_xpos=flame4_xpos-1.6:flame5_xpos=flame5_xpos-1.6:flame6_xpos=flame6_xpos-1.6:flame7_xpos=flame7_xpos-1.6

    boss_vertical_flag=2

  return

boss1_transition_return 

    ; Transition back to the game after defeating the boss

    ;──═◙ Increment frame and animation counters
    boss_counter=boss_counter+1
    if boss_counter>254 then boss_counter=0
    frame_counter=frame_counter+1
    if frame_counter>2 then frame_counter=0
    if frame_counter=2 then animate1=animate1+1
    if animate1>3 then animate1=0 

    ; Set Colors back to the defaults when you return to the game
    P0C1 = $F7 : P0C2 = $1C : P0C3 = $0F  ; City Defense Beam              
    P1C1 = $0F : P1C2 = $46 : P1C3 = $08  ; Drone: c1 rotors  c2 body  c3 middle
    P2C1 = $42 : P2C2 = $4A : P2C3 = $0C  ; Drone Laser  
    P3C1 = $38 : P3C2 = $36 : P3C3 = $32  ; Top Enemy Vehicle
    P4C1 = $08 : P4C2 = $0A : P4C3 = $0F  ; Top Line of Scrolling Background  |  C1:shadow  C2:bldg color  C3:window color
    P5C1 = $82 : P5C2 = $84 : P5C3 = $88  ; Middle Enemy Vehicle & Missile
    P6C1 = $42 : P6C2 = $44 : P6C3 = $46  ; Bottom Enemy Vehicle & Laser
    P7C1 = $02 : P7C2 = $04 : P7C3 = $06  ; Bottom three rows (City Colors) 
    gosub switch_screen bank2:healthHi = $00 : healthMed = $01 : healthLo = $00:transition_flag=0:boss1_defeated_flag=1

    restorescreen

    ;──═◙ Boss Explosion animation
    plotsprite boss1_explode1 0 boss1a_xpos boss1a_ypos animate1
    plotsprite boss1_explode1 0 boss1b_xpos boss1b_ypos animate1
    plotsprite boss1_explode1 0 boss1c_xpos boss1c_ypos animate1
    plotsprite boss1_explode1 0 boss1d_xpos boss1d_ypos animate1

    plotsprite drone1   1   drone_xpos   drone_ypos   animate1    

    boss1a_ypos=boss1a_ypos+1.8
    boss1b_ypos=boss1b_ypos+1.6
    boss1c_ypos=boss1c_ypos+1.4
    boss1d_ypos=boss1d_ypos+1.2

    drawscreen

    if boss_counter>60 then fire_debounce_1=99 : goto show_password

    goto boss1_transition_return

show_password

     ; These are the passwords for dropping you into the game AFTER the boss battle is over.
     ; If you use the boss battle 1 code, you will enter the game at level 2 right after the boss was defeated.

     ; boss battle 1
     ; 02 0b 10 07 15 03 0e 26 ; Easy
     ; 16 03 0e 0b 10 31 0e 07 ; Standard
     ; 40 10 31 0e 10 03 0e 0b ; Advanced
     ; 54 22 5b f6 10 27 0e 16 ; Expert

     ; boss battle 2
     ; 04 0a 00 01 3b 00 f8 00 ; Easy
     ; 18 00 f8 0a 00 0c f8 01 ; Standard
     ; 42 fa 0c f8 11 35 f8 0a ; Advanced
     ; 56 06 00 25 5d 10 f8 01 ; Expert

     ; boss battle 3
     ; 06 05 09 0a 3c 4b 2c 27 ; Easy
     ; 20 1f 01 27 09 00 2c 0a ; Standard
     ; 44 09 00 2c 09 1f 01 27 ; Advanced
     ; 58 3b 2a 19 09 00 5f 36 ; Expert

     ; boss battle 4
     ; 08 ef 0b 33 0e 0a 4f 15 ; Easy
     ; 22 25 35 13 0b 2c 4f 33 ; Standard
     ; 46 0b 2c 4f 0b 25 35 13 ; Advanced
     ; 5a 03 1b 11 0b 07 35 20 ; Expert

     ; boss battle 5
     ; 0a 11 28 ff 33 23 01 0a ; Easy
     ; 24 1f 02 ff 28 00 01 ff ; Standard
     ; 48 28 00 01 28 1f 02 ff ; Advanced
     ; 5c 00 54 08 28 01 02 fa ; Expert

     ; boss battle 6
     ; 0c 1f 01 0b 16 13 30 0b ; Easy
     ; 26 10 03 f6 01 27 f8 16 ; Standard
     ; 4a 01 27 f8 01 10 03 f6 ; Advanced
     ; 5e 1f 21 35 56 00 25 35 ; Expert

     ; boss battle 7
     ; 0e 25 35 00 00 00 00 2a ; Easy
     ; 28 00 00 25 35 13 06 01 ; Standard
     ; 4c 35 13 06 35 00 00 25 ; Advanced
     ; 60 25 f8 02 07 15 58 02 ; Expert

     ; boss battle 8
     ; 10 1f 02 36 18 22 28 0c ; Easy
     ; 3a 07 15 1f 02 ff 28 36 ; Standard
     ; 4e 02 ff 28 02 07 15 1f ; Advanced
     ; 62 ff 00 03 01 3b 10 03 ; Expert

     ; boss battle 9
     ; 12 10 03 20 02 37 22 23 ; Easy
     ; 3c 01 3b 10 03 f6 22 20 ; Standard
     ; 50 03 f6 22 03 01 3b 10 ; Advanced
     ; 64 f6 5c 04 0a 3c 3b 04 ; Expert

     ; boss battle 10
     ; 14 3b 04 fa 19 06 0c 38 ; Easy
     ; 3e 7a 3c 3b 04 2a 0c fa ; Standard
     ; 52 8a 2a 0c 04 0a 3c 3b ; Advanced
     ; 66 2a 5f 31 5e 22 3c 21 ; Expert

    ;──═◙ Debounce Fire Buttons
    if joy0fire1 then fire_debounce_1=1  ; Left Button
    if !joy0fire1 && fire_debounce_1=1 then fire_debounce_1=2

    restorescreen
    if gamedifficulty=0 then plotchars '02 0b 10 07 15 03 0e 26' 3 34 6 ;:plotchars 'easy' 6 54 8
    if gamedifficulty=1 then plotchars '16 03 0e 0b 10 31 0e 07' 3 34 6 ;:plotchars 'standard' 6 54 8
    if gamedifficulty=2 then plotchars '40 10 31 0e 10 03 0e 0b' 3 34 6 ;:plotchars 'advanced' 6 54 8
    if gamedifficulty=3 then plotchars '54 22 5b f6 10 27 0e 16' 3 34 6 ;:plotchars 'expert' 6 54 8
    drawscreen
    if fire_debounce_1=2 then return
    goto show_password

boss1_shake_drone
   shake_rnd=rand&7
   if shake_rnd=0 then drone_xpos=drone_xpos+1
   if shake_rnd=1 then drone_xpos=drone_xpos+2
   if shake_rnd=2 then drone_xpos=drone_xpos-1
   if shake_rnd=3 then drone_xpos=drone_xpos-2
   if shake_rnd=4 then drone_ypos=drone_ypos+1
   if shake_rnd=5 then drone_ypos=drone_ypos+2
   if shake_rnd=6 then drone_ypos=drone_ypos-1
   if shake_rnd=7 then drone_ypos=drone_ypos-2
   return

boss1_hit
   ;shake_boss=rand&7
   ;if shake_boss=0 then boss1a_xpos=boss1a_xpos+1:boss1b_xpos=boss1b_xpos+1:boss1c_xpos=boss1c_xpos+1:boss1d_xpos=boss1d_xpos+1
   ;if shake_boss=1 then boss1a_xpos=boss1a_xpos+2:boss1b_xpos=boss1b_xpos+2:boss1c_xpos=boss1c_xpos+2:boss1d_xpos=boss1d_xpos+2
   ;if shake_boss=2 then boss1a_xpos=boss1a_xpos-1:boss1b_xpos=boss1b_xpos-1:boss1c_xpos=boss1c_xpos-1:boss1d_xpos=boss1d_xpos-1
   ;if shake_boss=3 then boss1a_xpos=boss1a_xpos-2:boss1b_xpos=boss1b_xpos-2:boss1c_xpos=boss1c_xpos-2:boss1d_xpos=boss1d_xpos-2
   ;if shake_boss=4 then boss1a_ypos=boss1a_ypos+1:boss1b_ypos=boss1b_ypos+1:boss1c_ypos=boss1c_ypos+1:boss1d_ypos=boss1d_ypos+1
   ;if shake_boss=5 then boss1a_ypos=boss1a_ypos+2:boss1b_ypos=boss1b_ypos+2:boss1c_ypos=boss1c_ypos+2:boss1d_ypos=boss1d_ypos+2
   ;if shake_boss=6 then boss1a_ypos=boss1a_ypos-1:boss1b_ypos=boss1b_ypos-1:boss1c_ypos=boss1c_ypos-1:boss1d_ypos=boss1d_ypos-1
   ;if shake_boss=7 then boss1a_ypos=boss1a_ypos-2:boss1b_ypos=boss1b_ypos-2:boss1c_ypos=boss1c_ypos-2:boss1d_ypos=boss1d_ypos-2
   return

boss1_restore_color

    ; Called when drone is killed, changes colors back to default before switching to the game over screen.

    ; Set Colors back to the defaults when you return to the game
    P0C1 = $F7 : P0C2 = $1C : P0C3 = $0F  ; City Defense Beam              
    P1C1 = $0F : P1C2 = $46 : P1C3 = $08  ; Drone: c1 rotors  c2 body  c3 middle
    P2C1 = $42 : P2C2 = $4A : P2C3 = $0C  ; Drone Laser  
    P3C1 = $38 : P3C2 = $36 : P3C3 = $32  ; Top Enemy Vehicle
    P4C1 = $08 : P4C2 = $0A : P4C3 = $0F  ; Top Line of Scrolling Background  |  C1:shadow  C2:bldg color  C3:window color
    P5C1 = $82 : P5C2 = $84 : P5C3 = $88  ; Middle Enemy Vehicle & Missile
    P6C1 = $42 : P6C2 = $44 : P6C3 = $46  ; Bottom Enemy Vehicle & Laser
    P7C1 = $02 : P7C2 = $04 : P7C3 = $06  ; Bottom three rows (City Colors) 

  return

draw_laser_bank4

    ;if frame_counter=1 then plotsprite crosshair 2 crosshair_x_offset_1  laser_y_offset_10 : return
    
    ;──═◙ Set Y Positions for the Laser
    laser_y_offset_1 = drone_ypos+8 ; Top of laser beam
    laser_y_offset_2 = drone_ypos+16    
    laser_y_offset_3 = drone_ypos+24
    laser_y_offset_4 = drone_ypos+32
    laser_y_offset_5 = drone_ypos+40
    laser_y_offset_6 = drone_ypos+48
    laser_y_offset_7 = drone_ypos+56
    laser_y_offset_8 = drone_ypos+64
    laser_y_offset_9 = drone_ypos+72
    laser_y_offset_10 = drone_ypos+80
    ;──═◙ Set X Position for the Laser
    laser_x_offset_1 = drone_xpos+5
    crosshair_x_offset_1 = laser_x_offset_1+1 ; Center crosshair under the laser

   ;┌───────────────────────────────────┬────────────────────────┬─────────┬──────────────────────┬─────────────────────┬─────────────────┬─────────────────────────────────────────┐       
   ;│ Code                              │   sprite               │ palette │          X           │         Y           │ animation frame │   Notes                                 │
   ;└───────────────────────────────────┴────────────────────────┴─────────┴──────────────────────┴─────────────────────┴─────────────────┴─────────────────────────────────────────┘
    plotsprite                              crosshair                 2       crosshair_x_offset_1  laser_y_offset_10
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_1
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_2
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_3
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_4
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_5
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_6
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_7
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_8
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_9
    drawscreen
  return 


 ; ##################################################################################################################################################################3
 
sfx_bosslaser
    playsfx sfx_bosslaser
    return

sfx_boss1_missiles
    playsfx sfx_boss1_missiles
    return

 data sfx_boss1_missiles ; bass bump
    $10,$06,$00 ; version, priority, frames per chunk
    $1b,$0c,$0f ; first chunk of freq,channel,volume
    $0f,$06,$0c
    $07,$06,$0e
    $0f,$06,$0f
    $0f,$06,$0f
    $0f,$06,$0f
    $07,$06,$06
    $0f,$06,$0f
    $1b,$0c,$04
    $0f,$06,$05
    $0f,$06,$06
    $07,$06,$01
    $0f,$06,$03
    $00,$00,$00
end

    data sfx_bosslaser
    $10,$01,$00 ; version, priority, frames per chunk
    $10,$04,$01 ; first chunk of freq,channel,volume
    $13,$04,$08
    $16,$04,$08
    $16,$04,$07
    $1c,$04,$09
    $0b,$0c,$0f
    $0d,$0c,$0f
    $0e,$0c,$0f
    $0e,$0c,$0f
    $12,$0c,$0f
    $03,$06,$0d
    $1e,$0c,$0a
    $1e,$0c,$0c
    $0a,$06,$04
    $00,$00,$00
end

    data sfx_boss_hit
    $10,$10,$00 ; version, priority, frames per chunk
    $01,$08,$02
    $0b,$0c,$05
    $04,$06,$08
    $03,$0e,$0f
    $09,$06,$0f
    $0d,$06,$0f
    $04,$0e,$0f
    $0f,$06,$08
    $09,$06,$04
    $16,$01,$03
    $0c,$06,$04
    $09,$06,$05
    $0a,$06,$03
    $09,$06,$05
    $0d,$06,$08
    $09,$06,$04
    $04,$0e,$06
    $0f,$06,$05
    $0f,$06,$07
    $04,$0e,$07
    $08,$06,$06
    $03,$0e,$08
    $0f,$06,$06
    $09,$06,$05
    $06,$06,$05
    $03,$0e,$05
    $0e,$06,$06
    $02,$0e,$05
    $0f,$06,$03
    $0e,$06,$06
    $09,$06,$05
    $0c,$06,$05
    $0f,$06,$03
    $04,$0e,$08
    $0c,$06,$03
    $0f,$06,$03
    $0c,$06,$06
    $0f,$06,$04
    $0f,$06,$05
    $0f,$06,$03
    $0a,$06,$04
    $0f,$06,$03
    $08,$06,$03
    $0c,$06,$03
    $0e,$06,$03
    $08,$06,$03
    0,0,0
end

    data sfx_museboom
    $10,$10,$00 ; version, priority, frames per chunk
    $15,$04,$0b ; first chunk of freq,channel,volume
    $12,$0c,$0b
    $1e,$04,$0d
    $16,$04,$0b
    $04,$06,$0c
    $1c,$0c,$0d
    $0a,$0c,$0b
    $15,$04,$0c
    $1a,$0c,$0a
    $0c,$0c,$0d
    $13,$0c,$0a
    $15,$04,$0a
    $1a,$0c,$0a
    $05,$06,$09
    $0b,$0c,$09
    $16,$04,$0d
    $13,$0c,$08
    $13,$0c,$0d
    $0b,$0c,$0d
    $06,$06,$0b
    $1d,$0c,$09
    $10,$0c,$0b
    $1e,$04,$0c
    $05,$06,$0a
    $05,$06,$0b
    $0b,$0c,$0a
    $1c,$04,$0d
    $05,$06,$0b
    $18,$0c,$0c
    $0c,$0c,$0c
    $1b,$07,$0d
    $15,$0c,$0d
    $14,$0c,$0b
    $0b,$0c,$0d
    $1e,$0c,$0b
    $1b,$0c,$0c
    $0b,$0c,$0c
    $0d,$0c,$0d
    $1a,$0c,$09
    $15,$0c,$09
    $0a,$0c,$0a
    $06,$06,$07
    $17,$0c,$09
    $10,$0c,$08
    $1b,$0c,$07
    $06,$06,$06
    $17,$0c,$07
    $0c,$0c,$07
    $06,$06,$07
    $0e,$0f,$07
    $14,$0c,$07
    $10,$0c,$04
    $1a,$0c,$05
    $12,$0c,$04
    $1c,$0c,$03
    $14,$0c,$03
    $1e,$0c,$03
    $1d,$07,$02
    $08,$06,$01
    $16,$0c,$01
    $15,$0c,$01
    $00,$00,$00
end

 bank 5
     incgraphic gfx/ex2/boss2_explode1.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss2_explode2.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss2_explode3.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss2_explode4.png 160A 1 0 2 3

    incgraphic gfx/ex2/boss2a.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss2b.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss2c.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss2d.png 160A 1 0 2 3

    newblock

    incgraphic gfx/ex2/flame2a.png 160A 1 0 2 3
    incgraphic gfx/ex2/flame2b.png 160A 1 0 2 3
    incgraphic gfx/ex2/flame2c.png 160A 1 0 2 3
    incgraphic gfx/ex2/flame2d.png 160A 1 0 2 3

    incgraphic gfx/ex2/rocket_boss2.png 160A 1 0 2 3

    incgraphic gfx/ex2/long_laser1_boss2.png 160A 1 0 2 3
    incgraphic gfx/ex2/long_laser2_boss2.png 160A 1 0 2 3
    incgraphic gfx/ex2/long_laser3_boss2.png 160A 1 0 2 3
    incgraphic gfx/ex2/long_laser4_boss2.png 160A 1 0 2 3

    incgraphic gfx/ex2/text_boss_sentinel.png 160A 1 0 2 3
    incgraphic gfx/ex2/text_boss_drone_boss2.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss2_status_bar_middle.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss2_hp.png 160A 1 0 2 3

boss2_battle
    ;──═◙ Set Palette Colors
     P0C1 = $0A : P0C2 = $34 : P0C3 = $42  ; Flame             
     P1C1 = $0F : P1C2 = $46 : P1C3 = $08  ; Drone: c1 rotors  c2 body  c3 middle
     P2C1 = $48 : P2C2 = $4A : P2C3 = $40  ; Big Laser
     P3C1 = $06 : P3C2 = $04 : P3C3 = $08  ; Rockets
     ;P4C1 = $98 : P4C2 = $0A : P4C3 = $90  ; Status bar
     P5C1 = $92 : P5C2 = $84 : P5C3 = $98  ; Boss   c1 base ship color c2 mid-ship highlights  c3  Edge Outline
     P6C1 = $98 : P6C2 = $0A : P6C3 = $90  ; Status bar
    playsfx sfx_boss2_museboom
    plotsprite text_boss_sentinel 6 0 176
    plotsprite boss_status_bar_middle 4 58 176
    plotsprite boss_hp 5 52 176
    plotsprite text_boss_drone 0 110 176
    plotsprite boss_hp 0 151 176
    drawscreen
    savescreen

    if levelLo=$02 then P4C1=$12:P4C2=$16:P4C3=$0A
    if levelLo=$03 then P4C1=$22:P4C2=$26:P4C3=$08
    if levelLo=$04 then P4C1=$32:P4C2=$36:P4C3=$0A
    if levelLo=$05 then P4C1=$62:P4C2=$66:P4C3=$08
    if levelLo=$06 then P4C1=$52:P4C2=$56:P4C3=$0A
    if levelLo=$07 then P4C1=$42:P4C2=$46:P4C3=$08
    if levelLo=$08 then P4C1=$72:P4C2=$76:P4C3=$0A
    if levelLo=$09 then P4C1=$82:P4C2=$86:P4C3=$08
    if levelLo=$10 then P4C1=$A2:P4C2=$A6:P4C3=$0A
    if levelLo>$10 then P4C1=$C2:P4C2=$C6:P4C3=$0A

    ;──═◙ Set Drone Health for this Boss Battle
    healthHi = $00 : healthMed = $01 : healthLo = $00

    ;──═◙ Set Boss Health for this battle
    bossHi = $00 : bossMed = $03 : bossLo = $00

    ;──═◙ Set Initial values for Boss Frame Counters
    boss_move_counter=0 :  boss_counter = 0

    ;──═◙ Set Initial Location for Boss
    boss2a_xpos = 200.0 : boss2a_ypos = 132.1
    boss2b_xpos = 200.0 : boss2b_ypos = 140.1
    boss2c_xpos = 200.0 : boss2c_ypos = 148.1
    boss2d_xpos = 200.0 : boss2d_ypos = 156.1

    drone_xpos=0:drone_ypos=22

    boss_vertical_flag=0
    boss_init_counter = 0

    direction = 0

    scorea=scorea+100

    boss_color=5

boss2_battle_transition

    BACKGRND=$00

    if drone_xpos<70 then drone_xpos=drone_xpos+1

    ;──═◙ Increment frame and animation counters
    frame_counter=frame_counter+1
    if frame_counter>2 then frame_counter=0
    if frame_counter=2 then animate1=animate1+1
    if animate1>3 then animate1=0 

    ;──═◙ Move boss in from the right side of the screen
    boss2a_xpos=boss2a_xpos-0.8:boss2b_xpos=boss2b_xpos-0.8:boss2c_xpos=boss2c_xpos-0.8:boss2d_xpos=boss2d_xpos-0.8
    rocket1_xpos=rocket1_xpos-0.8:rocket2_xpos=rocket2_xpos-0.8:rocket3_xpos=rocket3_xpos-0.8:rocket4_xpos=rocket4_xpos-0.8

    restorescreen

    ;plotvalue    scoredigits      6     scoref       6       36    22    ; Boss Health   ;  36 22 (for 6 digits)
    ;plotvalue    scoredigits      6     scored       6       137   22    ; Drone Health  ; 137 22 (for 6 digits)

    plotvalue    scoredigits      6     bossMed        2       36    22    ; Boss Health   ;  36 22 (for 6 digits)
    plotvalue    scoredigits      6     bossLo         2       44    22    ; Boss Health   ;  36 22 (for 6 digits)
    plotvalue    scoredigits      2     healthMed      2       135   22    ; Drone Health  ; 137 22 (for 6 digits)
    plotvalue    scoredigits      2     healthLo       2       143   22    ; Drone Health  ; 137 22 (for 6 digits)

    ;plotsprite text_boss_sentinel 4 0 176
    ;plotsprite text_boss_drone 4 084 176

    plotsprite boss2a boss_color boss2a_xpos boss2a_ypos
    plotsprite boss2b boss_color boss2b_xpos boss2b_ypos
    plotsprite boss2c boss_color boss2c_xpos boss2c_ypos
    plotsprite boss2d boss_color boss2d_xpos boss2d_ypos
    plotsprite drone1 1 drone_xpos drone_ypos animate1 
 
    drawscreen

    if boss2a_xpos>20 then goto boss2_battle_transition

boss2_battle_init

    ;──═◙ Set Initial Location for Boss
    boss2a_xpos = 20.0 : boss2a_ypos = 132.1
    boss2b_xpos = 20.0 : boss2b_ypos = 140.1
    boss2c_xpos = 20.0 : boss2c_ypos = 148.1
    boss2d_xpos = 20.0 : boss2d_ypos = 156.1

    ;──═◙ Set Initial Location for Boss Rocket Flames
    flame4_xpos = 25.0 : flame4_ypos = 164.0  ; x+7
    flame5_xpos = 44.0 : flame5_ypos = 164.0  ; x+28
    flame6_xpos = 53.0 : flame6_ypos = 164.0  ; x+54
    flame7_xpos = 72.0 : flame7_ypos = 164.0  ; x+54

    ;──═◙ Set Boss Movement Flags
    boss_move_flag1=0  :  boss_move_flag2=0  :  boss_move_flag3=0   :  boss_move_flag4=0 

    ;──═◙ Set Initial Location for Boss Rockets
    rocket1_xpos = 42.0 : rocket1_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket2_xpos = 54.0 : rocket2_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket3_xpos = 77.0 : rocket3_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket4_xpos = 89.0 : rocket4_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos

    fire_debounce_1=0
    boss_vertical_flag=1

boss2_battle_loop

    boss_counter=boss_counter+1
    if boss_counter>254 then boss_counter=0
    if boss_init_counter<30 then boss_init_counter=boss_init_counter+1
    if boss_init_counter=30 then boss_init_counter=30
    if boss_init_counter<30 then rocket1_xpos_save=boss2a_xpos+12 : rocket2_xpos_save=boss2a_xpos+34 : rocket3_xpos_save=boss2a_xpos+57 : rocket4_xpos_save=boss2a_xpos+69
    
    BACKGRND=$00

    ;──═◙ Increment frame and animation counters
    frame_counter=frame_counter+1
    if frame_counter>2 then frame_counter=0
    if frame_counter=2 then animate1=animate1+1
    if animate1>3 then animate1=0 
    animate2=animate2+1
    if animate2>2 then animate2=0

    ;──═◙ DRONE DEFEATED: Check for Game Over if drone health reaches zero
    if healthLo=$00 && healthMed = $01 then goto skiphealthcheck_boss2
    if healthHi=$09 then healthLo=$00:healthMed=$00:player_flag=1:gosub boss2_restore_color:return ; if a hit drops you below zero to 999,999 health, detect it. Duplicate line to below.
    if healthLo<$01 || healthMed>$01 then healthLo=$00:healthMed=$00:player_flag=1:gosub boss2_restore_color:return     ; if health falls to zero, you are dead 
skiphealthcheck_boss2

    ;──═◙ Move Boss Left and Right
    if boss_counter>100 && boss_counter<180 then goto skip_boss2_move1
    if boss2a_xpos>96 then boss_move_counter=1
    if boss2a_xpos<2 then boss_move_counter=0
    if boss_move_counter=0 then gosub boss2_move_right
    if boss_move_counter=1 then gosub boss2_move_left
skip_boss2_move1

    if boss2a_ypos>134 then boss_vertical_flag=1    ; boss too far down, set vertical flag to move up
    if boss2a_ypos<100 then boss_vertical_flag=2    ; boss too far up, set vertical flag to move down

boss2_up_only
    if boss_counter>80 && boss_counter<160 && boss_vertical_flag=1 then gosub boss2_move_up

boss2_down_only
    if boss_counter>160 && boss_counter<240 && boss_vertical_flag=2 then gosub boss2_move_down

    if rocket1_ypos=136 then gosub sfx_boss2laser

    ;──═◙  Boss Fire cannons 
    if rocket1_ypos>190 && rocket1_ypos<200 then rocket1_ypos=130.0:rocket1_xpos_save=rocket1_xpos:rocket2_xpos_save=rocket2_xpos:rocket3_xpos_save=rocket3_xpos:rocket4_xpos_save=rocket4_xpos:gosub sfx_boss2laser
    rocket1_ypos=rocket1_ypos-1.5
    if rocket1_ypos>190 && rocket1_ypos<200 then rocket2_ypos=130.0:gosub sfx_boss2laser
    rocket2_ypos=rocket2_ypos-1.5
    if rocket1_ypos>190 && rocket1_ypos<200 then rocket3_ypos=130.0:gosub sfx_boss2laser
    rocket3_ypos=rocket3_ypos-1.5
    if rocket1_ypos>190 && rocket1_ypos<200 then rocket4_ypos=130.0:gosub sfx_boss2laser
    rocket4_ypos=rocket4_ypos-1.5

    ;──═◙ Check for Game Reset
    if switchreset then reboot

    ;──═◙ Debounce Fire Buttons
    if joy0fire1 then fire_debounce_1=1  ; Left Button
    if !joy0fire1 && fire_debounce_1=1 then fire_debounce_1=2
 
    ;──═◙ Move the drone on the screen
    if joy0right then drone_xpos=drone_xpos+1+drone_speed
    if joy0left then drone_xpos=drone_xpos-1-drone_speed
    if joy0up then drone_ypos=drone_ypos-1-drone_speed
    if joy0down then drone_ypos=drone_ypos+1+drone_speed

    ;──═◙ Keep the drone on the screen
    if drone_ypos>90 then drone_ypos=90
    if drone_ypos<8 then drone_ypos=8
    if drone_xpos<5 then drone_xpos=5
    if drone_xpos>140 then drone_xpos=140

    if laser_counter>10 then laser_fire_flag=1 
    if fire_debounce_1=1 then laser_counter=laser_counter+1 else laser_fire_flag=0:laser_counter=0

    if animate1=0 then boss_color=5 ; reset boss color back to default after hit


    ;──═◙ Detect Super Laser Hit
    asm
    QBOXCOLLISIONCHECK temp_laser_xpos,temp_laser_ypos,4,56,drone_xpos,drone_ypos,16,8
end
    if CARRY then gosub boss2_shake_drone:gosub sfx_boss2_missiles:dec scored=scored-1


    ;──═◙ Detect Boss Hit
    if crosshair_x_offset_1=200 then goto skip_boss2_coll 
    asm
    QBOXCOLLISIONCHECK boss2b_xpos,boss2b_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1:boss_color=animate1: playsfx sfx_boss2_hit
    asm
    QBOXCOLLISIONCHECK boss2c_xpos,boss2c_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1:boss_color=animate1: playsfx sfx_boss2_hit
    asm
    QBOXCOLLISIONCHECK boss2d_xpos,boss2d_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1:boss_color=animate1: playsfx sfx_boss2_hit
skip_boss2_coll


     ;──═◙ Detect Drone Hit
    asm
    QBOXCOLLISIONCHECK rocket1_xpos,rocket1_ypos,10,8,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_boss2_missiles:gosub boss2_shake_drone
    asm
    QBOXCOLLISIONCHECK rocket2_xpos,rocket2_ypos,10,8,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_boss2_missiles:gosub boss2_shake_drone
    asm
    QBOXCOLLISIONCHECK rocket3_xpos,rocket3_ypos,10,8,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_boss2_missiles:gosub boss2_shake_drone
    asm
    QBOXCOLLISIONCHECK rocket4_xpos,rocket4_ypos,10,8,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_boss2_missiles:gosub boss2_shake_drone


   ;──═◙ BOSS DEFEATED: this sets the defeated flag for Boss 1, resets health to 100, takes you back to the game
   if bossLo=$00 && bossMed>$00 then goto skipbosscheck_boss2
   if bossMed<$01 && bossLo<$05 || bossHi=$09 then boss_counter=0:frame_counter=0:animate1=0:levelLo=$02:goto boss2_transition_return  ; if a hit drops you below zero to 999,999 health, detect it (=$09)
skipbosscheck_boss2

   ;──═◙ Sets position of rocket flames underneath the four rockets shot by the boss
   rocketflame1_ypos=rocket1_ypos+8
   rocketflame2_ypos=rocket2_ypos+8
   rocketflame3_ypos=rocket3_ypos+8
   rocketflame4_ypos=rocket4_ypos+8

   restorescreen

    ;plotchars ' test' 3 0 1 ; this works

    if joy0left then plotsprite      drone1_left     1      drone_xpos      drone_ypos      animate1        : goto skip_next_boss2
    if joy0right then plotsprite     drone1_right    1      drone_xpos      drone_ypos      animate1        : goto skip_next_boss2
    plotsprite      drone1                      1      drone_xpos      drone_ypos      animate1        ; Drone
skip_next_boss2

    ;──═◙ Delay how often the big laser beam shows up
    if boss_counter>10 then temp_laser_xpos=200 : temp_laser_ypos=200 : goto boss2_skip_weapon
    temp_laser_xpos=boss2b_xpos+30.0 : temp_laser_ypos=boss2b_ypos-72.0
    plotsprite rocket 2 temp_laser_xpos temp_laser_ypos ;animate1
boss2_skip_weapon

    plotsprite boss2a boss_color boss2a_xpos boss2a_ypos
    plotsprite boss2b boss_color boss2b_xpos boss2b_ypos
    plotsprite boss2c boss_color boss2c_xpos boss2c_ypos
    plotsprite boss2d boss_color boss2d_xpos boss2d_ypos

    ;──═◙ Plot the laser when you press the fire button
    ;if joy0left || joy0right then goto skiplaserfire_boss2  ; You can only fire when you're not moving
    ;if joy0up || joy0down then goto skiplaserfire_boss2     ; ...
    if laser_fire_flag=1 then goto skiplaserfire_boss2
    if drone_ypos<22 then goto skiplaserfire_boss2 ; If you are too high up you can't fire
    if fire_debounce_1=1 && animate1=2 then gosub sfx_pulsecannon bank2:gosub draw_laser_boss2
    if fire_debounce_1<>1 then crosshair_x_offset_1=200
skiplaserfire_boss2

    ;plotvalue    scoredigits      6     scoref       6       36    22    ; Boss Health
    ;plotvalue    scoredigits      6     scored       6       137   22    ; Drone Health  

    plotvalue    scoredigits      6     bossMed        2       36    22    ; Boss Health   ;  36 22 (for 6 digits)
    plotvalue    scoredigits      6     bossLo         2       44    22    ; Boss Health   ;  36 22 (for 6 digits)
    plotvalue    scoredigits      2     healthMed      2       135   22    ; Drone Health  ; 137 22 (for 6 digits)
    plotvalue    scoredigits      2     healthLo       2       143   22    ; Drone Health  ; 137 22 (for 6 digits)

    plotsprite flame1a 0 rocket1_xpos_save rocketflame1_ypos animate1
    plotsprite flame1a 0 rocket2_xpos_save rocketflame2_ypos animate1
    plotsprite flame1a 0 rocket3_xpos_save rocketflame3_ypos animate1
    plotsprite flame1a 0 rocket4_xpos_save rocketflame4_ypos animate1 

    plotsprite rocket 3 rocket1_xpos_save rocket1_ypos
    plotsprite rocket 3 rocket2_xpos_save rocket2_ypos
    plotsprite rocket 3 rocket3_xpos_save rocket3_ypos
    plotsprite rocket 3 rocket4_xpos_save rocket4_ypos

    plotsprite flame1a 1 flame4_xpos flame4_ypos animate1
    plotsprite flame1a 1 flame5_xpos flame5_ypos animate1
    plotsprite flame1a 1 flame6_xpos flame6_ypos animate1
    plotsprite flame1a 1 flame7_xpos flame7_ypos animate1

   drawscreen
   
  goto boss2_battle_loop
  
boss2_move_up

    boss2a_ypos=boss2a_ypos-0.6:boss2b_ypos=boss2b_ypos-0.6:boss2c_ypos=boss2c_ypos-0.6:boss2d_ypos=boss2d_ypos-0.6
    rocket1_ypos=rocket1_ypos-0.6:rocket2_ypos=rocket1_ypos-0.6:rocket3_ypos=rocket1_ypos-0.6:rocket4_ypos=rocket1_ypos-0.6
    flame4_ypos=flame4_ypos-0.6:flame5_ypos=flame5_ypos-0.6:flame6_ypos=flame6_ypos-0.6:flame7_ypos=flame7_ypos-0.6

  return

boss2_move_down

    boss2a_ypos=boss2a_ypos+0.6:boss2b_ypos=boss2b_ypos+0.6:boss2c_ypos=boss2c_ypos+0.6:boss2d_ypos=boss2d_ypos+0.6
    rocket1_ypos=rocket1_ypos+0.6:rocket2_ypos=rocket1_ypos+0.6:rocket3_ypos=rocket1_ypos+0.6:rocket4_ypos=rocket1_ypos+0.6
    flame4_ypos=flame4_ypos+0.6:flame5_ypos=flame5_ypos+0.6:flame6_ypos=flame6_ypos+0.6:flame7_ypos=flame7_ypos+0.6

  return

boss2_move_right

    boss2a_xpos=boss2a_xpos+1.6:boss2b_xpos=boss2b_xpos+1.6:boss2c_xpos=boss2c_xpos+1.6:boss2d_xpos=boss2d_xpos+1.6
    rocket1_xpos=rocket1_xpos+0.8:rocket2_xpos=rocket2_xpos+0.8:rocket3_xpos=rocket3_xpos+0.8:rocket4_xpos=rocket4_xpos+0.8
    flame4_xpos=flame4_xpos+1.6:flame5_xpos=flame5_xpos+1.6:flame6_xpos=flame6_xpos+1.6:flame7_xpos=flame7_xpos+1.6

    boss_vertical_flag=1

  return

boss2_move_left

    boss2a_xpos=boss2a_xpos-1.6:boss2b_xpos=boss2b_xpos-1.6:boss2c_xpos=boss2c_xpos-1.6:boss2d_xpos=boss2d_xpos-1.6
    rocket1_xpos=rocket1_xpos-0.8:rocket2_xpos=rocket2_xpos-0.8:rocket3_xpos=rocket3_xpos-0.8:rocket4_xpos=rocket4_xpos-0.8
    flame4_xpos=flame4_xpos-1.6:flame5_xpos=flame5_xpos-1.6:flame6_xpos=flame6_xpos-1.6:flame7_xpos=flame7_xpos-1.6

    boss_vertical_flag=2

  return

boss2_transition_return 

    ; Transition back to the game after defeating the boss

    ;──═◙ Increment frame and animation counters
    boss_counter=boss_counter+1
    if boss_counter>254 then boss_counter=0
    frame_counter=frame_counter+1
    if frame_counter>2 then frame_counter=0
    if frame_counter=2 then animate1=animate1+1
    if animate1>3 then animate1=0 

    ; Set Colors back to the defaults when you return to the game
    P0C1 = $F7 : P0C2 = $1C : P0C3 = $0F  ; City Defense Beam              
    P1C1 = $0F : P1C2 = $46 : P1C3 = $08  ; Drone: c1 rotors  c2 body  c3 middle
    P2C1 = $42 : P2C2 = $4A : P2C3 = $0C  ; Drone Laser  
    P3C1 = $38 : P3C2 = $36 : P3C3 = $32  ; Top Enemy Vehicle
    P4C1 = $08 : P4C2 = $0A : P4C3 = $0F  ; Top Line of Scrolling Background  |  C1:shadow  C2:bldg color  C3:window color
    P5C1 = $82 : P5C2 = $84 : P5C3 = $88  ; Middle Enemy Vehicle & Missile
    P6C1 = $42 : P6C2 = $44 : P6C3 = $46  ; Bottom Enemy Vehicle & Laser
    P7C1 = $02 : P7C2 = $04 : P7C3 = $06  ; Bottom three rows (City Colors) 
    gosub switch_screen bank2:healthHi = $00 : healthMed = $01 : healthLo = $00:transition_flag=0:boss2_defeated_flag=1

    restorescreen

    ;──═◙ Boss Explosion animation
    plotsprite boss2_explode1 0 boss2a_xpos boss2a_ypos animate1
    plotsprite boss2_explode1 0 boss2b_xpos boss2b_ypos animate1
    plotsprite boss2_explode1 0 boss2c_xpos boss2c_ypos animate1
    plotsprite boss2_explode1 0 boss2d_xpos boss2d_ypos animate1

    plotsprite drone1   1   drone_xpos   drone_ypos   animate1    

    boss2a_ypos=boss2a_ypos+1.8
    boss2b_ypos=boss2b_ypos+1.6
    boss2c_ypos=boss2c_ypos+1.4
    boss2d_ypos=boss2d_ypos+1.2

    drawscreen

    if boss_counter>60 then fire_debounce_1=99 : goto show_boss2_password

    goto boss2_transition_return

show_boss2_password

     ; boss battle 1
     ; 02 0b 10 07 15 03 0e 26 ; Easy
     ; 16 03 0e 0b 10 31 0e 07 ; Standard
     ; 40 10 31 0e 10 03 0e 0b ; Advanced
     ; 54 22 5b f6 10 27 0e 16 ; Expert

     ; boss battle 2
     ; 04 0a 00 01 3b 00 f8 00 ; Easy
     ; 18 00 f8 0a 00 0c f8 01 ; Standard
     ; 42 fa 0c f8 11 35 f8 0a ; Advanced
     ; 56 06 00 25 5d 10 f8 01 ; Expert

     ; boss battle 3
     ; 06 05 09 0a 3c 4b 2c 27 ; Easy
     ; 20 1f 01 27 09 00 2c 0a ; Standard
     ; 44 09 00 2c 09 1f 01 27 ; Advanced
     ; 58 3b 2a 19 09 00 5f 36 ; Expert

     ; boss battle 4
     ; 08 ef 0b 33 0e 0a 4f 15 ; Easy
     ; 22 25 35 13 0b 2c 4f 33 ; Standard
     ; 46 0b 2c 4f 0b 25 35 13 ; Advanced
     ; 5a 03 1b 11 0b 07 35 20 ; Expert

     ; boss battle 5
     ; 0a 11 28 ff 33 23 01 0a ; Easy
     ; 24 1f 02 ff 28 00 01 ff ; Standard
     ; 48 28 00 01 28 1f 02 ff ; Advanced
     ; 5c 00 54 08 28 01 02 fa ; Expert

     ; boss battle 6
     ; 0c 1f 01 0b 16 13 30 0b ; Easy
     ; 26 10 03 f6 01 27 f8 16 ; Standard
     ; 4a 01 27 f8 01 10 03 f6 ; Advanced
     ; 5e 1f 21 35 56 00 25 35 ; Expert

     ; boss battle 7
     ; 0e 25 35 00 00 00 00 2a ; Easy
     ; 28 00 00 25 35 13 06 01 ; Standard
     ; 4c 35 13 06 35 00 00 25 ; Advanced
     ; 60 25 f8 02 07 15 58 02 ; Expert

     ; boss battle 8
     ; 10 1f 02 36 18 22 28 0c ; Easy
     ; 3a 07 15 1f 02 ff 28 36 ; Standard
     ; 4e 02 ff 28 02 07 15 1f ; Advanced
     ; 62 ff 00 03 01 3b 10 03 ; Expert

     ; boss battle 9
     ; 12 10 03 20 02 37 22 23 ; Easy
     ; 3c 01 3b 10 03 f6 22 20 ; Standard
     ; 50 03 f6 22 03 01 3b 10 ; Advanced
     ; 64 f6 5c 04 0a 3c 3b 04 ; Expert

     ; boss battle 10
     ; 14 3b 04 fa 19 06 0c 38 ; Easy
     ; 3e 7a 3c 3b 04 2a 0c fa ; Standard
     ; 52 8a 2a 0c 04 0a 3c 3b ; Advanced
     ; 66 2a 5f 31 5e 22 3c 21 ; Expert


    ;──═◙ Debounce Fire Buttons
    if joy0fire1 then fire_debounce_1=1  ; Left Button
    if !joy0fire1 && fire_debounce_1=1 then fire_debounce_1=2

    restorescreen
    if gamedifficulty=0 then plotchars '04 0a 00 01 3b 00 f8 00' 3 34 6 ;:plotchars 'easy' 6 54 8
    if gamedifficulty=1 then plotchars '18 00 f8 0a 00 0c f8 01' 3 34 6 ;:plotchars 'standard' 6 54 8
    if gamedifficulty=2 then plotchars '42 fa 0c f8 11 35 f8 0a' 3 34 6 ;:plotchars 'advanced' 6 54 8
    if gamedifficulty=3 then plotchars '56 06 00 25 5d 10 f8 01' 3 34 6 ;:plotchars 'expert' 6 54 8
    drawscreen
    if fire_debounce_1=2 then return
    goto show_boss2_password

boss2_shake_drone
   shake_rnd=rand&7
   if shake_rnd=0 then drone_xpos=drone_xpos+1
   if shake_rnd=1 then drone_xpos=drone_xpos+2
   if shake_rnd=2 then drone_xpos=drone_xpos-1
   if shake_rnd=3 then drone_xpos=drone_xpos-2
   if shake_rnd=4 then drone_ypos=drone_ypos+1
   if shake_rnd=5 then drone_ypos=drone_ypos+2
   if shake_rnd=6 then drone_ypos=drone_ypos-1
   if shake_rnd=7 then drone_ypos=drone_ypos-2
   return

boss2_hit
   ;shake_boss=rand&7
   ;if shake_boss=0 then boss2a_xpos=boss2a_xpos+1:boss2b_xpos=boss2b_xpos+1:boss2c_xpos=boss2c_xpos+1:boss2d_xpos=boss2d_xpos+1
   ;if shake_boss=1 then boss2a_xpos=boss2a_xpos+2:boss2b_xpos=boss2b_xpos+2:boss2c_xpos=boss2c_xpos+2:boss2d_xpos=boss2d_xpos+2
   ;if shake_boss=2 then boss2a_xpos=boss2a_xpos-1:boss2b_xpos=boss2b_xpos-1:boss2c_xpos=boss2c_xpos-1:boss2d_xpos=boss2d_xpos-1
   ;if shake_boss=3 then boss2a_xpos=boss2a_xpos-2:boss2b_xpos=boss2b_xpos-2:boss2c_xpos=boss2c_xpos-2:boss2d_xpos=boss2d_xpos-2
   ;if shake_boss=4 then boss2a_ypos=boss2a_ypos+1:boss2b_ypos=boss2b_ypos+1:boss2c_ypos=boss2c_ypos+1:boss2d_ypos=boss2d_ypos+1
   ;if shake_boss=5 then boss2a_ypos=boss2a_ypos+2:boss2b_ypos=boss2b_ypos+2:boss2c_ypos=boss2c_ypos+2:boss2d_ypos=boss2d_ypos+2
   ;if shake_boss=6 then boss2a_ypos=boss2a_ypos-1:boss2b_ypos=boss2b_ypos-1:boss2c_ypos=boss2c_ypos-1:boss2d_ypos=boss2d_ypos-1
   ;if shake_boss=7 then boss2a_ypos=boss2a_ypos-2:boss2b_ypos=boss2b_ypos-2:boss2c_ypos=boss2c_ypos-2:boss2d_ypos=boss2d_ypos-2
   return

boss2_restore_color

    ; Called when drone is killed, changes colors back to default before switching to the game over screen.

    ; Set Colors back to the defaults when you return to the game
    P0C1 = $F7 : P0C2 = $1C : P0C3 = $0F  ; City Defense Beam              
    P1C1 = $0F : P1C2 = $46 : P1C3 = $08  ; Drone: c1 rotors  c2 body  c3 middle
    P2C1 = $42 : P2C2 = $4A : P2C3 = $0C  ; Drone Laser  
    P3C1 = $38 : P3C2 = $36 : P3C3 = $32  ; Top Enemy Vehicle
    P4C1 = $08 : P4C2 = $0A : P4C3 = $0F  ; Top Line of Scrolling Background  |  C1:shadow  C2:bldg color  C3:window color
    P5C1 = $82 : P5C2 = $84 : P5C3 = $88  ; Middle Enemy Vehicle & Missile
    P6C1 = $42 : P6C2 = $44 : P6C3 = $46  ; Bottom Enemy Vehicle & Laser
    P7C1 = $02 : P7C2 = $04 : P7C3 = $06  ; Bottom three rows (City Colors) 

  return

draw_laser_boss2
    ;──═◙ Set Y Positions for the Laser
    laser_y_offset_1 = drone_ypos+8 ; Top of laser beam
    laser_y_offset_2 = drone_ypos+16    
    laser_y_offset_3 = drone_ypos+24
    laser_y_offset_4 = drone_ypos+32
    laser_y_offset_5 = drone_ypos+40
    laser_y_offset_6 = drone_ypos+48
    laser_y_offset_7 = drone_ypos+56
    laser_y_offset_8 = drone_ypos+64
    laser_y_offset_9 = drone_ypos+72
    laser_y_offset_10 = drone_ypos+80
    ;──═◙ Set X Position for the Laser
    laser_x_offset_1 = drone_xpos+5
    crosshair_x_offset_1 = laser_x_offset_1+1 ; Center crosshair under the laser

   ;┌───────────────────────────────────┬────────────────────────┬─────────┬──────────────────────┬─────────────────────┬─────────────────┬─────────────────────────────────────────┐       
   ;│ Code                              │   sprite               │ palette │          X           │         Y           │ animation frame │   Notes                                 │
   ;└───────────────────────────────────┴────────────────────────┴─────────┴──────────────────────┴─────────────────────┴─────────────────┴─────────────────────────────────────────┘
    plotsprite                              crosshair                 2       crosshair_x_offset_1  laser_y_offset_10
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_1
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_2
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_3
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_4
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_5
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_6
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_7
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_8
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_9
  return 


 ; ##################################################################################################################################################################3
 
sfx_boss2laser
    playsfx sfx_boss2laser
    return

sfx_boss2_missiles
    playsfx sfx_boss1_missiles
    return

 data sfx_boss2_missiles ; bass bump
    $10,$06,$00 ; version, priority, frames per chunk
    $1b,$0c,$0f ; first chunk of freq,channel,volume
    $0f,$06,$0c
    $07,$06,$0e
    $0f,$06,$0f
    $0f,$06,$0f
    $0f,$06,$0f
    $07,$06,$06
    $0f,$06,$0f
    $1b,$0c,$04
    $0f,$06,$05
    $0f,$06,$06
    $07,$06,$01
    $0f,$06,$03
    $00,$00,$00
end

    data sfx_boss2laser
    $10,$01,$00 ; version, priority, frames per chunk
    $10,$04,$01 ; first chunk of freq,channel,volume
    $13,$04,$08
    $16,$04,$08
    $16,$04,$07
    $1c,$04,$09
    $0b,$0c,$0f
    $0d,$0c,$0f
    $0e,$0c,$0f
    $0e,$0c,$0f
    $12,$0c,$0f
    $03,$06,$0d
    $1e,$0c,$0a
    $1e,$0c,$0c
    $0a,$06,$04
    $00,$00,$00
end

    data sfx_boss2_hit
    $10,$10,$00 ; version, priority, frames per chunk
    $01,$08,$02
    $0b,$0c,$05
    $04,$06,$08
    $03,$0e,$0f
    $09,$06,$0f
    $0d,$06,$0f
    $04,$0e,$0f
    $0f,$06,$08
    $09,$06,$04
    $16,$01,$03
    $0c,$06,$04
    $09,$06,$05
    $0a,$06,$03
    $09,$06,$05
    $0d,$06,$08
    $09,$06,$04
    $04,$0e,$06
    $0f,$06,$05
    $0f,$06,$07
    $04,$0e,$07
    $08,$06,$06
    $03,$0e,$08
    $0f,$06,$06
    $09,$06,$05
    $06,$06,$05
    $03,$0e,$05
    $0e,$06,$06
    $02,$0e,$05
    $0f,$06,$03
    $0e,$06,$06
    $09,$06,$05
    $0c,$06,$05
    $0f,$06,$03
    $04,$0e,$08
    $0c,$06,$03
    $0f,$06,$03
    $0c,$06,$06
    $0f,$06,$04
    $0f,$06,$05
    $0f,$06,$03
    $0a,$06,$04
    $0f,$06,$03
    $08,$06,$03
    $0c,$06,$03
    $0e,$06,$03
    $08,$06,$03
    0,0,0
end

    data sfx_boss2_museboom
    $10,$10,$00 ; version, priority, frames per chunk
    $15,$04,$0b ; first chunk of freq,channel,volume
    $12,$0c,$0b
    $1e,$04,$0d
    $16,$04,$0b
    $04,$06,$0c
    $1c,$0c,$0d
    $0a,$0c,$0b
    $15,$04,$0c
    $1a,$0c,$0a
    $0c,$0c,$0d
    $13,$0c,$0a
    $15,$04,$0a
    $1a,$0c,$0a
    $05,$06,$09
    $0b,$0c,$09
    $16,$04,$0d
    $13,$0c,$08
    $13,$0c,$0d
    $0b,$0c,$0d
    $06,$06,$0b
    $1d,$0c,$09
    $10,$0c,$0b
    $1e,$04,$0c
    $05,$06,$0a
    $05,$06,$0b
    $0b,$0c,$0a
    $1c,$04,$0d
    $05,$06,$0b
    $18,$0c,$0c
    $0c,$0c,$0c
    $1b,$07,$0d
    $15,$0c,$0d
    $14,$0c,$0b
    $0b,$0c,$0d
    $1e,$0c,$0b
    $1b,$0c,$0c
    $0b,$0c,$0c
    $0d,$0c,$0d
    $1a,$0c,$09
    $15,$0c,$09
    $0a,$0c,$0a
    $06,$06,$07
    $17,$0c,$09
    $10,$0c,$08
    $1b,$0c,$07
    $06,$06,$06
    $17,$0c,$07
    $0c,$0c,$07
    $06,$06,$07
    $0e,$0f,$07
    $14,$0c,$07
    $10,$0c,$04
    $1a,$0c,$05
    $12,$0c,$04
    $1c,$0c,$03
    $14,$0c,$03
    $1e,$0c,$03
    $1d,$07,$02
    $08,$06,$01
    $16,$0c,$01
    $15,$0c,$01
    $00,$00,$00
end

 bank 6

   newblock
    incgraphic gfx/ex2/boss3a.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss3b.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss3c.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss3d.png 160A 1 0 2 3

boss3_battle
    playsfx sfx_museboom_boss3
    savescreen
    ;──═◙ Set Palette Colors
     P0C1 = $F7 : P0C2 = $1C : P0C3 = $0F  ; City Defense Beam              
     P1C1 = $0F : P1C2 = $46 : P1C3 = $08  ; Drone: c1 rotors  c2 body  c3 middle
     P2C1 = $42 : P2C2 = $4A : P2C3 = $0C  ; Drone Laser  
     P3C1 = $38 : P3C2 = $36 : P3C3 = $32  ; Top Enemy Vehicle
     P4C1 = $08 : P4C2 = $0A : P4C3 = $0F  ; Top Line of Scrolling Background  |  C1:shadow  C2:bldg color  C3:window color
     P5C1 = $82 : P5C2 = $84 : P5C3 = $96  ; Middle Enemy Vehicle & Missile
     P6C1 = $42 : P6C2 = $44 : P6C3 = $46  ; Bottom Enemy Vehicle & Laser
    ;P7C1 = $02 : P7C2 = $04 : P7C3 = $06  ; level 1 city color
    ;P4C1 = $12 : P4C2 = $16 : P4C3 = $0A  ; level 2 city color
    ;P4C1 = $22 : P4C2 = $26 : P4C3 = $08  ; level 3 city color
    ;P4C1 = $32 : P4C2 = $36 : P4C3 = $0A  ; level 4 city color
    ;P4C1 = $62 : P4C2 = $66 : P4C3 = $08  ; level 5 city color
    ;P4C1 = $52 : P4C2 = $56 : P4C3 = $0A  ; level 6 city color
    ;P4C1 = $42 : P4C2 = $46 : P4C3 = $08  ; level 7 city color
    ;P4C1 = $72 : P4C2 = $76 : P4C3 = $0A  ; level 8 city color 
    ;P4C1 = $82 : P4C2 = $86 : P4C3 = $08  ; level 9 city color
    ;P4C1 = $A2 : P4C2 = $A6 : P4C3 = $0A  ; level 10 city color
    ;P4C1 = $C2 : P4C2 = $C6 : P4C3 = $0A  ; level 11 city color

    if levelLo=$02 then P4C1=$12:P4C2=$16:P4C3=$0A
    if levelLo=$03 then P4C1=$22:P4C2=$26:P4C3=$08
    if levelLo=$04 then P4C1=$32:P4C2=$36:P4C3=$0A
    if levelLo=$05 then P4C1=$62:P4C2=$66:P4C3=$08
    if levelLo=$06 then P4C1=$52:P4C2=$56:P4C3=$0A
    if levelLo=$07 then P4C1=$42:P4C2=$46:P4C3=$08
    if levelLo=$08 then P4C1=$72:P4C2=$76:P4C3=$0A
    if levelLo=$09 then P4C1=$82:P4C2=$86:P4C3=$08
    if levelLo=$10 then P4C1=$A2:P4C2=$A6:P4C3=$0A
    if levelLo>$10 then P4C1=$C2:P4C2=$C6:P4C3=$0A

    ;──═◙ Set Drone Health for this Boss Battle
    healthHi = $00 : healthMed = $00 : healthLo = $51

    ;──═◙ Set Boss Health for this battle
    bossHi = $00 : bossMed = $00 : bossLo = $60

    ;──═◙ Set Initial values for Boss Frame Counters
    boss_move_counter=0 :  boss_counter = 0

    ;──═◙ Set Initial Location for Boss
    boss3a_xpos = 200.0 : boss3a_ypos = 132.1
    boss3b_xpos = 200.0 : boss3b_ypos = 140.1
    boss3c_xpos = 200.0 : boss3c_ypos = 148.1
    boss3d_xpos = 200.0 : boss3d_ypos = 156.1

    drone_xpos=0:drone_ypos=22

    boss_vertical_flag=0
    boss_init_counter = 0

    direction = 0

    scorea=scorea+100

boss3_battle_transition

    BACKGRND=$00

    if drone_xpos<70 then drone_xpos=drone_xpos+1

    ;──═◙ Increment frame and animation counters
    frame_counter=frame_counter+1
    if frame_counter>2 then frame_counter=0
    if frame_counter=2 then animate1=animate1+1
    if animate1>3 then animate1=0 

    ;──═◙ Move boss in from the right side of the screen
    boss3a_xpos=boss3a_xpos-0.8:boss3b_xpos=boss3b_xpos-0.8:boss3c_xpos=boss3c_xpos-0.8:boss3d_xpos=boss3d_xpos-0.8
    rocket1_xpos=rocket1_xpos-0.8:rocket2_xpos=rocket2_xpos-0.8:rocket3_xpos=rocket3_xpos-0.8:rocket4_xpos=rocket4_xpos-0.8

    restorescreen

    plotchars 'boss health:' 3 0 22
    plotchars 'drone health:' 3 84 22
    plotvalue    scoredigits      3     scoref       6       50    22    ; Boss Health
    plotvalue    scoredigits      3     scored       6       137   22    ; Drone Health  
    plotsprite boss3a 5 boss3a_xpos boss3a_ypos
    plotsprite boss3b 5 boss3b_xpos boss3b_ypos
    plotsprite boss3c 5 boss3c_xpos boss3c_ypos
    plotsprite boss3d 5 boss3d_xpos boss3d_ypos
    plotsprite drone1 1 drone_xpos drone_ypos animate1 
 
    drawscreen

    if boss3a_xpos>20 then goto boss3_battle_transition

boss3_battle_init

    ;──═◙ Set Initial Location for Boss
    boss3a_xpos = 20.0 : boss3a_ypos = 132.1
    boss3b_xpos = 20.0 : boss3b_ypos = 140.1
    boss3c_xpos = 20.0 : boss3c_ypos = 148.1
    boss3d_xpos = 20.0 : boss3d_ypos = 156.1

    ;──═◙ Set Boss Movement Flags
    boss_move_flag1=0  :  boss_move_flag2=0  :  boss_move_flag3=0   :  boss_move_flag4=0 

    ;──═◙ Set Initial Location for Boss Rockets
    rocket1_xpos = 42.0 : rocket1_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket2_xpos = 54.0 : rocket2_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket3_xpos = 77.0 : rocket3_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket4_xpos = 89.0 : rocket4_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos

    fire_debounce_1=0

    boss_vertical_flag=1

boss3_battle_loop

    boss_counter=boss_counter+1
    if boss_counter>254 then boss_counter=0
    if boss_init_counter<30 then boss_init_counter=boss_init_counter+1
    if boss_init_counter=30 then boss_init_counter=30
    if boss_init_counter<30 then rocket1_xpos_save=boss3a_xpos+12 : rocket2_xpos_save=boss3a_xpos+34 : rocket3_xpos_save=boss3a_xpos+57 : rocket4_xpos_save=boss3a_xpos+69

    
    BACKGRND=$00

    ;──═◙ Increment frame and animation counters
    frame_counter=frame_counter+1
    if frame_counter>2 then frame_counter=0
    if frame_counter=2 then animate1=animate1+1
    if animate1>3 then animate1=0 
    animate2=animate2+1
    if animate2>2 then animate2=0

    ;──═◙ Check for Game Over if drone health reaches zero
    if healthLo=$00 && healthMed = $01 then goto skiphealthcheck_boss3
    if healthLo<$01 || healthMed>$01 then healthLo=$00:healthMed=$00:player_flag=1:return; if health falls to zero, you are dead - add animation, explosion, game over, etc.
skiphealthcheck_boss3

    ;──═◙ Move Boss Left and Right
    if boss_counter>100 && boss_counter<180 then goto skip_boss3_move
    if boss3a_xpos>96 then boss_move_counter=1
    if boss3a_xpos<2 then boss_move_counter=0
    if boss_move_counter=0 then gosub boss3_move_right
    if boss_move_counter=1 then gosub boss3_move_left
skip_boss3_move

    if boss3a_ypos>134 then boss_vertical_flag=1    ;too far down, set vertical flag to move up
    if boss3a_ypos<100 then boss_vertical_flag=2    ;too far up, set vertical flag to move down

boss3_up_only
    if boss_counter>80 && boss_counter<160 && boss_vertical_flag=1 then gosub boss3_move_up

boss3_down_only
    if boss_counter>160 && boss_counter<240 && boss_vertical_flag=2 then gosub boss3_move_down


    if rocket1_ypos=136 then gosub sfx_plainlaser

    ;──═◙  Boss Fire cannons 
    if rocket1_ypos<8 then rocket1_ypos=130.0:rocket1_xpos_save=rocket1_xpos:rocket2_xpos_save=rocket2_xpos:rocket3_xpos_save=rocket3_xpos:rocket4_xpos_save=rocket4_xpos:gosub sfx_plainlaser
    rocket1_ypos=rocket1_ypos-1.8
    if rocket2_ypos<8 then rocket2_ypos=130.0:gosub sfx_plainlaser
    rocket2_ypos=rocket2_ypos-1.8
    if rocket3_ypos<8 then rocket3_ypos=130.0:gosub sfx_plainlaser
    rocket3_ypos=rocket3_ypos-1.8
    if rocket4_ypos<8 then rocket4_ypos=130.0:gosub sfx_plainlaser
    rocket4_ypos=rocket4_ypos-1.8


    ;──═◙ Check for Game Reset
    if switchreset then reboot

    ;──═◙ Debounce Fire Buttons
    if joy0fire1 then fire_debounce_1=1  ; Left Button
    if !joy0fire1 && fire_debounce_1=1 then fire_debounce_1=2
 
    ;──═◙ Move the drone on the screen
    if joy0right then drone_xpos=drone_xpos+1+drone_speed
    if joy0left then drone_xpos=drone_xpos-1-drone_speed
    if joy0up then drone_ypos=drone_ypos-1-drone_speed
    if joy0down then drone_ypos=drone_ypos+1+drone_speed

    ;──═◙ Keep the drone on the screen
    if drone_ypos>90 then drone_ypos=90
    if drone_ypos<8 then drone_ypos=8
    if drone_xpos<8 then drone_xpos=8
    if drone_xpos>128 then drone_xpos=128


    if laser_counter>10 then laser_fire_flag=1 
    if fire_debounce_1=1 then laser_counter=laser_counter+1 else laser_fire_flag=0:laser_counter=0

    ;──═◙ Detect Boss Hit
    if crosshair_x_offset_1=200 then goto skip_boss3_coll 
    asm
    QBOXCOLLISIONCHECK boss3b_xpos,boss3b_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1
    asm
    QBOXCOLLISIONCHECK boss3c_xpos,boss3c_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1
    asm
    QBOXCOLLISIONCHECK boss3d_xpos,boss3d_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1
skip_boss3_coll

    ;──═◙ Detect Drone Hit
    asm
    QBOXCOLLISIONCHECK rocket1_xpos,rocket1_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone
    asm
    QBOXCOLLISIONCHECK rocket2_xpos,rocket2_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone
    asm
    QBOXCOLLISIONCHECK rocket3_xpos,rocket3_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone
    asm
    QBOXCOLLISIONCHECK rocket4_xpos,rocket4_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone

   ; this sets the defeated flag for Boss 3
   if bossLo<$50 then gosub switch_screen bank2:healthHi = $00 : healthMed = $05 : healthLo = $00:transition_flag=0:boss3_defeated_flag=1:levelLo=$04:return

   restorescreen

    plotchars 'boss health:' 3 0 22
    plotchars 'drone health:' 3 84 22
    plotvalue    scoredigits      3     scoref       6       50    22    ; Boss Health
    plotvalue    scoredigits      3     scored       6       137   22    ; Drone Health  
    plotsprite boss3a 5 boss3a_xpos boss3a_ypos
    plotsprite boss3b 5 boss3b_xpos boss3b_ypos
    plotsprite boss3c 5 boss3c_xpos boss3c_ypos
    plotsprite boss3d 5 boss3d_xpos boss3d_ypos

    plotsprite bomb_large_up 6 rocket1_xpos_save rocket1_ypos
    plotsprite bomb_large_up 6 rocket2_xpos_save rocket2_ypos
    plotsprite bomb_large_up 6 rocket3_xpos_save rocket3_ypos
    plotsprite bomb_large_up 6 rocket4_xpos_save rocket4_ypos

    if joy0left then plotsprite      drone1_left     1      drone_xpos      drone_ypos      animate1        : goto skip_next_boss3
    if joy0right then plotsprite     drone1_right    1      drone_xpos      drone_ypos      animate1        : goto skip_next_boss3
    plotsprite      drone1                      1      drone_xpos      drone_ypos      animate1        ; Drone
skip_next_boss3

    ;──═◙ Plot the laser when you press the fire button
    ;if joy0left || joy0right then goto skiplaserfire_boss3  ; You can only fire when you're not moving
    ;if joy0up || joy0down then goto skiplaserfire_boss3     ; ...
    if laser_fire_flag=1 then goto skiplaserfire_boss3
    if drone_ypos<22 then goto skiplaserfire_boss3 ; If you are too high up you can't fire
    if fire_debounce_1=1 then gosub sfx_pulsecannon bank2:gosub draw_laser bank2
    if fire_debounce_1<>1 then crosshair_x_offset_1=200
skiplaserfire_boss3

   drawscreen
   
  goto boss3_battle_loop
  
boss3_move_up

    boss3a_ypos=boss3a_ypos-0.6:boss3b_ypos=boss3b_ypos-0.6:boss3c_ypos=boss3c_ypos-0.6:boss3d_ypos=boss3d_ypos-0.6
    rocket1_ypos=rocket1_ypos-0.6:rocket2_ypos=rocket1_ypos-0.6:rocket3_ypos=rocket1_ypos-0.6:rocket4_ypos=rocket1_ypos-0.6

  return

boss3_move_down

    boss3a_ypos=boss3a_ypos+0.6:boss3b_ypos=boss3b_ypos+0.6:boss3c_ypos=boss3c_ypos+0.6:boss3d_ypos=boss3d_ypos+0.6
    rocket1_ypos=rocket1_ypos+0.6:rocket2_ypos=rocket1_ypos+0.6:rocket3_ypos=rocket1_ypos+0.6:rocket4_ypos=rocket1_ypos+0.6

  return

boss3_move_right

    boss3a_xpos=boss3a_xpos+1.6:boss3b_xpos=boss3b_xpos+1.6:boss3c_xpos=boss3c_xpos+1.6:boss3d_xpos=boss3d_xpos+1.6
    rocket1_xpos=rocket1_xpos+0.8:rocket2_xpos=rocket2_xpos+0.8:rocket3_xpos=rocket3_xpos+0.8:rocket4_xpos=rocket4_xpos+0.8
    boss_vertical_flag=1

  return

boss3_move_left

    boss3a_xpos=boss3a_xpos-1.6:boss3b_xpos=boss3b_xpos-1.6:boss3c_xpos=boss3c_xpos-1.6:boss3d_xpos=boss3d_xpos-1.6
    rocket1_xpos=rocket1_xpos-0.8:rocket2_xpos=rocket2_xpos-0.8:rocket3_xpos=rocket3_xpos-0.8:rocket4_xpos=rocket4_xpos-0.8
    boss_vertical_flag=2

  return

 ; ##################################################################################################################################################################3
 
    data sfx_museboom_boss3
    $10,$10,$00 ; version, priority, frames per chunk
    $15,$04,$0b ; first chunk of freq,channel,volume
    $12,$0c,$0b
    $1e,$04,$0d
    $16,$04,$0b
    $04,$06,$0c
    $1c,$0c,$0d
    $0a,$0c,$0b
    $15,$04,$0c
    $1a,$0c,$0a
    $0c,$0c,$0d
    $13,$0c,$0a
    $15,$04,$0a
    $1a,$0c,$0a
    $05,$06,$09
    $0b,$0c,$09
    $16,$04,$0d
    $13,$0c,$08
    $13,$0c,$0d
    $0b,$0c,$0d
    $06,$06,$0b
    $1d,$0c,$09
    $10,$0c,$0b
    $1e,$04,$0c
    $05,$06,$0a
    $05,$06,$0b
    $0b,$0c,$0a
    $1c,$04,$0d
    $05,$06,$0b
    $18,$0c,$0c
    $0c,$0c,$0c
    $1b,$07,$0d
    $15,$0c,$0d
    $14,$0c,$0b
    $0b,$0c,$0d
    $1e,$0c,$0b
    $1b,$0c,$0c
    $0b,$0c,$0c
    $0d,$0c,$0d
    $1a,$0c,$09
    $15,$0c,$09
    $0a,$0c,$0a
    $06,$06,$07
    $17,$0c,$09
    $10,$0c,$08
    $1b,$0c,$07
    $06,$06,$06
    $17,$0c,$07
    $0c,$0c,$07
    $06,$06,$07
    $0e,$0f,$07
    $14,$0c,$07
    $10,$0c,$04
    $1a,$0c,$05
    $12,$0c,$04
    $1c,$0c,$03
    $14,$0c,$03
    $1e,$0c,$03
    $1d,$07,$02
    $08,$06,$01
    $16,$0c,$01
    $15,$0c,$01
    $00,$00,$00
end


 bank 7

   newblock
    incgraphic gfx/ex2/boss4a.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss4b.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss4c.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss4d.png 160A 1 0 2 3

boss4_battle
    playsfx sfx_museboom_boss4
    savescreen
    ;──═◙ Set Palette Colors
     P0C1 = $F7 : P0C2 = $1C : P0C3 = $0F  ; City Defense Beam              
     P1C1 = $0F : P1C2 = $46 : P1C3 = $08  ; Drone: c1 rotors  c2 body  c3 middle
     P2C1 = $42 : P2C2 = $4A : P2C3 = $0C  ; Drone Laser  
     P3C1 = $38 : P3C2 = $36 : P3C3 = $32  ; Top Enemy Vehicle
     P4C1 = $08 : P4C2 = $0A : P4C3 = $0F  ; Top Line of Scrolling Background  |  C1:shadow  C2:bldg color  C3:window color
     P5C1 = $82 : P5C2 = $84 : P5C3 = $96  ; Middle Enemy Vehicle & Missile
     P6C1 = $42 : P6C2 = $44 : P6C3 = $46  ; Bottom Enemy Vehicle & Laser
    ;P7C1 = $02 : P7C2 = $04 : P7C3 = $06  ; level 1 city color
    ;P4C1 = $12 : P4C2 = $16 : P4C3 = $0A  ; level 2 city color
    ;P4C1 = $22 : P4C2 = $26 : P4C3 = $08  ; level 3 city color
    ;P4C1 = $32 : P4C2 = $36 : P4C3 = $0A  ; level 4 city color
    ;P4C1 = $62 : P4C2 = $66 : P4C3 = $08  ; level 5 city color
    ;P4C1 = $52 : P4C2 = $56 : P4C3 = $0A  ; level 6 city color
    ;P4C1 = $42 : P4C2 = $46 : P4C3 = $08  ; level 7 city color
    ;P4C1 = $72 : P4C2 = $76 : P4C3 = $0A  ; level 8 city color 
    ;P4C1 = $82 : P4C2 = $86 : P4C3 = $08  ; level 9 city color
    ;P4C1 = $A2 : P4C2 = $A6 : P4C3 = $0A  ; level 10 city color
    ;P4C1 = $C2 : P4C2 = $C6 : P4C3 = $0A  ; level 11 city color

    if levelLo=$02 then P4C1=$12:P4C2=$16:P4C3=$0A
    if levelLo=$03 then P4C1=$22:P4C2=$26:P4C3=$08
    if levelLo=$04 then P4C1=$32:P4C2=$36:P4C3=$0A
    if levelLo=$05 then P4C1=$62:P4C2=$66:P4C3=$08
    if levelLo=$06 then P4C1=$52:P4C2=$56:P4C3=$0A
    if levelLo=$07 then P4C1=$42:P4C2=$46:P4C3=$08
    if levelLo=$08 then P4C1=$72:P4C2=$76:P4C3=$0A
    if levelLo=$09 then P4C1=$82:P4C2=$86:P4C3=$08
    if levelLo=$10 then P4C1=$A2:P4C2=$A6:P4C3=$0A
    if levelLo>$10 then P4C1=$C2:P4C2=$C6:P4C3=$0A

    ;──═◙ Set Drone Health for this Boss Battle
    healthHi = $00 : healthMed = $00 : healthLo = $51

    ;──═◙ Set Boss Health for this battle
    bossHi = $00 : bossMed = $00 : bossLo = $60

    ;──═◙ Set Initial values for Boss Frame Counters
    boss_move_counter=0 :  boss_counter = 0

    ;──═◙ Set Initial Location for Boss
    boss4a_xpos = 200.0 : boss4a_ypos = 132.1
    boss4b_xpos = 200.0 : boss4b_ypos = 140.1
    boss4c_xpos = 200.0 : boss4c_ypos = 148.1
    boss4d_xpos = 200.0 : boss4d_ypos = 156.1

    drone_xpos=0:drone_ypos=22

    boss_vertical_flag=0
    boss_init_counter = 0

    direction = 0

    scorea=scorea+100

boss4_battle_transition

    BACKGRND=$00

    if drone_xpos<70 then drone_xpos=drone_xpos+1

    ;──═◙ Increment frame and animation counters
    frame_counter=frame_counter+1
    if frame_counter>2 then frame_counter=0
    if frame_counter=2 then animate1=animate1+1
    if animate1>3 then animate1=0 

    ;──═◙ Move boss in from the right side of the screen
    boss4a_xpos=boss4a_xpos-0.8:boss4b_xpos=boss4b_xpos-0.8:boss4c_xpos=boss4c_xpos-0.8:boss4d_xpos=boss4d_xpos-0.8
    rocket1_xpos=rocket1_xpos-0.8:rocket2_xpos=rocket2_xpos-0.8:rocket3_xpos=rocket3_xpos-0.8:rocket4_xpos=rocket4_xpos-0.8

    restorescreen

    plotchars 'boss health:' 3 0 22
    plotchars 'drone health:' 3 84 22
    plotvalue    scoredigits      3     scoref       6       50    22    ; Boss Health
    plotvalue    scoredigits      3     scored       6       137   22    ; Drone Health  
    plotsprite boss4a 5 boss4a_xpos boss4a_ypos
    plotsprite boss4b 5 boss4b_xpos boss4b_ypos
    plotsprite boss4c 5 boss4c_xpos boss4c_ypos
    plotsprite boss4d 5 boss4d_xpos boss4d_ypos
    plotsprite drone1 1 drone_xpos drone_ypos animate1 
 
    drawscreen

    if boss4a_xpos>20 then goto boss4_battle_transition

boss4_battle_init

    ;──═◙ Set Initial Location for Boss
    boss4a_xpos = 20.0 : boss4a_ypos = 132.1
    boss4b_xpos = 20.0 : boss4b_ypos = 140.1
    boss4c_xpos = 20.0 : boss4c_ypos = 148.1
    boss4d_xpos = 20.0 : boss4d_ypos = 156.1

    ;──═◙ Set Boss Movement Flags
    boss_move_flag1=0  :  boss_move_flag2=0  :  boss_move_flag3=0   :  boss_move_flag4=0 

    ;──═◙ Set Initial Location for Boss Rockets
    rocket1_xpos = 42.0 : rocket1_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket2_xpos = 54.0 : rocket2_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket3_xpos = 77.0 : rocket3_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket4_xpos = 89.0 : rocket4_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos

    fire_debounce_1=0

    boss_vertical_flag=1

boss4_battle_loop

    boss_counter=boss_counter+1
    if boss_counter>254 then boss_counter=0
    if boss_init_counter<30 then boss_init_counter=boss_init_counter+1
    if boss_init_counter=30 then boss_init_counter=30
    if boss_init_counter<30 then rocket1_xpos_save=boss4a_xpos+12 : rocket2_xpos_save=boss4a_xpos+34 : rocket3_xpos_save=boss4a_xpos+57 : rocket4_xpos_save=boss4a_xpos+69

    
    BACKGRND=$00

    ;──═◙ Increment frame and animation counters
    frame_counter=frame_counter+1
    if frame_counter>2 then frame_counter=0
    if frame_counter=2 then animate1=animate1+1
    if animate1>3 then animate1=0 
    animate2=animate2+1
    if animate2>2 then animate2=0

    ;──═◙ Check for Game Over if drone health reaches zero
    if healthLo=$00 && healthMed = $01 then goto skiphealthcheck_boss4
    if healthLo<$01 || healthMed>$01 then healthLo=$00:healthMed=$00:player_flag=1:return; if health falls to zero, you are dead - add animation, explosion, game over, etc.
skiphealthcheck_boss4

    ;──═◙ Move Boss Left and Right
    if boss_counter>100 && boss_counter<180 then goto skip_boss4_move
    if boss4a_xpos>96 then boss_move_counter=1
    if boss4a_xpos<2 then boss_move_counter=0
    if boss_move_counter=0 then gosub boss4_move_right
    if boss_move_counter=1 then gosub boss4_move_left
skip_boss4_move

    if boss4a_ypos>134 then boss_vertical_flag=1    ;too far down, set vertical flag to move up
    if boss4a_ypos<100 then boss_vertical_flag=2    ;too far up, set vertical flag to move down

boss4_up_only
    if boss_counter>80 && boss_counter<160 && boss_vertical_flag=1 then gosub boss4_move_up

boss4_down_only
    if boss_counter>160 && boss_counter<240 && boss_vertical_flag=2 then gosub boss4_move_down

    if rocket1_ypos=136 then gosub sfx_plainlaser

    ;──═◙  Boss Fire cannons 
    if rocket1_ypos<8 then rocket1_ypos=130.0:rocket1_xpos_save=rocket1_xpos:rocket2_xpos_save=rocket2_xpos:rocket3_xpos_save=rocket3_xpos:rocket4_xpos_save=rocket4_xpos:gosub sfx_plainlaser
    rocket1_ypos=rocket1_ypos-1.8
    if rocket2_ypos<8 then rocket2_ypos=130.0:gosub sfx_plainlaser
    rocket2_ypos=rocket2_ypos-1.8
    if rocket3_ypos<8 then rocket3_ypos=130.0:gosub sfx_plainlaser
    rocket3_ypos=rocket3_ypos-1.8
    if rocket4_ypos<8 then rocket4_ypos=130.0:gosub sfx_plainlaser
    rocket4_ypos=rocket4_ypos-1.8


    ;──═◙ Check for Game Reset
    if switchreset then reboot

    ;──═◙ Debounce Fire Buttons
    if joy0fire1 then fire_debounce_1=1  ; Left Button
    if !joy0fire1 && fire_debounce_1=1 then fire_debounce_1=2
 
    ;──═◙ Move the drone on the screen
    if joy0right then drone_xpos=drone_xpos+1+drone_speed
    if joy0left then drone_xpos=drone_xpos-1-drone_speed
    if joy0up then drone_ypos=drone_ypos-1-drone_speed
    if joy0down then drone_ypos=drone_ypos+1+drone_speed

    ;──═◙ Keep the drone on the screen
    if drone_ypos>90 then drone_ypos=90
    if drone_ypos<8 then drone_ypos=8
    if drone_xpos<8 then drone_xpos=8
    if drone_xpos>128 then drone_xpos=128


    if laser_counter>10 then laser_fire_flag=1 
    if fire_debounce_1=1 then laser_counter=laser_counter+1 else laser_fire_flag=0:laser_counter=0

    ;──═◙ Detect Boss Hit
    if crosshair_x_offset_1=200 then goto skip_boss4_coll 
    asm
    QBOXCOLLISIONCHECK boss4b_xpos,boss4b_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1
    asm
    QBOXCOLLISIONCHECK boss4c_xpos,boss4c_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1
    asm
    QBOXCOLLISIONCHECK boss4d_xpos,boss4d_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1
skip_boss4_coll

    ;──═◙ Detect Drone Hit
    asm
    QBOXCOLLISIONCHECK rocket1_xpos,rocket1_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone
    asm
    QBOXCOLLISIONCHECK rocket2_xpos,rocket2_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone
    asm
    QBOXCOLLISIONCHECK rocket3_xpos,rocket3_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone
    asm
    QBOXCOLLISIONCHECK rocket4_xpos,rocket4_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone

   ; this sets the defeated flag for Boss 4
   if bossLo<$50 then gosub switch_screen bank2:healthHi = $00 : healthMed = $05 : healthLo = $00:transition_flag=0:boss4_defeated_flag=1:levelLo=$05:return

   restorescreen

    plotchars 'boss health:' 3 0 22
    plotchars 'drone health:' 3 84 22
    plotvalue    scoredigits      3     scoref       6       50    22    ; Boss Health
    plotvalue    scoredigits      3     scored       6       137   22    ; Drone Health  
    plotsprite boss4a 5 boss4a_xpos boss4a_ypos
    plotsprite boss4b 5 boss4b_xpos boss4b_ypos
    plotsprite boss4c 5 boss4c_xpos boss4c_ypos
    plotsprite boss4d 5 boss4d_xpos boss4d_ypos

    plotsprite bomb_large_up 6 rocket1_xpos_save rocket1_ypos
    plotsprite bomb_large_up 6 rocket2_xpos_save rocket2_ypos
    plotsprite bomb_large_up 6 rocket3_xpos_save rocket3_ypos
    plotsprite bomb_large_up 6 rocket4_xpos_save rocket4_ypos

    if joy0left then plotsprite      drone1_left     1      drone_xpos      drone_ypos      animate1        : goto skip_next_boss4
    if joy0right then plotsprite     drone1_right    1      drone_xpos      drone_ypos      animate1        : goto skip_next_boss4
    plotsprite      drone1                      1      drone_xpos      drone_ypos      animate1        ; Drone
skip_next_boss4

    ;──═◙ Plot the laser when you press the fire button
    ;if joy0left || joy0right then goto skiplaserfire_boss4  ; You can only fire when you're not moving
    ;if joy0up || joy0down then goto skiplaserfire_boss4     ; ...
    if laser_fire_flag=1 then goto skiplaserfire_boss4
    if drone_ypos<22 then goto skiplaserfire_boss4 ; If you are too high up you can't fire
    if fire_debounce_1=1 then gosub sfx_pulsecannon bank2:gosub draw_laser bank2
    if fire_debounce_1<>1 then crosshair_x_offset_1=200
skiplaserfire_boss4

   drawscreen
   
  goto boss4_battle_loop
  
boss4_move_up

    boss4a_ypos=boss4a_ypos-0.6:boss4b_ypos=boss4b_ypos-0.6:boss4c_ypos=boss4c_ypos-0.6:boss4d_ypos=boss4d_ypos-0.6
    rocket1_ypos=rocket1_ypos-0.6:rocket2_ypos=rocket1_ypos-0.6:rocket3_ypos=rocket1_ypos-0.6:rocket4_ypos=rocket1_ypos-0.6

  return

boss4_move_down

    boss4a_ypos=boss4a_ypos+0.6:boss4b_ypos=boss4b_ypos+0.6:boss4c_ypos=boss4c_ypos+0.6:boss4d_ypos=boss4d_ypos+0.6
    rocket1_ypos=rocket1_ypos+0.6:rocket2_ypos=rocket1_ypos+0.6:rocket3_ypos=rocket1_ypos+0.6:rocket4_ypos=rocket1_ypos+0.6

  return

boss4_move_right

    boss4a_xpos=boss4a_xpos+1.6:boss4b_xpos=boss4b_xpos+1.6:boss4c_xpos=boss4c_xpos+1.6:boss4d_xpos=boss4d_xpos+1.6
    rocket1_xpos=rocket1_xpos+0.8:rocket2_xpos=rocket2_xpos+0.8:rocket3_xpos=rocket3_xpos+0.8:rocket4_xpos=rocket4_xpos+0.8
    boss_vertical_flag=1

  return

boss4_move_left

    boss4a_xpos=boss4a_xpos-1.6:boss4b_xpos=boss4b_xpos-1.6:boss4c_xpos=boss4c_xpos-1.6:boss4d_xpos=boss4d_xpos-1.6
    rocket1_xpos=rocket1_xpos-0.8:rocket2_xpos=rocket2_xpos-0.8:rocket3_xpos=rocket3_xpos-0.8:rocket4_xpos=rocket4_xpos-0.8
    boss_vertical_flag=2

  return

 ; ##################################################################################################################################################################3
 
    data sfx_museboom_boss4
    $10,$10,$00 ; version, priority, frames per chunk
    $15,$04,$0b ; first chunk of freq,channel,volume
    $12,$0c,$0b
    $1e,$04,$0d
    $16,$04,$0b
    $04,$06,$0c
    $1c,$0c,$0d
    $0a,$0c,$0b
    $15,$04,$0c
    $1a,$0c,$0a
    $0c,$0c,$0d
    $13,$0c,$0a
    $15,$04,$0a
    $1a,$0c,$0a
    $05,$06,$09
    $0b,$0c,$09
    $16,$04,$0d
    $13,$0c,$08
    $13,$0c,$0d
    $0b,$0c,$0d
    $06,$06,$0b
    $1d,$0c,$09
    $10,$0c,$0b
    $1e,$04,$0c
    $05,$06,$0a
    $05,$06,$0b
    $0b,$0c,$0a
    $1c,$04,$0d
    $05,$06,$0b
    $18,$0c,$0c
    $0c,$0c,$0c
    $1b,$07,$0d
    $15,$0c,$0d
    $14,$0c,$0b
    $0b,$0c,$0d
    $1e,$0c,$0b
    $1b,$0c,$0c
    $0b,$0c,$0c
    $0d,$0c,$0d
    $1a,$0c,$09
    $15,$0c,$09
    $0a,$0c,$0a
    $06,$06,$07
    $17,$0c,$09
    $10,$0c,$08
    $1b,$0c,$07
    $06,$06,$06
    $17,$0c,$07
    $0c,$0c,$07
    $06,$06,$07
    $0e,$0f,$07
    $14,$0c,$07
    $10,$0c,$04
    $1a,$0c,$05
    $12,$0c,$04
    $1c,$0c,$03
    $14,$0c,$03
    $1e,$0c,$03
    $1d,$07,$02
    $08,$06,$01
    $16,$0c,$01
    $15,$0c,$01
    $00,$00,$00
end


 bank 8
    incbanner gfx/ex2/AA_Logo3.png 160A 0 1 2 3

draw_ranks
    if pointsHi=$00 && pointsMed=$00 && pointsMed=$00    then plotchars 'rank: unranked' 2 47 8                : return
    if pointsHi<=$01 && pointsMed<=$49 && pointsMed<=$99 then plotchars 'rank: private' 2 48 8              : return
    if pointsHi<=$01 && pointsMed>=$50 && pointsMed<=$99 then plotchars 'rank: specialist' 2 43 8           : return
    if pointsHi>=$01 && pointsHi<$02 && pointsMed<=$99   then plotchars 'rank: corporal' 2 47 8             : return 
    if pointsHi>=$02 && pointsHi<$03 && pointsMed<=$99   then plotchars 'rank: sergeant' 2 47 8             : return
    if pointsHi>=$03 && pointsHi<$04 && pointsMed<=$99   then plotchars 'rank: sergeant major' 2 35 8       : return 
    if pointsHi>=$04 && pointsHi<$05 && pointsMed<=$99   then plotchars 'rank: lieutenant' 2 43 8           : return
    if pointsHi>=$05 && pointsHi<$06 && pointsMed<=$99   then plotchars 'rank: captain' 2 48 8              : return
    if pointsHi>=$06 && pointsHi<$07 && pointsMed<=$99   then plotchars 'rank: major' 2 53 8                : return
    if pointsHi>=$07 && pointsHi<$08 && pointsMed<=$99   then plotchars 'rank: lieutenant colonel' 2 27 8   : return 
    if pointsHi>=$08 && pointsHi<$09 && pointsMed<=$99   then plotchars 'rank: colonel' 2 48 8             : return
    if pointsHi>=$09                                     then plotchars 'rank: general' 2 48 8              : return
    return

aa_logo_display
    clearscreen
    ;P0C1=$04 : P0C2=$06 : P0C3=$08
    ;P4C1=$08 : P4C2=$82 : P4C3=$34 
    frame=0
    mutesfx tia

aa_logo_display_loop

    BACKGRND=$00

    rem ** fade in and out...
    if frame<15 then fadevalue=fadevalue+1
    if frame>227 && frame<243 then fadevalue=fadevalue-1

    rem ** set the global fade value...
    setfade fadevalue

    rem ** fetch the fade values appropriate for our colors.
    rem ** note the "black" argument, which zeroes the hue nibble
    rem ** when the luminance nibble is zero.

    P0C1=getfade($08,black)
    P0C2=getfade($06,black)
    P0C3=getfade($04,black)

    P4C1=getfade($08,black)
    P4C2=getfade($82,black)
    P4C3=getfade($34,black)

    
    frame=frame+1

    if joy0fire then debounce_fire=2
    if !joy0fire && debounce_fire=2 then debounce_fire=3
    if debounce_fire=3 then debounce_fire=0:player_flag=0:clearscreen:savescreen:drawscreen:return

    beam_counter=beam_counter+1
    if beam_counter>254 then return

   restorescreen
   plotbanner AA_Logo3 4 28 48 
   if beam_counter>30 then plotchars 'presents' 0 64 13
   if beam_counter>34 then plotchars 'a game by steve engelhardt' 0 28 15
   if beam_counter>38 then plotchars '(c) 2023' 0 64 17
   drawscreen
   goto aa_logo_display_loop

level_check

    ; Level up progression based on score.  
    ; After level 10 speeds do not change, but level will still increment.
    ; Change City color for each level advancement
    ;  -> changing city background would require a new game loop in a new bank - will investigate (graphics bank space constraint)
    ;                    pointsHi : pointsMed : pointsLo            pointsHi = $00 : pointsMed = $00 : pointsLo = $00
    ;                    --------   ---------   --------
    ; Level 1  - 000000     00          00          00
    ; Level 2  - 005000     00          50          00 x
    ; Level 3  - 010000     01          00          00 x
    ; Level 4  - 020000     02          00          00 x
    ; Level 5  - 030000     03          00          00
    ; Level 6  - 040000     04          00          00
    ; Level 7  - 050000     05          00          00
    ; Level 8  - 060000     06          00          00
    ; Level 9  - 070000     07          00          00
    ; Level 10 - 080000     08          00          00
    ; Level 10+- 090000     09          00          00
    
    ;For Testing:  
    ;pointsHi=$08:pointsMed=$00:pointsLo=$00
    ;Default City Colors:  P4C1 = $02 : P4C2 = $06 : P4C3 = $0A
    
    ;level_flag default is 0


    ; boss defeated flag is 0
    ; transition_flag is 0
    ; level flag is  0
    ;
    ; level flag flips to 1 when you hit 5,000 points with the first line below, speeds are changed
    ; boss 1 defeated flag is 0, so it goes to the next line
    ; level flag is 1, so transition begins and level flag is set to 2
    ; main loop runs, and if level flag is 2 it gosubs to boss_l2, and after the boss is defeated it returns to the main loop with boss defeated=1 and transition flag=0.
    ;
    ; 2nd time around, the boss1 is defeated, so it doesn't check a 2nd time for levelflag being 1, and doesn't set the transition flag to 1.
    ; since the level flag is now 1, the L2 section now never runs again, because levelflag<>0 and boss1_defeated_flag=1.
    
    ; L2       Low:  5,000   High: 09,900
    if pointsHi<=$01 && pointsMed>=$50 && pointsMed<=$99 && level_flag=0 then levelLo=$02:  level_flag=1: gosub set_level_2
    if boss1_defeated_flag=1 then  P4C1=$12:P4C2=$16:P4C3=$0A:goto skip_to_L3
    if level_flag=1 then transition_timer=0:transition_flag=1:level_flag=2
skip_to_L3
 
    ; L3       Low: 10,000   High: 19,900   
    if pointsHi>=$01 && pointsMed<=$99                   && level_flag=2 then levelLo=$03:  level_flag=3: gosub set_level_3  
    if boss2_defeated_flag=1 then P4C1=$22:P4C2=$26:P4C3=$08: goto skip_to_L4
    if level_flag=3 then transition_timer=0:transition_flag=1:level_flag=4
skip_to_L4

    ; L4       Low: 20,000   High: 29,900  
    if pointsHi>=$02 && pointsMed<=$99                   && level_flag=4 then levelLo=$04:  level_flag=5: gosub set_level_4 
    if boss3_defeated_flag=1 then P4C1=$32:P4C2=$36:P4C3=$0A: goto skip_to_L5
    if level_flag=5 then level_flag=6 
skip_to_L5

    ; L5       Low: 30,000   High: 39,900  
    if pointsHi>=$03 && pointsMed<=$99 && level_flag=6 then levelLo=$05:   level_flag=7: gosub set_level_5  
    if boss4_defeated_flag=1 then  P4C1=$62:P4C2=$66:P4C3=$08:goto skip_to_L6
    if level_flag=7 then level_flag=8
skip_to_L6
  
    ; L6       Low: 40,000   High  49,900  
    if pointsHi>=$04 && pointsMed<=$99 && level_flag=8 then levelLo=$06:    level_flag=9: gosub set_level_6 
    if boss5_defeated_flag=1 then P4C1=$52:P4C2=$56:P4C3=$0A: goto skip_to_L7
    if level_flag=9 then level_flag=10
skip_to_L7

    ;return

level_check2
    
    ; L7       Low: 50,000   High  59,900  
    if pointsHi>=$05 && pointsMed<=$99 && level_flag<=10 then levelLo=$07:    level_flag=11: gosub set_level_7 
    if boss6_defeated_flag=1 then P4C1=$42:P4C2=$46:P4C3=$08: goto skip_to_L8
    if level_flag=11 then level_flag=12 
skip_to_L8

    ; L8       Low: 60,000   High  69,900  
    if pointsHi>=$06 && pointsMed<=$99 && level_flag=12 then levelLo=$08:    level_flag=13: gosub set_level_8 
    if boss7_defeated_flag=1 then P4C1=$72:P4C2=$76:P4C3=$0A: goto skip_to_L9
    if level_flag=13 then level_flag=14
skip_to_L9

    ; L9       Low: 70,000   High  79,900 
    if pointsHi>=$07 && pointsMed<=$99 && level_flag=14 then levelLo=$09:    level_flag=15: gosub set_level_9 
    if boss8_defeated_flag=1 then P4C1=$82:P4C2=$86:P4C3=$08: goto skip_to_L10
    if level_flag=15 then level_flag=16
skip_to_L10  

    ; L10      Low: 80,000   High  89,900 
    if pointsHi>=$08 && pointsMed<=$99 && level_flag=16 then levelLo=$10:    level_flag=17: gosub set_level_10 
    if boss9_defeated_flag=1 then P4C1=$A2:P4C2=$A6:P4C3=$0A: goto skip_to_L11
    if level_flag=17 then level_flag=18
skip_to_L11

    ; L11+      Low: 90,000+
    if pointsHi>=$09 && pointsMed<=$99 && level_flag<=18 then levelLo=$11:   level_flag=19:  gosub set_level_11
    if boss10_defeated_flag=1 then P4C1=$C2:P4C2=$C6:P4C3=$0A: goto skip_to_next_level
    if level_flag=19 then level_flag=20
skip_to_next_level

    return

boss_l2
    gosub switch_screen bank2
    gosub boss1_battle bank4
    gosub set_level_2
    P4C1=$12:P4C2=$16:P4C3=$0A
    return

boss_l3
    gosub switch_screen bank2
    gosub boss2_battle bank5
    gosub set_level_3
    P4C1=$22:P4C2=$26:P4C3=$08
    return

boss_l4
    gosub switch_screen bank2
    gosub boss3_battle bank6
    gosub set_level_4
    P4C1=$32:P4C2=$36:P4C3=$0A
    return

boss_l5
    gosub switch_screen bank2
    gosub boss4_battle bank7
    gosub set_level_5
    P4C1=$62:P4C2=$66:P4C3=$08
    return

boss_l6
    gosub switch_screen bank2
    gosub boss5_battle bank9
    gosub set_level_6
    P4C1=$52:P4C2=$56:P4C3=$0A
    return

boss_l7
    gosub switch_screen bank2
    gosub boss6_battle bank10
    gosub set_level_7
    P4C1=$42:P4C2=$46:P4C3=$08
    return

boss_l8
    gosub switch_screen bank2
    gosub boss7_battle bank11
    gosub set_level_8
    P4C1=$72:P4C2=$76:P4C3=$0A
    return

boss_l9
    gosub switch_screen bank2
    gosub boss8_battle bank12
    gosub set_level_9
    P4C1=$82:P4C2=$86:P4C3=$08
    return

boss_l10
    gosub switch_screen bank2
    gosub boss9_battle bank13
    gosub set_level_10
    P4C1=$A2:P4C2=$A6:P4C3=$0A
    return

boss_l11
    gosub switch_screen bank2
    gosub boss10_battle bank14
    gosub set_level_11
    P4C1=$C2:P4C2=$C6:P4C3=$0A
    return



    ;not used
level_check3
    if pointsHi>=$10 && pointsMed<=$99 then levelLo=$12:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$11 && pointsMed<=$99 then levelLo=$13:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$12 && pointsMed<=$99 then levelLo=$14:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$13 && pointsMed<=$99 then levelLo=$15:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$14 && pointsMed<=$99 then levelLo=$16:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$15 && pointsMed<=$99 then levelLo=$17:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$16 && pointsMed<=$99 then levelLo=$18:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$17 && pointsMed<=$99 then levelLo=$19:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$18 && pointsMed<=$99 then levelLo=$20:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$19 && pointsMed<=$99 then levelLo=$21:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$20 && pointsMed<=$99 then levelLo=$22:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$21 && pointsMed<=$99 then levelLo=$23:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$22 && pointsMed<=$99 then levelLo=$24:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$23 && pointsMed<=$99 then levelLo=$25:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$24 && pointsMed<=$99 then levelLo=$26:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$25 && pointsMed<=$99 then levelLo=$27:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$25 && pointsMed<=$99 then levelLo=$28:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$26 && pointsMed<=$99 then levelLo=$29:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$27 && pointsMed<=$99 then levelLo=$30:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$28 && pointsMed<=$99 then levelLo=$31:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$29 && pointsMed<=$99 then levelLo=$32:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$30 && pointsMed<=$99 then levelLo=$33:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$31 && pointsMed<=$99 then levelLo=$34:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$32 && pointsMed<=$99 then levelLo=$35:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$33 && pointsMed<=$99 then levelLo=$36:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$34 && pointsMed<=$99 then levelLo=$37:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$35 && pointsMed<=$99 then levelLo=$38:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$36 && pointsMed<=$99 then levelLo=$39:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$37 && pointsMed<=$99 then levelLo=$40:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$38 && pointsMed<=$99 then levelLo=$41:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$39 && pointsMed<=$99 then levelLo=$42:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$40 && pointsMed<=$99 then levelLo=$43:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$41 && pointsMed<=$99 then levelLo=$44:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$42 && pointsMed<=$99 then levelLo=$45:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$43 && pointsMed<=$99 then levelLo=$46:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$44 && pointsMed<=$99 then levelLo=$47:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$45 && pointsMed<=$99 then levelLo=$48:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$46 && pointsMed<=$99 then levelLo=$49:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$47 && pointsMed<=$99 then levelLo=$50:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$48 && pointsMed<=$99 then levelLo=$51:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$49 && pointsMed<=$99 then levelLo=$52:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    if pointsHi>=$50 && pointsMed<=$99 then levelLo=$53:   P4C1=$C2:P4C2=$C6:P4C3=$0A:  gosub set_level_11
    return

 return


set_level_2
    if menu_option_skill=1 then goto speed_1a ; Easy 
    if menu_option_skill=2 then goto speed_2a ; Standard 
    if menu_option_skill=3 then goto speed_3a ; Advanced
    if menu_option_skill=4 then goto speed_4a ; Expert

speed_1a                ;Easy Mode
    tank1_speed=0.2
    tank2_speed=0.3
    tank3_speed=0.4
    cannon1_speed=0.1
    cannon2_speed=0.2
    missile1_speed=0.3
    missile2_speed=0.4
    missile3_speed=0.5
    drone_speed=0.0
    goto speed_enda
speed_2a                ;Standard Mode
    tank1_speed=0.4
    tank2_speed=0.5
    tank3_speed=0.6
    cannon1_speed=0.2
    cannon2_speed=0.3
    missile1_speed=0.4
    missile2_speed=0.5
    missile3_speed=0.6
    drone_speed=0.6
    goto speed_enda
speed_3a                ;Advanced Mode
    tank1_speed=0.5
    tank2_speed=0.6
    tank3_speed=0.7
    cannon1_speed=0.3
    cannon2_speed=0.4
    missile1_speed=0.7
    missile2_speed=0.8
    missile3_speed=0.9
    drone_speed=1.0
    goto speed_enda
speed_4a                ;Expert Mode
    tank1_speed=1.3
    tank2_speed=1.5
    tank3_speed=1.7
    cannon1_speed=0.4
    cannon2_speed=0.5
    missile1_speed=1.1
    missile2_speed=1.2
    missile3_speed=1.3
    drone_speed=1.3
speed_enda
    return

set_level_3
    if menu_option_skill=1 then goto speed_1b ; Easy 
    if menu_option_skill=2 then goto speed_2b ; Standard 
    if menu_option_skill=3 then goto speed_3b ; Advanced
    if menu_option_skill=4 then goto speed_4b ; Expert

speed_1b                ;Easy Mode
    tank1_speed=0.3
    tank2_speed=0.4
    tank3_speed=0.5
    cannon1_speed=0.2
    cannon2_speed=0.3
    missile1_speed=0.4
    missile2_speed=0.5
    missile3_speed=0.6
    drone_speed=0.0
    goto speed_endb
speed_2b                ;Standard Mode
    tank1_speed=0.4
    tank2_speed=0.5
    tank3_speed=0.6
    cannon1_speed=0.3
    cannon2_speed=0.4
    missile1_speed=0.5
    missile2_speed=0.6
    missile3_speed=0.7
    drone_speed=0.6
    goto speed_endb
speed_3b                ;Advanced Mode
    tank1_speed=0.5
    tank2_speed=0.6
    tank3_speed=0.7
    cannon1_speed=0.4
    cannon2_speed=0.5
    missile1_speed=0.7
    missile2_speed=0.8
    missile3_speed=0.9
    drone_speed=1.0
    goto speed_endb
speed_4b                ;Expert Mode
    tank1_speed=1.1
    tank2_speed=1.2
    tank3_speed=1.3
    cannon1_speed=0.5
    cannon2_speed=0.6
    missile1_speed=1.2
    missile2_speed=1.3
    missile3_speed=1.4
    drone_speed=1.3
speed_endb
    return

set_level_4
    if menu_option_skill=1 then goto speed_1c ; Easy 
    if menu_option_skill=2 then goto speed_2c ; Standard 
    if menu_option_skill=3 then goto speed_3c ; Advanced
    if menu_option_skill=4 then goto speed_4c ; Expert

speed_1c                ;Easy Mode
    tank1_speed=0.4
    tank2_speed=0.5
    tank3_speed=0.6
    cannon1_speed=0.2
    cannon2_speed=0.3
    missile1_speed=0.3
    missile2_speed=0.3
    missile3_speed=0.3
    drone_speed=0.0
    goto speed_endc
speed_2c                ;Standard Mode
    tank1_speed=0.6
    tank2_speed=0.7
    tank3_speed=0.8
    cannon1_speed=0.3
    cannon2_speed=0.4
    missile1_speed=0.5
    missile2_speed=0.6
    missile3_speed=0.4
    drone_speed=0.6
    goto speed_endc
speed_3c                ;Advanced Mode
    tank1_speed=0.7
    tank2_speed=0.8
    tank3_speed=1.0
    cannon1_speed=0.4
    cannon2_speed=0.5
    missile1_speed=1.0
    missile2_speed=1.1
    missile3_speed=1.2
    drone_speed=0.9
    goto speed_endc
speed_4c                ;Expert Mode
    tank1_speed=1.9
    tank2_speed=1.6
    tank3_speed=1.5
    cannon1_speed=0.5
    cannon2_speed=0.6
    missile1_speed=1.3
    missile2_speed=1.4
    missile3_speed=1.5
    drone_speed=1.1
speed_endc
    return

set_level_5
    if menu_option_skill=1 then goto speed_1d ; Easy 
    if menu_option_skill=2 then goto speed_2d ; Standard 
    if menu_option_skill=3 then goto speed_3d ; Advanced
    if menu_option_skill=4 then goto speed_4d ; Expert

speed_1d                ;Easy Mode
    tank1_speed=0.5
    tank2_speed=0.6
    tank3_speed=0.7
    cannon1_speed=0.2
    cannon2_speed=0.3
    missile1_speed=0.6
    missile2_speed=0.7
    missile3_speed=0.8
    drone_speed=0.1
    goto speed_endd
speed_2d                ;Standard Mode
    tank1_speed=0.6
    tank2_speed=0.7
    tank3_speed=0.8
    cannon1_speed=0.3
    cannon2_speed=0.4
    missile1_speed=0.7
    missile2_speed=0.8
    missile3_speed=0.9
    drone_speed=0.8
    goto speed_endd
speed_3d                ;Advanced Mode
    tank1_speed=0.9
    tank2_speed=1.0
    tank3_speed=0.9
    cannon1_speed=0.4
    cannon2_speed=0.5
    missile1_speed=0.8
    missile2_speed=0.9
    missile3_speed=1.0
    drone_speed=1.0
    goto speed_endd
speed_4d                ;Expert Mode
    tank1_speed=2.0
    tank2_speed=1.7
    tank3_speed=1.6
    cannon1_speed=0.5
    cannon2_speed=0.6
    missile1_speed=1.5
    missile2_speed=1.6
    missile3_speed=1.7
    drone_speed=1.3
speed_endd
    return

set_level_6
    if menu_option_skill=1 then goto speed_1e ; Easy 
    if menu_option_skill=2 then goto speed_2e ; Standard 
    if menu_option_skill=3 then goto speed_3e ; Advanced
    if menu_option_skill=4 then goto speed_4e ; Expert

speed_1e                ;Easy Mode
    tank1_speed=0.6
    tank2_speed=0.7
    tank3_speed=0.8
    cannon1_speed=0.3
    cannon2_speed=0.4
    missile1_speed=0.7
    missile2_speed=0.8
    missile3_speed=0.9
    drone_speed=0.2
    goto speed_ende
speed_2e                ;Standard Mode
    tank1_speed=0.7
    tank2_speed=0.8
    tank3_speed=0.9
    cannon1_speed=0.4
    cannon2_speed=0.5
    missile1_speed=0.7
    missile2_speed=0.9
    missile3_speed=0.8
    drone_speed=0.8
    goto speed_ende
speed_3e                ;Advanced Mode
    tank1_speed=0.9
    tank2_speed=1.0
    tank3_speed=1.1
    cannon1_speed=0.5
    cannon2_speed=0.6
    missile1_speed=1.1
    missile2_speed=1.2
    missile3_speed=1.3
    drone_speed=1.0
    goto speed_ende
speed_4e                ;Expert Mode
    tank1_speed=1.2
    tank2_speed=1.8
    tank3_speed=1.7
    cannon1_speed=0.6
    cannon2_speed=0.7
    missile1_speed=1.6
    missile2_speed=1.7
    missile3_speed=1.8
    drone_speed=1.2
speed_ende
    return

set_level_7
    if menu_option_skill=1 then goto speed_1f ; Easy 
    if menu_option_skill=2 then goto speed_2f ; Standard 
    if menu_option_skill=3 then goto speed_3f ; Advanced
    if menu_option_skill=4 then goto speed_4f ; Expert

speed_1f                ;Easy Mode
    tank1_speed=0.7
    tank2_speed=0.8
    tank3_speed=0.9
    cannon1_speed=0.3
    cannon2_speed=0.4
    missile1_speed=0.8
    missile2_speed=0.9
    missile3_speed=1.0
    drone_speed=0.3
    goto speed_endf
speed_2f                ;Standard Mode
    tank1_speed=0.9
    tank2_speed=1.0
    tank3_speed=1.1
    cannon1_speed=0.4
    cannon2_speed=0.5
    missile1_speed=0.9
    missile2_speed=1.0
    missile3_speed=1.1
    drone_speed=0.8
    goto speed_endf
speed_3f                ;Advanced Mode
    tank1_speed=0.9
    tank2_speed=1.1
    tank3_speed=1.0
    cannon1_speed=0.5
    cannon2_speed=0.6
    missile1_speed=1.1
    missile2_speed=1.2
    missile3_speed=1.3
    drone_speed=1.0
    goto speed_endf
speed_4f                ;Expert Mode
    tank1_speed=2.0
    tank2_speed=1.8
    tank3_speed=1.7
    cannon1_speed=0.6
    cannon2_speed=0.7
    missile1_speed=1.7
    missile2_speed=1.8
    missile3_speed=1.9
    drone_speed=1.2
speed_endf
    return

set_level_8
    if menu_option_skill=1 then goto speed_1g ; Easy 
    if menu_option_skill=2 then goto speed_2g ; Standard 
    if menu_option_skill=3 then goto speed_3g ; Advanced
    if menu_option_skill=4 then goto speed_4g ; Expert

speed_1g                ;Easy Mode
    tank1_speed=1.0
    tank2_speed=1.1
    tank3_speed=1.2
    cannon1_speed=0.3
    cannon2_speed=0.4
    missile1_speed=1.1
    missile2_speed=1.2
    missile3_speed=1.3
    drone_speed=0.3
    goto speed_endg
speed_2g                ;Standard Mode
    tank1_speed=1.1
    tank2_speed=1.2
    tank3_speed=1.3
    cannon1_speed=0.4
    cannon2_speed=0.5
    missile1_speed=1.2
    missile2_speed=1.3
    missile3_speed=1.4
    drone_speed=0.8
    goto speed_endg
speed_3g                ;Advanced Mode
    tank1_speed=1.2
    tank2_speed=1.3
    tank3_speed=1.4
    cannon1_speed=0.5
    cannon2_speed=0.6
    missile1_speed=1.5
    missile2_speed=1.6
    missile3_speed=1.7
    drone_speed=1.0
    goto speed_endg
speed_4g                ;Expert Mode
    tank1_speed=1.4
    tank2_speed=1.5
    tank3_speed=1.6
    cannon1_speed=0.6
    cannon2_speed=0.7
    missile1_speed=1.6
    missile2_speed=1.7
    missile3_speed=1.8
    drone_speed=1.3
speed_endg
    return

set_level_9
    if menu_option_skill=1 then goto speed_1h ; Easy 
    if menu_option_skill=2 then goto speed_2h ; Standard 
    if menu_option_skill=3 then goto speed_3h ; Advanced
    if menu_option_skill=4 then goto speed_4h ; Expert

speed_1h                ;Easy Mode
    tank1_speed=1.2
    tank2_speed=1.3
    tank3_speed=1.4
    cannon1_speed=0.4
    cannon2_speed=0.5
    missile1_speed=1.3
    missile2_speed=1.4
    missile3_speed=1.5
    drone_speed=0.4
    goto speed_endh
speed_2h                ;Standard Mode
    tank1_speed=1.3
    tank2_speed=1.4
    tank3_speed=1.5
    cannon1_speed=0.5
    cannon2_speed=0.6
    missile1_speed=1.4
    missile2_speed=1.5
    missile3_speed=1.6
    drone_speed=0.8
    goto speed_endh
speed_3h                ;Advanced Mode
    tank1_speed=1.4
    tank2_speed=1.5
    tank3_speed=1.6
    cannon1_speed=0.6
    cannon2_speed=0.7
    missile1_speed=1.5
    missile2_speed=1.6
    missile3_speed=1.7
    drone_speed=1.1
    goto speed_endh
speed_4h                ;Expert Mode
    tank1_speed=2.0
    tank2_speed=2.0
    tank3_speed=1.9
    cannon1_speed=0.7
    cannon2_speed=0.8
    missile1_speed=1.9
    missile2_speed=2.0
    missile3_speed=2.1
    drone_speed=1.3
speed_endh
    return

set_level_10
    if menu_option_skill=1 then goto speed_1i ; Easy 
    if menu_option_skill=2 then goto speed_2i ; Standard 
    if menu_option_skill=3 then goto speed_3i ; Advanced
    if menu_option_skill=4 then goto speed_4i ; Expert

speed_1i                ;Easy Mode
    tank1_speed=1.5
    tank2_speed=1.6
    tank3_speed=1.7
    cannon1_speed=0.5
    cannon2_speed=0.6
    missile1_speed=1.6
    missile2_speed=1.7
    missile3_speed=1.8
    drone_speed=0.4
    goto speed_endi
speed_2i                ;Standard Mode
    tank1_speed=1.6
    tank2_speed=1.7
    tank3_speed=1.8
    cannon1_speed=0.6
    cannon2_speed=0.7
    missile1_speed=1.7
    missile2_speed=1.8
    missile3_speed=1.9
    drone_speed=0.8
    goto speed_endi
speed_3i                ;Advanced Mode
    tank1_speed=1.3
    tank2_speed=1.4
    tank3_speed=1.5
    cannon1_speed=0.7
    cannon2_speed=0.8
    missile1_speed=1.9
    missile2_speed=2.0
    missile3_speed=2.1
    drone_speed=1.2
    goto speed_endi
speed_4i                ;Expert Mode
    tank1_speed=2.0
    tank2_speed=2.1
    tank3_speed=2.0
    cannon1_speed=0.9
    cannon2_speed=1.0
    missile1_speed=2.1
    missile2_speed=2.2
    missile3_speed=2.3
    drone_speed=1.3
speed_endi
    return

set_level_11
    if menu_option_skill=1 then goto speed_1j ; Easy 
    if menu_option_skill=2 then goto speed_2j ; Standard 
    if menu_option_skill=3 then goto speed_3j ; Advanced
    if menu_option_skill=4 then goto speed_4j ; Expert

speed_1j                ;Easy Mode
    tank1_speed=1.6
    tank2_speed=1.7
    tank3_speed=1.8
    cannon1_speed=0.7
    cannon2_speed=0.8
    missile1_speed=1.7
    missile2_speed=1.8
    missile3_speed=1.9
    drone_speed=0.5
    goto speed_endj
speed_2j                ;Standard Mode
    tank1_speed=1.7
    tank2_speed=1.8
    tank3_speed=1.9
    cannon2_speed=0.7
    cannon1_speed=0.8
    missile1_speed=1.9
    missile2_speed=2.0
    missile3_speed=2.1
    drone_speed=0.9
    goto speed_endj
speed_3j                ;Advanced Mode
    tank1_speed=1.9
    tank2_speed=2.0
    tank3_speed=2.1
    cannon1_speed=0.8
    cannon2_speed=0.9
    missile1_speed=2.0
    missile2_speed=2.1
    missile3_speed=2.2
    drone_speed=1.3
    goto speed_endj
speed_4j                ;Expert Mode
    tank1_speed=2.2
    tank2_speed=2.3
    tank3_speed=2.4
    cannon1_speed=0.9
    cannon2_speed=1.0
    missile1_speed=2.2
    missile2_speed=2.7
    missile3_speed=2.8
    drone_speed=1.4
speed_endj
    return

 bank 9
  
   newblock
    incgraphic gfx/ex2/boss5a.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss5b.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss5c.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss5d.png 160A 1 0 2 3

boss5_battle
    playsfx sfx_museboom_boss5
    savescreen
    ;──═◙ Set Palette Colors
     P0C1 = $F7 : P0C2 = $1C : P0C3 = $0F  ; City Defense Beam              
     P1C1 = $0F : P1C2 = $46 : P1C3 = $08  ; Drone: c1 rotors  c2 body  c3 middle
     P2C1 = $42 : P2C2 = $4A : P2C3 = $0C  ; Drone Laser  
     P3C1 = $38 : P3C2 = $36 : P3C3 = $32  ; Top Enemy Vehicle
     P4C1 = $08 : P4C2 = $0A : P4C3 = $0F  ; Top Line of Scrolling Background  |  C1:shadow  C2:bldg color  C3:window color
     P5C1 = $82 : P5C2 = $84 : P5C3 = $96  ; Middle Enemy Vehicle & Missile
     P6C1 = $42 : P6C2 = $44 : P6C3 = $46  ; Bottom Enemy Vehicle & Laser
    ;P7C1 = $02 : P7C2 = $04 : P7C3 = $06  ; level 1 city color
    ;P4C1 = $12 : P4C2 = $16 : P4C3 = $0A  ; level 2 city color
    ;P4C1 = $22 : P4C2 = $26 : P4C3 = $08  ; level 3 city color
    ;P4C1 = $32 : P4C2 = $36 : P4C3 = $0A  ; level 4 city color
    ;P4C1 = $62 : P4C2 = $66 : P4C3 = $08  ; level 5 city color
    ;P4C1 = $52 : P4C2 = $56 : P4C3 = $0A  ; level 6 city color
    ;P4C1 = $42 : P4C2 = $46 : P4C3 = $08  ; level 7 city color
    ;P4C1 = $72 : P4C2 = $76 : P4C3 = $0A  ; level 8 city color 
    ;P4C1 = $82 : P4C2 = $86 : P4C3 = $08  ; level 9 city color
    ;P4C1 = $A2 : P4C2 = $A6 : P4C3 = $0A  ; level 10 city color
    ;P4C1 = $C2 : P4C2 = $C6 : P4C3 = $0A  ; level 11 city color

    if levelLo=$02 then P4C1=$12:P4C2=$16:P4C3=$0A
    if levelLo=$03 then P4C1=$22:P4C2=$26:P4C3=$08
    if levelLo=$04 then P4C1=$32:P4C2=$36:P4C3=$0A
    if levelLo=$05 then P4C1=$62:P4C2=$66:P4C3=$08
    if levelLo=$06 then P4C1=$52:P4C2=$56:P4C3=$0A
    if levelLo=$07 then P4C1=$42:P4C2=$46:P4C3=$08
    if levelLo=$08 then P4C1=$72:P4C2=$76:P4C3=$0A
    if levelLo=$09 then P4C1=$82:P4C2=$86:P4C3=$08
    if levelLo=$10 then P4C1=$A2:P4C2=$A6:P4C3=$0A
    if levelLo>$10 then P4C1=$C2:P4C2=$C6:P4C3=$0A

    ;──═◙ Set Drone Health for this Boss Battle
    healthHi = $00 : healthMed = $00 : healthLo = $51

    ;──═◙ Set Boss Health for this battle
    bossHi = $00 : bossMed = $00 : bossLo = $60

    ;──═◙ Set Initial values for Boss Frame Counters
    boss_move_counter=0 :  boss_counter = 0

    ;──═◙ Set Initial Location for Boss
    boss5a_xpos = 200.0 : boss5a_ypos = 132.1
    boss5b_xpos = 200.0 : boss5b_ypos = 140.1
    boss5c_xpos = 200.0 : boss5c_ypos = 148.1
    boss5d_xpos = 200.0 : boss5d_ypos = 156.1

    drone_xpos=0:drone_ypos=22

    boss_vertical_flag=0
    boss_init_counter = 0

    direction = 0

    scorea=scorea+100

boss5_battle_transition

    BACKGRND=$00

    if drone_xpos<70 then drone_xpos=drone_xpos+1

    ;──═◙ Increment frame and animation counters
    frame_counter=frame_counter+1
    if frame_counter>2 then frame_counter=0
    if frame_counter=2 then animate1=animate1+1
    if animate1>3 then animate1=0 

    ;──═◙ Move boss in from the right side of the screen
    boss5a_xpos=boss5a_xpos-0.8:boss5b_xpos=boss5b_xpos-0.8:boss5c_xpos=boss5c_xpos-0.8:boss5d_xpos=boss5d_xpos-0.8
    rocket1_xpos=rocket1_xpos-0.8:rocket2_xpos=rocket2_xpos-0.8:rocket3_xpos=rocket3_xpos-0.8:rocket4_xpos=rocket4_xpos-0.8

    restorescreen

    plotchars 'boss health:' 3 0 22
    plotchars 'drone health:' 3 84 22
    plotvalue    scoredigits      3     scoref       6       50    22    ; Boss Health
    plotvalue    scoredigits      3     scored       6       137   22    ; Drone Health  
    plotsprite boss5a 5 boss5a_xpos boss5a_ypos
    plotsprite boss5b 5 boss5b_xpos boss5b_ypos
    plotsprite boss5c 5 boss5c_xpos boss5c_ypos
    plotsprite boss5d 5 boss5d_xpos boss5d_ypos
    plotsprite drone1 1 drone_xpos drone_ypos animate1 
 
    drawscreen

    if boss5a_xpos>20 then goto boss5_battle_transition

boss5_battle_init

    ;──═◙ Set Initial Location for Boss
    boss5a_xpos = 20.0 : boss5a_ypos = 132.1
    boss5b_xpos = 20.0 : boss5b_ypos = 140.1
    boss5c_xpos = 20.0 : boss5c_ypos = 148.1
    boss5d_xpos = 20.0 : boss5d_ypos = 156.1

    ;──═◙ Set Boss Movement Flags
    boss_move_flag1=0  :  boss_move_flag2=0  :  boss_move_flag3=0   :  boss_move_flag4=0 

    ;──═◙ Set Initial Location for Boss Rockets
    rocket1_xpos = 42.0 : rocket1_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket2_xpos = 54.0 : rocket2_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket3_xpos = 77.0 : rocket3_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket4_xpos = 89.0 : rocket4_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos

    fire_debounce_1=0

    boss_vertical_flag=1

boss5_battle_loop

    boss_counter=boss_counter+1
    if boss_counter>254 then boss_counter=0
    if boss_init_counter<30 then boss_init_counter=boss_init_counter+1
    if boss_init_counter=30 then boss_init_counter=30
    if boss_init_counter<30 then rocket1_xpos_save=boss5a_xpos+12 : rocket2_xpos_save=boss5a_xpos+34 : rocket3_xpos_save=boss5a_xpos+57 : rocket4_xpos_save=boss5a_xpos+69

    
    BACKGRND=$00

    ;──═◙ Increment frame and animation counters
    frame_counter=frame_counter+1
    if frame_counter>2 then frame_counter=0
    if frame_counter=2 then animate1=animate1+1
    if animate1>3 then animate1=0 
    animate2=animate2+1
    if animate2>2 then animate2=0

    ;──═◙ Check for Game Over if drone health reaches zero
    if healthLo=$00 && healthMed = $01 then goto skiphealthcheck_boss5
    if healthLo<$01 || healthMed>$01 then healthLo=$00:healthMed=$00:player_flag=1:return; if health falls to zero, you are dead - add animation, explosion, game over, etc.
skiphealthcheck_boss5

    ;──═◙ Move Boss Left and Right
    if boss_counter>100 && boss_counter<180 then goto skip_boss5_move
    if boss5a_xpos>96 then boss_move_counter=1
    if boss5a_xpos<2 then boss_move_counter=0
    if boss_move_counter=0 then gosub boss5_move_right
    if boss_move_counter=1 then gosub boss5_move_left
skip_boss5_move

    if boss5a_ypos>134 then boss_vertical_flag=1    ;too far down, set vertical flag to move up
    if boss5a_ypos<100 then boss_vertical_flag=2    ;too far up, set vertical flag to move down

boss5_up_only
    if boss_counter>80 && boss_counter<160 && boss_vertical_flag=1 then gosub boss5_move_up

boss5_down_only
    if boss_counter>160 && boss_counter<240 && boss_vertical_flag=2 then gosub boss5_move_down

    if rocket1_ypos=136 then gosub sfx_plainlaser

    ;──═◙  Boss Fire cannons 
    if rocket1_ypos<8 then rocket1_ypos=130.0:rocket1_xpos_save=rocket1_xpos:rocket2_xpos_save=rocket2_xpos:rocket3_xpos_save=rocket3_xpos:rocket4_xpos_save=rocket4_xpos:gosub sfx_plainlaser
    rocket1_ypos=rocket1_ypos-1.8
    if rocket2_ypos<8 then rocket2_ypos=130.0:gosub sfx_plainlaser
    rocket2_ypos=rocket2_ypos-1.8
    if rocket3_ypos<8 then rocket3_ypos=130.0:gosub sfx_plainlaser
    rocket3_ypos=rocket3_ypos-1.8
    if rocket4_ypos<8 then rocket4_ypos=130.0:gosub sfx_plainlaser
    rocket4_ypos=rocket4_ypos-1.8


    ;──═◙ Check for Game Reset
    if switchreset then reboot

    ;──═◙ Debounce Fire Buttons
    if joy0fire1 then fire_debounce_1=1  ; Left Button
    if !joy0fire1 && fire_debounce_1=1 then fire_debounce_1=2
 
    ;──═◙ Move the drone on the screen
    if joy0right then drone_xpos=drone_xpos+1+drone_speed
    if joy0left then drone_xpos=drone_xpos-1-drone_speed
    if joy0up then drone_ypos=drone_ypos-1-drone_speed
    if joy0down then drone_ypos=drone_ypos+1+drone_speed

    ;──═◙ Keep the drone on the screen
    if drone_ypos>90 then drone_ypos=90
    if drone_ypos<8 then drone_ypos=8
    if drone_xpos<8 then drone_xpos=8
    if drone_xpos>128 then drone_xpos=128


    if laser_counter>10 then laser_fire_flag=1 
    if fire_debounce_1=1 then laser_counter=laser_counter+1 else laser_fire_flag=0:laser_counter=0

    ;──═◙ Detect Boss Hit
    if crosshair_x_offset_1=200 then goto skip_boss5_coll 
    asm
    QBOXCOLLISIONCHECK boss5b_xpos,boss5b_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1
    asm
    QBOXCOLLISIONCHECK boss5c_xpos,boss5c_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1
    asm
    QBOXCOLLISIONCHECK boss5d_xpos,boss5d_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1
skip_boss5_coll

    ;──═◙ Detect Drone Hit
    asm
    QBOXCOLLISIONCHECK rocket1_xpos,rocket1_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone
    asm
    QBOXCOLLISIONCHECK rocket2_xpos,rocket2_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone
    asm
    QBOXCOLLISIONCHECK rocket3_xpos,rocket3_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone
    asm
    QBOXCOLLISIONCHECK rocket4_xpos,rocket4_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone

   ; this sets the defeated flag for Boss 5
   if bossLo<$50 then gosub switch_screen bank2:healthHi = $00 : healthMed = $05 : healthLo = $00:transition_flag=0:boss5_defeated_flag=1:levelLo=$06:return

   restorescreen

    plotchars 'boss health:' 3 0 22
    plotchars 'drone health:' 3 84 22
    plotvalue    scoredigits      3     scoref       6       50    22    ; Boss Health
    plotvalue    scoredigits      3     scored       6       137   22    ; Drone Health  
    plotsprite boss5a 5 boss5a_xpos boss5a_ypos
    plotsprite boss5b 5 boss5b_xpos boss5b_ypos
    plotsprite boss5c 5 boss5c_xpos boss5c_ypos
    plotsprite boss5d 5 boss5d_xpos boss5d_ypos

    plotsprite bomb_large_up 6 rocket1_xpos_save rocket1_ypos
    plotsprite bomb_large_up 6 rocket2_xpos_save rocket2_ypos
    plotsprite bomb_large_up 6 rocket3_xpos_save rocket3_ypos
    plotsprite bomb_large_up 6 rocket4_xpos_save rocket4_ypos

    if joy0left then plotsprite      drone1_left     1      drone_xpos      drone_ypos      animate1        : goto skip_next_boss5
    if joy0right then plotsprite     drone1_right    1      drone_xpos      drone_ypos      animate1        : goto skip_next_boss5
    plotsprite      drone1                      1      drone_xpos      drone_ypos      animate1        ; Drone
skip_next_boss5

    ;──═◙ Plot the laser when you press the fire button
    ;if joy0left || joy0right then goto skiplaserfire_boss5  ; You can only fire when you're not moving
    ;if joy0up || joy0down then goto skiplaserfire_boss5     ; ...
    if laser_fire_flag=1 then goto skiplaserfire_boss5
    if drone_ypos<22 then goto skiplaserfire_boss5 ; If you are too high up you can't fire
    if fire_debounce_1=1 then gosub sfx_pulsecannon bank2:gosub draw_laser bank2
    if fire_debounce_1<>1 then crosshair_x_offset_1=200
skiplaserfire_boss5

   drawscreen
   
  goto boss5_battle_loop
  
boss5_move_up

    boss5a_ypos=boss5a_ypos-0.6:boss5b_ypos=boss5b_ypos-0.6:boss5c_ypos=boss5c_ypos-0.6:boss5d_ypos=boss5d_ypos-0.6
    rocket1_ypos=rocket1_ypos-0.6:rocket2_ypos=rocket1_ypos-0.6:rocket3_ypos=rocket1_ypos-0.6:rocket4_ypos=rocket1_ypos-0.6

  return

boss5_move_down

    boss5a_ypos=boss5a_ypos+0.6:boss5b_ypos=boss5b_ypos+0.6:boss5c_ypos=boss5c_ypos+0.6:boss5d_ypos=boss5d_ypos+0.6
    rocket1_ypos=rocket1_ypos+0.6:rocket2_ypos=rocket1_ypos+0.6:rocket3_ypos=rocket1_ypos+0.6:rocket4_ypos=rocket1_ypos+0.6

  return

boss5_move_right

    boss5a_xpos=boss5a_xpos+1.6:boss5b_xpos=boss5b_xpos+1.6:boss5c_xpos=boss5c_xpos+1.6:boss5d_xpos=boss5d_xpos+1.6
    rocket1_xpos=rocket1_xpos+0.8:rocket2_xpos=rocket2_xpos+0.8:rocket3_xpos=rocket3_xpos+0.8:rocket4_xpos=rocket4_xpos+0.8
    boss_vertical_flag=1

  return

boss5_move_left

    boss5a_xpos=boss5a_xpos-1.6:boss5b_xpos=boss5b_xpos-1.6:boss5c_xpos=boss5c_xpos-1.6:boss5d_xpos=boss5d_xpos-1.6
    rocket1_xpos=rocket1_xpos-0.8:rocket2_xpos=rocket2_xpos-0.8:rocket3_xpos=rocket3_xpos-0.8:rocket4_xpos=rocket4_xpos-0.8
    boss_vertical_flag=2

  return

 ; ##################################################################################################################################################################3
 
    data sfx_museboom_boss5
    $10,$10,$00 ; version, priority, frames per chunk
    $15,$04,$0b ; first chunk of freq,channel,volume
    $12,$0c,$0b
    $1e,$04,$0d
    $16,$04,$0b
    $04,$06,$0c
    $1c,$0c,$0d
    $0a,$0c,$0b
    $15,$04,$0c
    $1a,$0c,$0a
    $0c,$0c,$0d
    $13,$0c,$0a
    $15,$04,$0a
    $1a,$0c,$0a
    $05,$06,$09
    $0b,$0c,$09
    $16,$04,$0d
    $13,$0c,$08
    $13,$0c,$0d
    $0b,$0c,$0d
    $06,$06,$0b
    $1d,$0c,$09
    $10,$0c,$0b
    $1e,$04,$0c
    $05,$06,$0a
    $05,$06,$0b
    $0b,$0c,$0a
    $1c,$04,$0d
    $05,$06,$0b
    $18,$0c,$0c
    $0c,$0c,$0c
    $1b,$07,$0d
    $15,$0c,$0d
    $14,$0c,$0b
    $0b,$0c,$0d
    $1e,$0c,$0b
    $1b,$0c,$0c
    $0b,$0c,$0c
    $0d,$0c,$0d
    $1a,$0c,$09
    $15,$0c,$09
    $0a,$0c,$0a
    $06,$06,$07
    $17,$0c,$09
    $10,$0c,$08
    $1b,$0c,$07
    $06,$06,$06
    $17,$0c,$07
    $0c,$0c,$07
    $06,$06,$07
    $0e,$0f,$07
    $14,$0c,$07
    $10,$0c,$04
    $1a,$0c,$05
    $12,$0c,$04
    $1c,$0c,$03
    $14,$0c,$03
    $1e,$0c,$03
    $1d,$07,$02
    $08,$06,$01
    $16,$0c,$01
    $15,$0c,$01
    $00,$00,$00
end


 bank 10
  
   newblock
    incgraphic gfx/ex2/boss6a.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss6b.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss6c.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss6d.png 160A 1 0 2 3

boss6_battle
    playsfx sfx_museboom_boss6
    savescreen
    ;──═◙ Set Palette Colors
     P0C1 = $F7 : P0C2 = $1C : P0C3 = $0F  ; City Defense Beam              
     P1C1 = $0F : P1C2 = $46 : P1C3 = $08  ; Drone: c1 rotors  c2 body  c3 middle
     P2C1 = $42 : P2C2 = $4A : P2C3 = $0C  ; Drone Laser  
     P3C1 = $38 : P3C2 = $36 : P3C3 = $32  ; Top Enemy Vehicle
     P4C1 = $08 : P4C2 = $0A : P4C3 = $0F  ; Top Line of Scrolling Background  |  C1:shadow  C2:bldg color  C3:window color
     P5C1 = $82 : P5C2 = $84 : P5C3 = $96  ; Middle Enemy Vehicle & Missile
     P6C1 = $42 : P6C2 = $44 : P6C3 = $46  ; Bottom Enemy Vehicle & Laser
    ;P7C1 = $02 : P7C2 = $04 : P7C3 = $06  ; level 1 city color
    ;P4C1 = $12 : P4C2 = $16 : P4C3 = $0A  ; level 2 city color
    ;P4C1 = $22 : P4C2 = $26 : P4C3 = $08  ; level 3 city color
    ;P4C1 = $32 : P4C2 = $36 : P4C3 = $0A  ; level 4 city color
    ;P4C1 = $62 : P4C2 = $66 : P4C3 = $08  ; level 5 city color
    ;P4C1 = $52 : P4C2 = $56 : P4C3 = $0A  ; level 6 city color
    ;P4C1 = $42 : P4C2 = $46 : P4C3 = $08  ; level 7 city color
    ;P4C1 = $72 : P4C2 = $76 : P4C3 = $0A  ; level 8 city color 
    ;P4C1 = $82 : P4C2 = $86 : P4C3 = $08  ; level 9 city color
    ;P4C1 = $A2 : P4C2 = $A6 : P4C3 = $0A  ; level 10 city color
    ;P4C1 = $C2 : P4C2 = $C6 : P4C3 = $0A  ; level 11 city color

    if levelLo=$02 then P4C1=$12:P4C2=$16:P4C3=$0A
    if levelLo=$03 then P4C1=$22:P4C2=$26:P4C3=$08
    if levelLo=$04 then P4C1=$32:P4C2=$36:P4C3=$0A
    if levelLo=$05 then P4C1=$62:P4C2=$66:P4C3=$08
    if levelLo=$06 then P4C1=$52:P4C2=$56:P4C3=$0A
    if levelLo=$07 then P4C1=$42:P4C2=$46:P4C3=$08
    if levelLo=$08 then P4C1=$72:P4C2=$76:P4C3=$0A
    if levelLo=$09 then P4C1=$82:P4C2=$86:P4C3=$08
    if levelLo=$10 then P4C1=$A2:P4C2=$A6:P4C3=$0A
    if levelLo>$10 then P4C1=$C2:P4C2=$C6:P4C3=$0A

    ;──═◙ Set Drone Health for this Boss Battle
    healthHi = $00 : healthMed = $00 : healthLo = $51

    ;──═◙ Set Boss Health for this battle
    bossHi = $00 : bossMed = $00 : bossLo = $60

    ;──═◙ Set Initial values for Boss Frame Counters
    boss_move_counter=0 :  boss_counter = 0

    ;──═◙ Set Initial Location for Boss
    boss6a_xpos = 200.0 : boss6a_ypos = 132.1
    boss6b_xpos = 200.0 : boss6b_ypos = 140.1
    boss6c_xpos = 200.0 : boss6c_ypos = 148.1
    boss6d_xpos = 200.0 : boss6d_ypos = 156.1

    drone_xpos=0:drone_ypos=22

    boss_vertical_flag=0
    boss_init_counter = 0

    direction = 0

    scorea=scorea+100 ; This adds 100, password screen otherwise dumps you in with 100 too few points

boss6_battle_transition

    BACKGRND=$00

    if drone_xpos<70 then drone_xpos=drone_xpos+1

    ;──═◙ Increment frame and animation counters
    frame_counter=frame_counter+1
    if frame_counter>2 then frame_counter=0
    if frame_counter=2 then animate1=animate1+1
    if animate1>3 then animate1=0 

    ;──═◙ Move boss in from the right side of the screen
    boss6a_xpos=boss6a_xpos-0.8:boss6b_xpos=boss6b_xpos-0.8:boss6c_xpos=boss6c_xpos-0.8:boss6d_xpos=boss6d_xpos-0.8
    rocket1_xpos=rocket1_xpos-0.8:rocket2_xpos=rocket2_xpos-0.8:rocket3_xpos=rocket3_xpos-0.8:rocket4_xpos=rocket4_xpos-0.8

    restorescreen

    plotchars 'boss health:' 3 0 22
    plotchars 'drone health:' 3 84 22
    plotvalue    scoredigits      3     scoref       6       50    22    ; Boss Health
    plotvalue    scoredigits      3     scored       6       137   22    ; Drone Health  
    plotsprite boss6a 5 boss6a_xpos boss6a_ypos
    plotsprite boss6b 5 boss6b_xpos boss6b_ypos
    plotsprite boss6c 5 boss6c_xpos boss6c_ypos
    plotsprite boss6d 5 boss6d_xpos boss6d_ypos
    plotsprite drone1 1 drone_xpos drone_ypos animate1 
 
    drawscreen

    if boss6a_xpos>20 then goto boss6_battle_transition

boss6_battle_init

    ;──═◙ Set Initial Location for Boss
    boss6a_xpos = 20.0 : boss6a_ypos = 132.1
    boss6b_xpos = 20.0 : boss6b_ypos = 140.1
    boss6c_xpos = 20.0 : boss6c_ypos = 148.1
    boss6d_xpos = 20.0 : boss6d_ypos = 156.1

    ;──═◙ Set Boss Movement Flags
    boss_move_flag1=0  :  boss_move_flag2=0  :  boss_move_flag3=0   :  boss_move_flag4=0 

    ;──═◙ Set Initial Location for Boss Rockets
    rocket1_xpos = 42.0 : rocket1_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket2_xpos = 54.0 : rocket2_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket3_xpos = 77.0 : rocket3_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket4_xpos = 89.0 : rocket4_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos

    fire_debounce_1=0

    boss_vertical_flag=1

boss6_battle_loop

    boss_counter=boss_counter+1
    if boss_counter>254 then boss_counter=0
    if boss_init_counter<30 then boss_init_counter=boss_init_counter+1
    if boss_init_counter=30 then boss_init_counter=30
    if boss_init_counter<30 then rocket1_xpos_save=boss6a_xpos+12 : rocket2_xpos_save=boss6a_xpos+34 : rocket3_xpos_save=boss6a_xpos+57 : rocket4_xpos_save=boss6a_xpos+69

    
    BACKGRND=$00

    ;──═◙ Increment frame and animation counters
    frame_counter=frame_counter+1
    if frame_counter>2 then frame_counter=0
    if frame_counter=2 then animate1=animate1+1
    if animate1>3 then animate1=0 
    animate2=animate2+1
    if animate2>2 then animate2=0

    ;──═◙ Check for Game Over if drone health reaches zero
    if healthLo=$00 && healthMed = $01 then goto skiphealthcheck_boss6
    if healthLo<$01 || healthMed>$01 then healthLo=$00:healthMed=$00:player_flag=1:return; if health falls to zero, you are dead - add animation, explosion, game over, etc.
skiphealthcheck_boss6

    ;──═◙ Move Boss Left and Right
    if boss_counter>100 && boss_counter<180 then goto skip_boss6_move
    if boss6a_xpos>96 then boss_move_counter=1
    if boss6a_xpos<2 then boss_move_counter=0
    if boss_move_counter=0 then gosub boss6_move_right
    if boss_move_counter=1 then gosub boss6_move_left
skip_boss6_move

    if boss6a_ypos>134 then boss_vertical_flag=1    ;too far down, set vertical flag to move up
    if boss6a_ypos<100 then boss_vertical_flag=2    ;too far up, set vertical flag to move down

boss6_up_only
    if boss_counter>80 && boss_counter<160 && boss_vertical_flag=1 then gosub boss6_move_up

boss6_down_only
    if boss_counter>160 && boss_counter<240 && boss_vertical_flag=2 then gosub boss6_move_down

    if rocket1_ypos=136 then gosub sfx_plainlaser

    ;──═◙  Boss Fire cannons 
    if rocket1_ypos<8 then rocket1_ypos=130.0:rocket1_xpos_save=rocket1_xpos:rocket2_xpos_save=rocket2_xpos:rocket3_xpos_save=rocket3_xpos:rocket4_xpos_save=rocket4_xpos:gosub sfx_plainlaser
    rocket1_ypos=rocket1_ypos-1.8
    if rocket2_ypos<8 then rocket2_ypos=130.0:gosub sfx_plainlaser
    rocket2_ypos=rocket2_ypos-1.8
    if rocket3_ypos<8 then rocket3_ypos=130.0:gosub sfx_plainlaser
    rocket3_ypos=rocket3_ypos-1.8
    if rocket4_ypos<8 then rocket4_ypos=130.0:gosub sfx_plainlaser
    rocket4_ypos=rocket4_ypos-1.8


    ;──═◙ Check for Game Reset
    if switchreset then reboot

    ;──═◙ Debounce Fire Buttons
    if joy0fire1 then fire_debounce_1=1  ; Left Button
    if !joy0fire1 && fire_debounce_1=1 then fire_debounce_1=2
 
    ;──═◙ Move the drone on the screen
    if joy0right then drone_xpos=drone_xpos+1+drone_speed
    if joy0left then drone_xpos=drone_xpos-1-drone_speed
    if joy0up then drone_ypos=drone_ypos-1-drone_speed
    if joy0down then drone_ypos=drone_ypos+1+drone_speed

    ;──═◙ Keep the drone on the screen
    if drone_ypos>90 then drone_ypos=90
    if drone_ypos<8 then drone_ypos=8
    if drone_xpos<8 then drone_xpos=8
    if drone_xpos>128 then drone_xpos=128


    if laser_counter>10 then laser_fire_flag=1 
    if fire_debounce_1=1 then laser_counter=laser_counter+1 else laser_fire_flag=0:laser_counter=0

    ;──═◙ Detect Boss Hit
    if crosshair_x_offset_1=200 then goto skip_boss6_coll 
    asm
    QBOXCOLLISIONCHECK boss6b_xpos,boss6b_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1
    asm
    QBOXCOLLISIONCHECK boss6c_xpos,boss6c_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1
    asm
    QBOXCOLLISIONCHECK boss6d_xpos,boss6d_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1
skip_boss6_coll

    ;──═◙ Detect Drone Hit
    asm
    QBOXCOLLISIONCHECK rocket1_xpos,rocket1_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone
    asm
    QBOXCOLLISIONCHECK rocket2_xpos,rocket2_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone
    asm
    QBOXCOLLISIONCHECK rocket3_xpos,rocket3_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone
    asm
    QBOXCOLLISIONCHECK rocket4_xpos,rocket4_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone

   ; this sets the defeated flag for Boss 6
   if bossLo<$50 then gosub switch_screen bank2:healthHi = $00 : healthMed = $05 : healthLo = $00:transition_flag=0:boss6_defeated_flag=1:levelLo=$07:return

   restorescreen

    plotchars 'boss health:' 3 0 22
    plotchars 'drone health:' 3 84 22
    plotvalue    scoredigits      3     scoref       6       50    22    ; Boss Health
    plotvalue    scoredigits      3     scored       6       137   22    ; Drone Health  
    plotsprite boss6a 5 boss6a_xpos boss6a_ypos
    plotsprite boss6b 5 boss6b_xpos boss6b_ypos
    plotsprite boss6c 5 boss6c_xpos boss6c_ypos
    plotsprite boss6d 5 boss6d_xpos boss6d_ypos

    plotsprite bomb_large_up 6 rocket1_xpos_save rocket1_ypos
    plotsprite bomb_large_up 6 rocket2_xpos_save rocket2_ypos
    plotsprite bomb_large_up 6 rocket3_xpos_save rocket3_ypos
    plotsprite bomb_large_up 6 rocket4_xpos_save rocket4_ypos

    if joy0left then plotsprite      drone1_left     1      drone_xpos      drone_ypos      animate1        : goto skip_next_boss6
    if joy0right then plotsprite     drone1_right    1      drone_xpos      drone_ypos      animate1        : goto skip_next_boss6
    plotsprite      drone1                      1      drone_xpos      drone_ypos      animate1        ; Drone
skip_next_boss6

    ;──═◙ Plot the laser when you press the fire button
    ;if joy0left || joy0right then goto skiplaserfire_boss6  ; You can only fire when you're not moving
    ;if joy0up || joy0down then goto skiplaserfire_boss6     ; ...
    if laser_fire_flag=1 then goto skiplaserfire_boss6
    if drone_ypos<22 then goto skiplaserfire_boss6 ; If you are too high up you can't fire
    if fire_debounce_1=1 then gosub sfx_pulsecannon bank2:gosub draw_laser bank2
    if fire_debounce_1<>1 then crosshair_x_offset_1=200
skiplaserfire_boss6

   drawscreen
   
  goto boss6_battle_loop
  
boss6_move_up

    boss6a_ypos=boss6a_ypos-0.6:boss6b_ypos=boss6b_ypos-0.6:boss6c_ypos=boss6c_ypos-0.6:boss6d_ypos=boss6d_ypos-0.6
    rocket1_ypos=rocket1_ypos-0.6:rocket2_ypos=rocket1_ypos-0.6:rocket3_ypos=rocket1_ypos-0.6:rocket4_ypos=rocket1_ypos-0.6

  return

boss6_move_down

    boss6a_ypos=boss6a_ypos+0.6:boss6b_ypos=boss6b_ypos+0.6:boss6c_ypos=boss6c_ypos+0.6:boss6d_ypos=boss6d_ypos+0.6
    rocket1_ypos=rocket1_ypos+0.6:rocket2_ypos=rocket1_ypos+0.6:rocket3_ypos=rocket1_ypos+0.6:rocket4_ypos=rocket1_ypos+0.6

  return

boss6_move_right

    boss6a_xpos=boss6a_xpos+1.6:boss6b_xpos=boss6b_xpos+1.6:boss6c_xpos=boss6c_xpos+1.6:boss6d_xpos=boss6d_xpos+1.6
    rocket1_xpos=rocket1_xpos+0.8:rocket2_xpos=rocket2_xpos+0.8:rocket3_xpos=rocket3_xpos+0.8:rocket4_xpos=rocket4_xpos+0.8
    boss_vertical_flag=1

  return

boss6_move_left

    boss6a_xpos=boss6a_xpos-1.6:boss6b_xpos=boss6b_xpos-1.6:boss6c_xpos=boss6c_xpos-1.6:boss6d_xpos=boss6d_xpos-1.6
    rocket1_xpos=rocket1_xpos-0.8:rocket2_xpos=rocket2_xpos-0.8:rocket3_xpos=rocket3_xpos-0.8:rocket4_xpos=rocket4_xpos-0.8
    boss_vertical_flag=2

  return

 ; ##################################################################################################################################################################3
 
    data sfx_museboom_boss6
    $10,$10,$00 ; version, priority, frames per chunk
    $15,$04,$0b ; first chunk of freq,channel,volume
    $12,$0c,$0b
    $1e,$04,$0d
    $16,$04,$0b
    $04,$06,$0c
    $1c,$0c,$0d
    $0a,$0c,$0b
    $15,$04,$0c
    $1a,$0c,$0a
    $0c,$0c,$0d
    $13,$0c,$0a
    $15,$04,$0a
    $1a,$0c,$0a
    $05,$06,$09
    $0b,$0c,$09
    $16,$04,$0d
    $13,$0c,$08
    $13,$0c,$0d
    $0b,$0c,$0d
    $06,$06,$0b
    $1d,$0c,$09
    $10,$0c,$0b
    $1e,$04,$0c
    $05,$06,$0a
    $05,$06,$0b
    $0b,$0c,$0a
    $1c,$04,$0d
    $05,$06,$0b
    $18,$0c,$0c
    $0c,$0c,$0c
    $1b,$07,$0d
    $15,$0c,$0d
    $14,$0c,$0b
    $0b,$0c,$0d
    $1e,$0c,$0b
    $1b,$0c,$0c
    $0b,$0c,$0c
    $0d,$0c,$0d
    $1a,$0c,$09
    $15,$0c,$09
    $0a,$0c,$0a
    $06,$06,$07
    $17,$0c,$09
    $10,$0c,$08
    $1b,$0c,$07
    $06,$06,$06
    $17,$0c,$07
    $0c,$0c,$07
    $06,$06,$07
    $0e,$0f,$07
    $14,$0c,$07
    $10,$0c,$04
    $1a,$0c,$05
    $12,$0c,$04
    $1c,$0c,$03
    $14,$0c,$03
    $1e,$0c,$03
    $1d,$07,$02
    $08,$06,$01
    $16,$0c,$01
    $15,$0c,$01
    $00,$00,$00
end


 bank 11
  
   newblock
    incgraphic gfx/ex2/boss7a.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss7b.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss7c.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss7d.png 160A 1 0 2 3

boss7_battle
    playsfx sfx_museboom_boss7
    savescreen
    ;──═◙ Set Palette Colors
     P0C1 = $F7 : P0C2 = $1C : P0C3 = $0F  ; City Defense Beam              
     P1C1 = $0F : P1C2 = $46 : P1C3 = $08  ; Drone: c1 rotors  c2 body  c3 middle
     P2C1 = $42 : P2C2 = $4A : P2C3 = $0C  ; Drone Laser  
     P3C1 = $38 : P3C2 = $36 : P3C3 = $32  ; Top Enemy Vehicle
     P4C1 = $08 : P4C2 = $0A : P4C3 = $0F  ; Top Line of Scrolling Background  |  C1:shadow  C2:bldg color  C3:window color
     P5C1 = $82 : P5C2 = $84 : P5C3 = $96  ; Middle Enemy Vehicle & Missile
     P6C1 = $42 : P6C2 = $44 : P6C3 = $46  ; Bottom Enemy Vehicle & Laser
    ;P7C1 = $02 : P7C2 = $04 : P7C3 = $06  ; level 1 city color
    ;P4C1 = $12 : P4C2 = $16 : P4C3 = $0A  ; level 2 city color
    ;P4C1 = $22 : P4C2 = $26 : P4C3 = $08  ; level 3 city color
    ;P4C1 = $32 : P4C2 = $36 : P4C3 = $0A  ; level 4 city color
    ;P4C1 = $62 : P4C2 = $66 : P4C3 = $08  ; level 5 city color
    ;P4C1 = $52 : P4C2 = $56 : P4C3 = $0A  ; level 6 city color
    ;P4C1 = $42 : P4C2 = $46 : P4C3 = $08  ; level 7 city color
    ;P4C1 = $72 : P4C2 = $76 : P4C3 = $0A  ; level 8 city color 
    ;P4C1 = $82 : P4C2 = $86 : P4C3 = $08  ; level 9 city color
    ;P4C1 = $A2 : P4C2 = $A6 : P4C3 = $0A  ; level 10 city color
    ;P4C1 = $C2 : P4C2 = $C6 : P4C3 = $0A  ; level 11 city color

    if levelLo=$02 then P4C1=$12:P4C2=$16:P4C3=$0A
    if levelLo=$03 then P4C1=$22:P4C2=$26:P4C3=$08
    if levelLo=$04 then P4C1=$32:P4C2=$36:P4C3=$0A
    if levelLo=$05 then P4C1=$62:P4C2=$66:P4C3=$08
    if levelLo=$06 then P4C1=$52:P4C2=$56:P4C3=$0A
    if levelLo=$07 then P4C1=$42:P4C2=$46:P4C3=$08
    if levelLo=$08 then P4C1=$72:P4C2=$76:P4C3=$0A
    if levelLo=$09 then P4C1=$82:P4C2=$86:P4C3=$08
    if levelLo=$10 then P4C1=$A2:P4C2=$A6:P4C3=$0A
    if levelLo>$10 then P4C1=$C2:P4C2=$C6:P4C3=$0A

    ;──═◙ Set Drone Health for this Boss Battle
    healthHi = $00 : healthMed = $00 : healthLo = $51

    ;──═◙ Set Boss Health for this battle
    bossHi = $00 : bossMed = $00 : bossLo = $60

    ;──═◙ Set Initial values for Boss Frame Counters
    boss_move_counter=0 :  boss_counter = 0

    ;──═◙ Set Initial Location for Boss
    boss7a_xpos = 200.0 : boss7a_ypos = 132.1
    boss7b_xpos = 200.0 : boss7b_ypos = 140.1
    boss7c_xpos = 200.0 : boss7c_ypos = 148.1
    boss7d_xpos = 200.0 : boss7d_ypos = 156.1

    drone_xpos=0:drone_ypos=22

    boss_vertical_flag=0
    boss_init_counter = 0

    direction = 0

    scorea=scorea+100

boss7_battle_transition

    BACKGRND=$00

    if drone_xpos<70 then drone_xpos=drone_xpos+1

    ;──═◙ Increment frame and animation counters
    frame_counter=frame_counter+1
    if frame_counter>2 then frame_counter=0
    if frame_counter=2 then animate1=animate1+1
    if animate1>3 then animate1=0 

    ;──═◙ Move boss in from the right side of the screen
    boss7a_xpos=boss7a_xpos-0.8:boss7b_xpos=boss7b_xpos-0.8:boss7c_xpos=boss7c_xpos-0.8:boss7d_xpos=boss7d_xpos-0.8
    rocket1_xpos=rocket1_xpos-0.8:rocket2_xpos=rocket2_xpos-0.8:rocket3_xpos=rocket3_xpos-0.8:rocket4_xpos=rocket4_xpos-0.8

    restorescreen

    plotchars 'boss health:' 3 0 22
    plotchars 'drone health:' 3 84 22
    plotvalue    scoredigits      3     scoref       6       50    22    ; Boss Health
    plotvalue    scoredigits      3     scored       6       137   22    ; Drone Health  
    plotsprite boss7a 5 boss7a_xpos boss7a_ypos
    plotsprite boss7b 5 boss7b_xpos boss7b_ypos
    plotsprite boss7c 5 boss7c_xpos boss7c_ypos
    plotsprite boss7d 5 boss7d_xpos boss7d_ypos
    plotsprite drone1 1 drone_xpos drone_ypos animate1 
 
    drawscreen

    if boss7a_xpos>20 then goto boss7_battle_transition

boss7_battle_init

    ;──═◙ Set Initial Location for Boss
    boss7a_xpos = 20.0 : boss7a_ypos = 132.1
    boss7b_xpos = 20.0 : boss7b_ypos = 140.1
    boss7c_xpos = 20.0 : boss7c_ypos = 148.1
    boss7d_xpos = 20.0 : boss7d_ypos = 156.1

    ;──═◙ Set Boss Movement Flags
    boss_move_flag1=0  :  boss_move_flag2=0  :  boss_move_flag3=0   :  boss_move_flag4=0 

    ;──═◙ Set Initial Location for Boss Rockets
    rocket1_xpos = 42.0 : rocket1_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket2_xpos = 54.0 : rocket2_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket3_xpos = 77.0 : rocket3_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket4_xpos = 89.0 : rocket4_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos

    fire_debounce_1=0

    boss_vertical_flag=1

boss7_battle_loop

    boss_counter=boss_counter+1
    if boss_counter>254 then boss_counter=0
    if boss_init_counter<30 then boss_init_counter=boss_init_counter+1
    if boss_init_counter=30 then boss_init_counter=30
    if boss_init_counter<30 then rocket1_xpos_save=boss7a_xpos+12 : rocket2_xpos_save=boss7a_xpos+34 : rocket3_xpos_save=boss7a_xpos+57 : rocket4_xpos_save=boss7a_xpos+69

    
    BACKGRND=$00

    ;──═◙ Increment frame and animation counters
    frame_counter=frame_counter+1
    if frame_counter>2 then frame_counter=0
    if frame_counter=2 then animate1=animate1+1
    if animate1>3 then animate1=0 
    animate2=animate2+1
    if animate2>2 then animate2=0

    ;──═◙ Check for Game Over if drone health reaches zero
    if healthLo=$00 && healthMed = $01 then goto skiphealthcheck_boss7
    if healthLo<$01 || healthMed>$01 then healthLo=$00:healthMed=$00:player_flag=1:return; if health falls to zero, you are dead - add animation, explosion, game over, etc.
skiphealthcheck_boss7

    ;──═◙ Move Boss Left and Right
    if boss_counter>100 && boss_counter<180 then goto skip_boss7_move
    if boss7a_xpos>96 then boss_move_counter=1
    if boss7a_xpos<2 then boss_move_counter=0
    if boss_move_counter=0 then gosub boss7_move_right
    if boss_move_counter=1 then gosub boss7_move_left
skip_boss7_move

    if boss7a_ypos>134 then boss_vertical_flag=1    ;too far down, set vertical flag to move up
    if boss7a_ypos<100 then boss_vertical_flag=2    ;too far up, set vertical flag to move down

boss7_up_only
    if boss_counter>80 && boss_counter<160 && boss_vertical_flag=1 then gosub boss7_move_up

boss7_down_only
    if boss_counter>160 && boss_counter<240 && boss_vertical_flag=2 then gosub boss7_move_down

    if rocket1_ypos=136 then gosub sfx_plainlaser

    ;──═◙  Boss Fire cannons 
    if rocket1_ypos<8 then rocket1_ypos=130.0:rocket1_xpos_save=rocket1_xpos:rocket2_xpos_save=rocket2_xpos:rocket3_xpos_save=rocket3_xpos:rocket4_xpos_save=rocket4_xpos:gosub sfx_plainlaser
    rocket1_ypos=rocket1_ypos-1.8
    if rocket2_ypos<8 then rocket2_ypos=130.0:gosub sfx_plainlaser
    rocket2_ypos=rocket2_ypos-1.8
    if rocket3_ypos<8 then rocket3_ypos=130.0:gosub sfx_plainlaser
    rocket3_ypos=rocket3_ypos-1.8
    if rocket4_ypos<8 then rocket4_ypos=130.0:gosub sfx_plainlaser
    rocket4_ypos=rocket4_ypos-1.8


    ;──═◙ Check for Game Reset
    if switchreset then reboot

    ;──═◙ Debounce Fire Buttons
    if joy0fire1 then fire_debounce_1=1  ; Left Button
    if !joy0fire1 && fire_debounce_1=1 then fire_debounce_1=2
 
    ;──═◙ Move the drone on the screen
    if joy0right then drone_xpos=drone_xpos+1+drone_speed
    if joy0left then drone_xpos=drone_xpos-1-drone_speed
    if joy0up then drone_ypos=drone_ypos-1-drone_speed
    if joy0down then drone_ypos=drone_ypos+1+drone_speed

    ;──═◙ Keep the drone on the screen
    if drone_ypos>90 then drone_ypos=90
    if drone_ypos<8 then drone_ypos=8
    if drone_xpos<8 then drone_xpos=8
    if drone_xpos>128 then drone_xpos=128


    if laser_counter>10 then laser_fire_flag=1 
    if fire_debounce_1=1 then laser_counter=laser_counter+1 else laser_fire_flag=0:laser_counter=0

    ;──═◙ Detect Boss Hit
    if crosshair_x_offset_1=200 then goto skip_boss7_coll 
    asm
    QBOXCOLLISIONCHECK boss7b_xpos,boss7b_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1
    asm
    QBOXCOLLISIONCHECK boss7c_xpos,boss7c_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1
    asm
    QBOXCOLLISIONCHECK boss7d_xpos,boss7d_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1
skip_boss7_coll

    ;──═◙ Detect Drone Hit
    asm
    QBOXCOLLISIONCHECK rocket1_xpos,rocket1_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone
    asm
    QBOXCOLLISIONCHECK rocket2_xpos,rocket2_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone
    asm
    QBOXCOLLISIONCHECK rocket3_xpos,rocket3_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone
    asm
    QBOXCOLLISIONCHECK rocket4_xpos,rocket4_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone

   ; this sets the defeated flag for Boss 7
   if bossLo<$50 then gosub switch_screen bank2:healthHi = $00 : healthMed = $05 : healthLo = $00:transition_flag=0:boss7_defeated_flag=1:levelLo=$08:return

   restorescreen

    plotchars 'boss health:' 3 0 22
    plotchars 'drone health:' 3 84 22
    plotvalue    scoredigits      3     scoref       6       50    22    ; Boss Health
    plotvalue    scoredigits      3     scored       6       137   22    ; Drone Health  
    plotsprite boss7a 5 boss7a_xpos boss7a_ypos
    plotsprite boss7b 5 boss7b_xpos boss7b_ypos
    plotsprite boss7c 5 boss7c_xpos boss7c_ypos
    plotsprite boss7d 5 boss7d_xpos boss7d_ypos

    plotsprite bomb_large_up 6 rocket1_xpos_save rocket1_ypos
    plotsprite bomb_large_up 6 rocket2_xpos_save rocket2_ypos
    plotsprite bomb_large_up 6 rocket3_xpos_save rocket3_ypos
    plotsprite bomb_large_up 6 rocket4_xpos_save rocket4_ypos

    if joy0left then plotsprite      drone1_left     1      drone_xpos      drone_ypos      animate1        : goto skip_next_boss7
    if joy0right then plotsprite     drone1_right    1      drone_xpos      drone_ypos      animate1        : goto skip_next_boss7
    plotsprite      drone1                      1      drone_xpos      drone_ypos      animate1        ; Drone
skip_next_boss7

    ;──═◙ Plot the laser when you press the fire button
    ;if joy0left || joy0right then goto skiplaserfire_boss7  ; You can only fire when you're not moving
    ;if joy0up || joy0down then goto skiplaserfire_boss7     ; ...
    if laser_fire_flag=1 then goto skiplaserfire_boss7
    if drone_ypos<22 then goto skiplaserfire_boss7 ; If you are too high up you can't fire
    if fire_debounce_1=1 then gosub sfx_pulsecannon bank2:gosub draw_laser bank2
    if fire_debounce_1<>1 then crosshair_x_offset_1=200
skiplaserfire_boss7

   drawscreen
   
  goto boss7_battle_loop
  
boss7_move_up

    boss7a_ypos=boss7a_ypos-0.6:boss7b_ypos=boss7b_ypos-0.6:boss7c_ypos=boss7c_ypos-0.6:boss7d_ypos=boss7d_ypos-0.6
    rocket1_ypos=rocket1_ypos-0.6:rocket2_ypos=rocket1_ypos-0.6:rocket3_ypos=rocket1_ypos-0.6:rocket4_ypos=rocket1_ypos-0.6

  return

boss7_move_down

    boss7a_ypos=boss7a_ypos+0.6:boss7b_ypos=boss7b_ypos+0.6:boss7c_ypos=boss7c_ypos+0.6:boss7d_ypos=boss7d_ypos+0.6
    rocket1_ypos=rocket1_ypos+0.6:rocket2_ypos=rocket1_ypos+0.6:rocket3_ypos=rocket1_ypos+0.6:rocket4_ypos=rocket1_ypos+0.6

  return

boss7_move_right

    boss7a_xpos=boss7a_xpos+1.6:boss7b_xpos=boss7b_xpos+1.6:boss7c_xpos=boss7c_xpos+1.6:boss7d_xpos=boss7d_xpos+1.6
    rocket1_xpos=rocket1_xpos+0.8:rocket2_xpos=rocket2_xpos+0.8:rocket3_xpos=rocket3_xpos+0.8:rocket4_xpos=rocket4_xpos+0.8
    boss_vertical_flag=1

  return

boss7_move_left

    boss7a_xpos=boss7a_xpos-1.6:boss7b_xpos=boss7b_xpos-1.6:boss7c_xpos=boss7c_xpos-1.6:boss7d_xpos=boss7d_xpos-1.6
    rocket1_xpos=rocket1_xpos-0.8:rocket2_xpos=rocket2_xpos-0.8:rocket3_xpos=rocket3_xpos-0.8:rocket4_xpos=rocket4_xpos-0.8
    boss_vertical_flag=2

  return

 ; ##################################################################################################################################################################3
 
    data sfx_museboom_boss7
    $10,$10,$00 ; version, priority, frames per chunk
    $15,$04,$0b ; first chunk of freq,channel,volume
    $12,$0c,$0b
    $1e,$04,$0d
    $16,$04,$0b
    $04,$06,$0c
    $1c,$0c,$0d
    $0a,$0c,$0b
    $15,$04,$0c
    $1a,$0c,$0a
    $0c,$0c,$0d
    $13,$0c,$0a
    $15,$04,$0a
    $1a,$0c,$0a
    $05,$06,$09
    $0b,$0c,$09
    $16,$04,$0d
    $13,$0c,$08
    $13,$0c,$0d
    $0b,$0c,$0d
    $06,$06,$0b
    $1d,$0c,$09
    $10,$0c,$0b
    $1e,$04,$0c
    $05,$06,$0a
    $05,$06,$0b
    $0b,$0c,$0a
    $1c,$04,$0d
    $05,$06,$0b
    $18,$0c,$0c
    $0c,$0c,$0c
    $1b,$07,$0d
    $15,$0c,$0d
    $14,$0c,$0b
    $0b,$0c,$0d
    $1e,$0c,$0b
    $1b,$0c,$0c
    $0b,$0c,$0c
    $0d,$0c,$0d
    $1a,$0c,$09
    $15,$0c,$09
    $0a,$0c,$0a
    $06,$06,$07
    $17,$0c,$09
    $10,$0c,$08
    $1b,$0c,$07
    $06,$06,$06
    $17,$0c,$07
    $0c,$0c,$07
    $06,$06,$07
    $0e,$0f,$07
    $14,$0c,$07
    $10,$0c,$04
    $1a,$0c,$05
    $12,$0c,$04
    $1c,$0c,$03
    $14,$0c,$03
    $1e,$0c,$03
    $1d,$07,$02
    $08,$06,$01
    $16,$0c,$01
    $15,$0c,$01
    $00,$00,$00
end


 bank 12
  
   newblock
    incgraphic gfx/ex2/boss8a.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss8b.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss8c.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss8d.png 160A 1 0 2 3

boss8_battle
    playsfx sfx_museboom_boss8
    savescreen
    ;──═◙ Set Palette Colors
     P0C1 = $F7 : P0C2 = $1C : P0C3 = $0F  ; City Defense Beam              
     P1C1 = $0F : P1C2 = $46 : P1C3 = $08  ; Drone: c1 rotors  c2 body  c3 middle
     P2C1 = $42 : P2C2 = $4A : P2C3 = $0C  ; Drone Laser  
     P3C1 = $38 : P3C2 = $36 : P3C3 = $32  ; Top Enemy Vehicle
     P4C1 = $08 : P4C2 = $0A : P4C3 = $0F  ; Top Line of Scrolling Background  |  C1:shadow  C2:bldg color  C3:window color
     P5C1 = $82 : P5C2 = $84 : P5C3 = $96  ; Middle Enemy Vehicle & Missile
     P6C1 = $42 : P6C2 = $44 : P6C3 = $46  ; Bottom Enemy Vehicle & Laser
    ;P7C1 = $02 : P7C2 = $04 : P7C3 = $06  ; level 1 city color
    ;P4C1 = $12 : P4C2 = $16 : P4C3 = $0A  ; level 2 city color
    ;P4C1 = $22 : P4C2 = $26 : P4C3 = $08  ; level 3 city color
    ;P4C1 = $32 : P4C2 = $36 : P4C3 = $0A  ; level 4 city color
    ;P4C1 = $62 : P4C2 = $66 : P4C3 = $08  ; level 5 city color
    ;P4C1 = $52 : P4C2 = $56 : P4C3 = $0A  ; level 6 city color
    ;P4C1 = $42 : P4C2 = $46 : P4C3 = $08  ; level 7 city color
    ;P4C1 = $72 : P4C2 = $76 : P4C3 = $0A  ; level 8 city color 
    ;P4C1 = $82 : P4C2 = $86 : P4C3 = $08  ; level 9 city color
    ;P4C1 = $A2 : P4C2 = $A6 : P4C3 = $0A  ; level 10 city color
    ;P4C1 = $C2 : P4C2 = $C6 : P4C3 = $0A  ; level 11 city color

    if levelLo=$02 then P4C1=$12:P4C2=$16:P4C3=$0A
    if levelLo=$03 then P4C1=$22:P4C2=$26:P4C3=$08
    if levelLo=$04 then P4C1=$32:P4C2=$36:P4C3=$0A
    if levelLo=$05 then P4C1=$62:P4C2=$66:P4C3=$08
    if levelLo=$06 then P4C1=$52:P4C2=$56:P4C3=$0A
    if levelLo=$07 then P4C1=$42:P4C2=$46:P4C3=$08
    if levelLo=$08 then P4C1=$72:P4C2=$76:P4C3=$0A
    if levelLo=$09 then P4C1=$82:P4C2=$86:P4C3=$08
    if levelLo=$10 then P4C1=$A2:P4C2=$A6:P4C3=$0A
    if levelLo>$10 then P4C1=$C2:P4C2=$C6:P4C3=$0A

    ;──═◙ Set Drone Health for this Boss Battle
    healthHi = $00 : healthMed = $00 : healthLo = $51

    ;──═◙ Set Boss Health for this battle
    bossHi = $00 : bossMed = $00 : bossLo = $60

    ;──═◙ Set Initial values for Boss Frame Counters
    boss_move_counter=0 :  boss_counter = 0

    ;──═◙ Set Initial Location for Boss
    boss8a_xpos = 200.0 : boss8a_ypos = 132.1
    boss8b_xpos = 200.0 : boss8b_ypos = 140.1
    boss8c_xpos = 200.0 : boss8c_ypos = 148.1
    boss8d_xpos = 200.0 : boss8d_ypos = 156.1

    drone_xpos=0:drone_ypos=22

    boss_vertical_flag=0
    boss_init_counter = 0

    direction = 0

    scorea=scorea+100

boss8_battle_transition

    BACKGRND=$00

    if drone_xpos<70 then drone_xpos=drone_xpos+1

    ;──═◙ Increment frame and animation counters
    frame_counter=frame_counter+1
    if frame_counter>2 then frame_counter=0
    if frame_counter=2 then animate1=animate1+1
    if animate1>3 then animate1=0 

    ;──═◙ Move boss in from the right side of the screen
    boss8a_xpos=boss8a_xpos-0.8:boss8b_xpos=boss8b_xpos-0.8:boss8c_xpos=boss8c_xpos-0.8:boss8d_xpos=boss8d_xpos-0.8
    rocket1_xpos=rocket1_xpos-0.8:rocket2_xpos=rocket2_xpos-0.8:rocket3_xpos=rocket3_xpos-0.8:rocket4_xpos=rocket4_xpos-0.8

    restorescreen

    plotchars 'boss health:' 3 0 22
    plotchars 'drone health:' 3 84 22
    plotvalue    scoredigits      3     scoref       6       50    22    ; Boss Health
    plotvalue    scoredigits      3     scored       6       137   22    ; Drone Health  
    plotsprite boss8a 5 boss8a_xpos boss8a_ypos
    plotsprite boss8b 5 boss8b_xpos boss8b_ypos
    plotsprite boss8c 5 boss8c_xpos boss8c_ypos
    plotsprite boss8d 5 boss8d_xpos boss8d_ypos
    plotsprite drone1 1 drone_xpos drone_ypos animate1 
 
    drawscreen

    if boss8a_xpos>20 then goto boss8_battle_transition

boss8_battle_init

    ;──═◙ Set Initial Location for Boss
    boss8a_xpos = 20.0 : boss8a_ypos = 132.1
    boss8b_xpos = 20.0 : boss8b_ypos = 140.1
    boss8c_xpos = 20.0 : boss8c_ypos = 148.1
    boss8d_xpos = 20.0 : boss8d_ypos = 156.1

    ;──═◙ Set Boss Movement Flags
    boss_move_flag1=0  :  boss_move_flag2=0  :  boss_move_flag3=0   :  boss_move_flag4=0 

    ;──═◙ Set Initial Location for Boss Rockets
    rocket1_xpos = 42.0 : rocket1_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket2_xpos = 54.0 : rocket2_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket3_xpos = 77.0 : rocket3_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket4_xpos = 89.0 : rocket4_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos

    fire_debounce_1=0

    boss_vertical_flag=1

boss8_battle_loop

    boss_counter=boss_counter+1
    if boss_counter>254 then boss_counter=0
    if boss_init_counter<30 then boss_init_counter=boss_init_counter+1
    if boss_init_counter=30 then boss_init_counter=30
    if boss_init_counter<30 then rocket1_xpos_save=boss8a_xpos+12 : rocket2_xpos_save=boss8a_xpos+34 : rocket3_xpos_save=boss8a_xpos+57 : rocket4_xpos_save=boss8a_xpos+69

    
    BACKGRND=$00

    ;──═◙ Increment frame and animation counters
    frame_counter=frame_counter+1
    if frame_counter>2 then frame_counter=0
    if frame_counter=2 then animate1=animate1+1
    if animate1>3 then animate1=0 
    animate2=animate2+1
    if animate2>2 then animate2=0

    ;──═◙ Check for Game Over if drone health reaches zero
    if healthLo=$00 && healthMed = $01 then goto skiphealthcheck_boss8
    if healthLo<$01 || healthMed>$01 then healthLo=$00:healthMed=$00:player_flag=1:return; if health falls to zero, you are dead - add animation, explosion, game over, etc.
skiphealthcheck_boss8

    ;──═◙ Move Boss Left and Right
    if boss_counter>100 && boss_counter<180 then goto skip_boss8_move
    if boss8a_xpos>96 then boss_move_counter=1
    if boss8a_xpos<2 then boss_move_counter=0
    if boss_move_counter=0 then gosub boss8_move_right
    if boss_move_counter=1 then gosub boss8_move_left
skip_boss8_move

    if boss8a_ypos>134 then boss_vertical_flag=1    ;too far down, set vertical flag to move up
    if boss8a_ypos<100 then boss_vertical_flag=2    ;too far up, set vertical flag to move down

boss8_up_only
    if boss_counter>80 && boss_counter<160 && boss_vertical_flag=1 then gosub boss8_move_up

boss8_down_only
    if boss_counter>160 && boss_counter<240 && boss_vertical_flag=2 then gosub boss8_move_down

    if rocket1_ypos=136 then gosub sfx_plainlaser

    ;──═◙  Boss Fire cannons 
    if rocket1_ypos<8 then rocket1_ypos=130.0:rocket1_xpos_save=rocket1_xpos:rocket2_xpos_save=rocket2_xpos:rocket3_xpos_save=rocket3_xpos:rocket4_xpos_save=rocket4_xpos:gosub sfx_plainlaser
    rocket1_ypos=rocket1_ypos-1.8
    if rocket2_ypos<8 then rocket2_ypos=130.0:gosub sfx_plainlaser
    rocket2_ypos=rocket2_ypos-1.8
    if rocket3_ypos<8 then rocket3_ypos=130.0:gosub sfx_plainlaser
    rocket3_ypos=rocket3_ypos-1.8
    if rocket4_ypos<8 then rocket4_ypos=130.0:gosub sfx_plainlaser
    rocket4_ypos=rocket4_ypos-1.8


    ;──═◙ Check for Game Reset
    if switchreset then reboot

    ;──═◙ Debounce Fire Buttons
    if joy0fire1 then fire_debounce_1=1  ; Left Button
    if !joy0fire1 && fire_debounce_1=1 then fire_debounce_1=2
 
    ;──═◙ Move the drone on the screen
    if joy0right then drone_xpos=drone_xpos+1+drone_speed
    if joy0left then drone_xpos=drone_xpos-1-drone_speed
    if joy0up then drone_ypos=drone_ypos-1-drone_speed
    if joy0down then drone_ypos=drone_ypos+1+drone_speed

    ;──═◙ Keep the drone on the screen
    if drone_ypos>90 then drone_ypos=90
    if drone_ypos<8 then drone_ypos=8
    if drone_xpos<8 then drone_xpos=8
    if drone_xpos>128 then drone_xpos=128


    if laser_counter>10 then laser_fire_flag=1 
    if fire_debounce_1=1 then laser_counter=laser_counter+1 else laser_fire_flag=0:laser_counter=0

    ;──═◙ Detect Boss Hit
    if crosshair_x_offset_1=200 then goto skip_boss8_coll 
    asm
    QBOXCOLLISIONCHECK boss8b_xpos,boss8b_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1
    asm
    QBOXCOLLISIONCHECK boss8c_xpos,boss8c_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1
    asm
    QBOXCOLLISIONCHECK boss8d_xpos,boss8d_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1
skip_boss8_coll

    ;──═◙ Detect Drone Hit
    asm
    QBOXCOLLISIONCHECK rocket1_xpos,rocket1_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone
    asm
    QBOXCOLLISIONCHECK rocket2_xpos,rocket2_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone
    asm
    QBOXCOLLISIONCHECK rocket3_xpos,rocket3_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone
    asm
    QBOXCOLLISIONCHECK rocket4_xpos,rocket4_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone

   ; this sets the defeated flag for Boss 8
   if bossLo<$50 then gosub switch_screen bank2:healthHi = $00 : healthMed = $05 : healthLo = $00:transition_flag=0:boss8_defeated_flag=1:levelLo=$09:return

   restorescreen

    plotchars 'boss health:' 3 0 22
    plotchars 'drone health:' 3 84 22
    plotvalue    scoredigits      3     scoref       6       50    22    ; Boss Health
    plotvalue    scoredigits      3     scored       6       137   22    ; Drone Health  
    plotsprite boss8a 5 boss8a_xpos boss8a_ypos
    plotsprite boss8b 5 boss8b_xpos boss8b_ypos
    plotsprite boss8c 5 boss8c_xpos boss8c_ypos
    plotsprite boss8d 5 boss8d_xpos boss8d_ypos

    plotsprite bomb_large_up 6 rocket1_xpos_save rocket1_ypos
    plotsprite bomb_large_up 6 rocket2_xpos_save rocket2_ypos
    plotsprite bomb_large_up 6 rocket3_xpos_save rocket3_ypos
    plotsprite bomb_large_up 6 rocket4_xpos_save rocket4_ypos

    if joy0left then plotsprite      drone1_left     1      drone_xpos      drone_ypos      animate1        : goto skip_next_boss8
    if joy0right then plotsprite     drone1_right    1      drone_xpos      drone_ypos      animate1        : goto skip_next_boss8
    plotsprite      drone1                      1      drone_xpos      drone_ypos      animate1        ; Drone
skip_next_boss8

    ;──═◙ Plot the laser when you press the fire button
    ;if joy0left || joy0right then goto skiplaserfire_boss8  ; You can only fire when you're not moving
    ;if joy0up || joy0down then goto skiplaserfire_boss8     ; ...
    if laser_fire_flag=1 then goto skiplaserfire_boss8
    if drone_ypos<22 then goto skiplaserfire_boss8 ; If you are too high up you can't fire
    if fire_debounce_1=1 then gosub sfx_pulsecannon bank2:gosub draw_laser bank2
    if fire_debounce_1<>1 then crosshair_x_offset_1=200
skiplaserfire_boss8

   drawscreen
   
  goto boss8_battle_loop
  
boss8_move_up

    boss8a_ypos=boss8a_ypos-0.6:boss8b_ypos=boss8b_ypos-0.6:boss8c_ypos=boss8c_ypos-0.6:boss8d_ypos=boss8d_ypos-0.6
    rocket1_ypos=rocket1_ypos-0.6:rocket2_ypos=rocket1_ypos-0.6:rocket3_ypos=rocket1_ypos-0.6:rocket4_ypos=rocket1_ypos-0.6

  return

boss8_move_down

    boss8a_ypos=boss8a_ypos+0.6:boss8b_ypos=boss8b_ypos+0.6:boss8c_ypos=boss8c_ypos+0.6:boss8d_ypos=boss8d_ypos+0.6
    rocket1_ypos=rocket1_ypos+0.6:rocket2_ypos=rocket1_ypos+0.6:rocket3_ypos=rocket1_ypos+0.6:rocket4_ypos=rocket1_ypos+0.6

  return

boss8_move_right

    boss8a_xpos=boss8a_xpos+1.6:boss8b_xpos=boss8b_xpos+1.6:boss8c_xpos=boss8c_xpos+1.6:boss8d_xpos=boss8d_xpos+1.6
    rocket1_xpos=rocket1_xpos+0.8:rocket2_xpos=rocket2_xpos+0.8:rocket3_xpos=rocket3_xpos+0.8:rocket4_xpos=rocket4_xpos+0.8
    boss_vertical_flag=1

  return

boss8_move_left

    boss8a_xpos=boss8a_xpos-1.6:boss8b_xpos=boss8b_xpos-1.6:boss8c_xpos=boss8c_xpos-1.6:boss8d_xpos=boss8d_xpos-1.6
    rocket1_xpos=rocket1_xpos-0.8:rocket2_xpos=rocket2_xpos-0.8:rocket3_xpos=rocket3_xpos-0.8:rocket4_xpos=rocket4_xpos-0.8
    boss_vertical_flag=2

  return

 ; ##################################################################################################################################################################3
 
    data sfx_museboom_boss8
    $10,$10,$00 ; version, priority, frames per chunk
    $15,$04,$0b ; first chunk of freq,channel,volume
    $12,$0c,$0b
    $1e,$04,$0d
    $16,$04,$0b
    $04,$06,$0c
    $1c,$0c,$0d
    $0a,$0c,$0b
    $15,$04,$0c
    $1a,$0c,$0a
    $0c,$0c,$0d
    $13,$0c,$0a
    $15,$04,$0a
    $1a,$0c,$0a
    $05,$06,$09
    $0b,$0c,$09
    $16,$04,$0d
    $13,$0c,$08
    $13,$0c,$0d
    $0b,$0c,$0d
    $06,$06,$0b
    $1d,$0c,$09
    $10,$0c,$0b
    $1e,$04,$0c
    $05,$06,$0a
    $05,$06,$0b
    $0b,$0c,$0a
    $1c,$04,$0d
    $05,$06,$0b
    $18,$0c,$0c
    $0c,$0c,$0c
    $1b,$07,$0d
    $15,$0c,$0d
    $14,$0c,$0b
    $0b,$0c,$0d
    $1e,$0c,$0b
    $1b,$0c,$0c
    $0b,$0c,$0c
    $0d,$0c,$0d
    $1a,$0c,$09
    $15,$0c,$09
    $0a,$0c,$0a
    $06,$06,$07
    $17,$0c,$09
    $10,$0c,$08
    $1b,$0c,$07
    $06,$06,$06
    $17,$0c,$07
    $0c,$0c,$07
    $06,$06,$07
    $0e,$0f,$07
    $14,$0c,$07
    $10,$0c,$04
    $1a,$0c,$05
    $12,$0c,$04
    $1c,$0c,$03
    $14,$0c,$03
    $1e,$0c,$03
    $1d,$07,$02
    $08,$06,$01
    $16,$0c,$01
    $15,$0c,$01
    $00,$00,$00
end


 bank 13
  
   newblock
    incgraphic gfx/ex2/boss9a.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss9b.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss9c.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss9d.png 160A 1 0 2 3

boss9_battle
    playsfx sfx_museboom_boss9
    savescreen
    ;──═◙ Set Palette Colors
     P0C1 = $F7 : P0C2 = $1C : P0C3 = $0F  ; City Defense Beam              
     P1C1 = $0F : P1C2 = $46 : P1C3 = $08  ; Drone: c1 rotors  c2 body  c3 middle
     P2C1 = $42 : P2C2 = $4A : P2C3 = $0C  ; Drone Laser  
     P3C1 = $38 : P3C2 = $36 : P3C3 = $32  ; Top Enemy Vehicle
     P4C1 = $08 : P4C2 = $0A : P4C3 = $0F  ; Top Line of Scrolling Background  |  C1:shadow  C2:bldg color  C3:window color
     P5C1 = $82 : P5C2 = $84 : P5C3 = $96  ; Middle Enemy Vehicle & Missile
     P6C1 = $42 : P6C2 = $44 : P6C3 = $46  ; Bottom Enemy Vehicle & Laser
    ;P7C1 = $02 : P7C2 = $04 : P7C3 = $06  ; level 1 city color
    ;P4C1 = $12 : P4C2 = $16 : P4C3 = $0A  ; level 2 city color
    ;P4C1 = $22 : P4C2 = $26 : P4C3 = $08  ; level 3 city color
    ;P4C1 = $32 : P4C2 = $36 : P4C3 = $0A  ; level 4 city color
    ;P4C1 = $62 : P4C2 = $66 : P4C3 = $08  ; level 5 city color
    ;P4C1 = $52 : P4C2 = $56 : P4C3 = $0A  ; level 6 city color
    ;P4C1 = $42 : P4C2 = $46 : P4C3 = $08  ; level 7 city color
    ;P4C1 = $72 : P4C2 = $76 : P4C3 = $0A  ; level 8 city color 
    ;P4C1 = $82 : P4C2 = $86 : P4C3 = $08  ; level 9 city color
    ;P4C1 = $A2 : P4C2 = $A6 : P4C3 = $0A  ; level 10 city color
    ;P4C1 = $C2 : P4C2 = $C6 : P4C3 = $0A  ; level 11 city color

    if levelLo=$02 then P4C1=$12:P4C2=$16:P4C3=$0A
    if levelLo=$03 then P4C1=$22:P4C2=$26:P4C3=$08
    if levelLo=$04 then P4C1=$32:P4C2=$36:P4C3=$0A
    if levelLo=$05 then P4C1=$62:P4C2=$66:P4C3=$08
    if levelLo=$06 then P4C1=$52:P4C2=$56:P4C3=$0A
    if levelLo=$07 then P4C1=$42:P4C2=$46:P4C3=$08
    if levelLo=$08 then P4C1=$72:P4C2=$76:P4C3=$0A
    if levelLo=$09 then P4C1=$82:P4C2=$86:P4C3=$08
    if levelLo=$10 then P4C1=$A2:P4C2=$A6:P4C3=$0A
    if levelLo>$10 then P4C1=$C2:P4C2=$C6:P4C3=$0A

    ;──═◙ Set Drone Health for this Boss Battle
    healthHi = $00 : healthMed = $00 : healthLo = $51

    ;──═◙ Set Boss Health for this battle
    bossHi = $00 : bossMed = $00 : bossLo = $60

    ;──═◙ Set Initial values for Boss Frame Counters
    boss_move_counter=0 :  boss_counter = 0

    ;──═◙ Set Initial Location for Boss
    boss9a_xpos = 200.0 : boss9a_ypos = 132.1
    boss9b_xpos = 200.0 : boss9b_ypos = 140.1
    boss9c_xpos = 200.0 : boss9c_ypos = 148.1
    boss9d_xpos = 200.0 : boss9d_ypos = 156.1

    drone_xpos=0:drone_ypos=22

    boss_vertical_flag=0
    boss_init_counter = 0

    direction = 0

    scorea=scorea+100

boss9_battle_transition

    BACKGRND=$00

    if drone_xpos<70 then drone_xpos=drone_xpos+1

    ;──═◙ Increment frame and animation counters
    frame_counter=frame_counter+1
    if frame_counter>2 then frame_counter=0
    if frame_counter=2 then animate1=animate1+1
    if animate1>3 then animate1=0 

    ;──═◙ Move boss in from the right side of the screen
    boss9a_xpos=boss9a_xpos-0.8:boss9b_xpos=boss9b_xpos-0.8:boss9c_xpos=boss9c_xpos-0.8:boss9d_xpos=boss9d_xpos-0.8
    rocket1_xpos=rocket1_xpos-0.8:rocket2_xpos=rocket2_xpos-0.8:rocket3_xpos=rocket3_xpos-0.8:rocket4_xpos=rocket4_xpos-0.8

    restorescreen

    plotchars 'boss health:' 3 0 22
    plotchars 'drone health:' 3 84 22
    plotvalue    scoredigits      3     scoref       6       50    22    ; Boss Health
    plotvalue    scoredigits      3     scored       6       137   22    ; Drone Health  
    plotsprite boss9a 5 boss9a_xpos boss9a_ypos
    plotsprite boss9b 5 boss9b_xpos boss9b_ypos
    plotsprite boss9c 5 boss9c_xpos boss9c_ypos
    plotsprite boss9d 5 boss9d_xpos boss9d_ypos
    plotsprite drone1 1 drone_xpos drone_ypos animate1 
 
    drawscreen

    if boss9a_xpos>20 then goto boss9_battle_transition

boss9_battle_init

    ;──═◙ Set Initial Location for Boss
    boss9a_xpos = 20.0 : boss9a_ypos = 132.1
    boss9b_xpos = 20.0 : boss9b_ypos = 140.1
    boss9c_xpos = 20.0 : boss9c_ypos = 148.1
    boss9d_xpos = 20.0 : boss9d_ypos = 156.1

    ;──═◙ Set Boss Movement Flags
    boss_move_flag1=0  :  boss_move_flag2=0  :  boss_move_flag3=0   :  boss_move_flag4=0 

    ;──═◙ Set Initial Location for Boss Rockets
    rocket1_xpos = 42.0 : rocket1_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket2_xpos = 54.0 : rocket2_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket3_xpos = 77.0 : rocket3_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket4_xpos = 89.0 : rocket4_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos

    fire_debounce_1=0

    boss_vertical_flag=1

boss9_battle_loop

    boss_counter=boss_counter+1
    if boss_counter>254 then boss_counter=0
    if boss_init_counter<30 then boss_init_counter=boss_init_counter+1
    if boss_init_counter=30 then boss_init_counter=30
    if boss_init_counter<30 then rocket1_xpos_save=boss9a_xpos+12 : rocket2_xpos_save=boss9a_xpos+34 : rocket3_xpos_save=boss9a_xpos+57 : rocket4_xpos_save=boss9a_xpos+69

    
    BACKGRND=$00

    ;──═◙ Increment frame and animation counters
    frame_counter=frame_counter+1
    if frame_counter>2 then frame_counter=0
    if frame_counter=2 then animate1=animate1+1
    if animate1>3 then animate1=0 
    animate2=animate2+1
    if animate2>2 then animate2=0

    ;──═◙ Check for Game Over if drone health reaches zero
    if healthLo=$00 && healthMed = $01 then goto skiphealthcheck_boss9
    if healthLo<$01 || healthMed>$01 then healthLo=$00:healthMed=$00:player_flag=1:return; if health falls to zero, you are dead - add animation, explosion, game over, etc.
skiphealthcheck_boss9

    ;──═◙ Move Boss Left and Right
    if boss_counter>100 && boss_counter<180 then goto skip_boss9_move
    if boss9a_xpos>96 then boss_move_counter=1
    if boss9a_xpos<2 then boss_move_counter=0
    if boss_move_counter=0 then gosub boss9_move_right
    if boss_move_counter=1 then gosub boss9_move_left
skip_boss9_move

    if boss9a_ypos>134 then boss_vertical_flag=1    ;too far down, set vertical flag to move up
    if boss9a_ypos<100 then boss_vertical_flag=2    ;too far up, set vertical flag to move down

boss9_up_only
    if boss_counter>80 && boss_counter<160 && boss_vertical_flag=1 then gosub boss9_move_up

boss9_down_only
    if boss_counter>160 && boss_counter<240 && boss_vertical_flag=2 then gosub boss9_move_down

    if rocket1_ypos=136 then gosub sfx_plainlaser

    ;──═◙  Boss Fire cannons 
    if rocket1_ypos<8 then rocket1_ypos=130.0:rocket1_xpos_save=rocket1_xpos:rocket2_xpos_save=rocket2_xpos:rocket3_xpos_save=rocket3_xpos:rocket4_xpos_save=rocket4_xpos:gosub sfx_plainlaser
    rocket1_ypos=rocket1_ypos-1.8
    if rocket2_ypos<8 then rocket2_ypos=130.0:gosub sfx_plainlaser
    rocket2_ypos=rocket2_ypos-1.8
    if rocket3_ypos<8 then rocket3_ypos=130.0:gosub sfx_plainlaser
    rocket3_ypos=rocket3_ypos-1.8
    if rocket4_ypos<8 then rocket4_ypos=130.0:gosub sfx_plainlaser
    rocket4_ypos=rocket4_ypos-1.8


    ;──═◙ Check for Game Reset
    if switchreset then reboot

    ;──═◙ Debounce Fire Buttons
    if joy0fire1 then fire_debounce_1=1  ; Left Button
    if !joy0fire1 && fire_debounce_1=1 then fire_debounce_1=2
 
    ;──═◙ Move the drone on the screen
    if joy0right then drone_xpos=drone_xpos+1+drone_speed
    if joy0left then drone_xpos=drone_xpos-1-drone_speed
    if joy0up then drone_ypos=drone_ypos-1-drone_speed
    if joy0down then drone_ypos=drone_ypos+1+drone_speed

    ;──═◙ Keep the drone on the screen
    if drone_ypos>90 then drone_ypos=90
    if drone_ypos<8 then drone_ypos=8
    if drone_xpos<8 then drone_xpos=8
    if drone_xpos>128 then drone_xpos=128


    if laser_counter>10 then laser_fire_flag=1 
    if fire_debounce_1=1 then laser_counter=laser_counter+1 else laser_fire_flag=0:laser_counter=0

    ;──═◙ Detect Boss Hit
    if crosshair_x_offset_1=200 then goto skip_boss9_coll 
    asm
    QBOXCOLLISIONCHECK boss9b_xpos,boss9b_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1
    asm
    QBOXCOLLISIONCHECK boss9c_xpos,boss9c_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1
    asm
    QBOXCOLLISIONCHECK boss9d_xpos,boss9d_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1
skip_boss9_coll

    ;──═◙ Detect Drone Hit
    asm
    QBOXCOLLISIONCHECK rocket1_xpos,rocket1_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone
    asm
    QBOXCOLLISIONCHECK rocket2_xpos,rocket2_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone
    asm
    QBOXCOLLISIONCHECK rocket3_xpos,rocket3_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone
    asm
    QBOXCOLLISIONCHECK rocket4_xpos,rocket4_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone

   ; this sets the defeated flag for Boss 9
   if bossLo<$50 then gosub switch_screen bank2:healthHi = $00 : healthMed = $05 : healthLo = $00:transition_flag=0:boss9_defeated_flag=1:levelLo=$10:return

   restorescreen

    plotchars 'boss health:' 3 0 22
    plotchars 'drone health:' 3 84 22
    plotvalue    scoredigits      3     scoref       6       50    22    ; Boss Health
    plotvalue    scoredigits      3     scored       6       137   22    ; Drone Health  
    plotsprite boss9a 5 boss9a_xpos boss9a_ypos
    plotsprite boss9b 5 boss9b_xpos boss9b_ypos
    plotsprite boss9c 5 boss9c_xpos boss9c_ypos
    plotsprite boss9d 5 boss9d_xpos boss9d_ypos

    plotsprite bomb_large_up 6 rocket1_xpos_save rocket1_ypos
    plotsprite bomb_large_up 6 rocket2_xpos_save rocket2_ypos
    plotsprite bomb_large_up 6 rocket3_xpos_save rocket3_ypos
    plotsprite bomb_large_up 6 rocket4_xpos_save rocket4_ypos

    if joy0left then plotsprite      drone1_left     1      drone_xpos      drone_ypos      animate1        : goto skip_next_boss9
    if joy0right then plotsprite     drone1_right    1      drone_xpos      drone_ypos      animate1        : goto skip_next_boss9
    plotsprite      drone1                      1      drone_xpos      drone_ypos      animate1        ; Drone
skip_next_boss9

    ;──═◙ Plot the laser when you press the fire button
    ;if joy0left || joy0right then goto skiplaserfire_boss9  ; You can only fire when you're not moving
    ;if joy0up || joy0down then goto skiplaserfire_boss9     ; ...
    if laser_fire_flag=1 then goto skiplaserfire_boss9
    if drone_ypos<22 then goto skiplaserfire_boss9 ; If you are too high up you can't fire
    if fire_debounce_1=1 then gosub sfx_pulsecannon bank2:gosub draw_laser bank2
    if fire_debounce_1<>1 then crosshair_x_offset_1=200
skiplaserfire_boss9

   drawscreen
   
  goto boss9_battle_loop
  
boss9_move_up

    boss9a_ypos=boss9a_ypos-0.6:boss9b_ypos=boss9b_ypos-0.6:boss9c_ypos=boss9c_ypos-0.6:boss9d_ypos=boss9d_ypos-0.6
    rocket1_ypos=rocket1_ypos-0.6:rocket2_ypos=rocket1_ypos-0.6:rocket3_ypos=rocket1_ypos-0.6:rocket4_ypos=rocket1_ypos-0.6

  return

boss9_move_down

    boss9a_ypos=boss9a_ypos+0.6:boss9b_ypos=boss9b_ypos+0.6:boss9c_ypos=boss9c_ypos+0.6:boss9d_ypos=boss9d_ypos+0.6
    rocket1_ypos=rocket1_ypos+0.6:rocket2_ypos=rocket1_ypos+0.6:rocket3_ypos=rocket1_ypos+0.6:rocket4_ypos=rocket1_ypos+0.6

  return

boss9_move_right

    boss9a_xpos=boss9a_xpos+1.6:boss9b_xpos=boss9b_xpos+1.6:boss9c_xpos=boss9c_xpos+1.6:boss9d_xpos=boss9d_xpos+1.6
    rocket1_xpos=rocket1_xpos+0.8:rocket2_xpos=rocket2_xpos+0.8:rocket3_xpos=rocket3_xpos+0.8:rocket4_xpos=rocket4_xpos+0.8
    boss_vertical_flag=1

  return

boss9_move_left

    boss9a_xpos=boss9a_xpos-1.6:boss9b_xpos=boss9b_xpos-1.6:boss9c_xpos=boss9c_xpos-1.6:boss9d_xpos=boss9d_xpos-1.6
    rocket1_xpos=rocket1_xpos-0.8:rocket2_xpos=rocket2_xpos-0.8:rocket3_xpos=rocket3_xpos-0.8:rocket4_xpos=rocket4_xpos-0.8
    boss_vertical_flag=2

  return

 ; ##################################################################################################################################################################3
 
    data sfx_museboom_boss9
    $10,$10,$00 ; version, priority, frames per chunk
    $15,$04,$0b ; first chunk of freq,channel,volume
    $12,$0c,$0b
    $1e,$04,$0d
    $16,$04,$0b
    $04,$06,$0c
    $1c,$0c,$0d
    $0a,$0c,$0b
    $15,$04,$0c
    $1a,$0c,$0a
    $0c,$0c,$0d
    $13,$0c,$0a
    $15,$04,$0a
    $1a,$0c,$0a
    $05,$06,$09
    $0b,$0c,$09
    $16,$04,$0d
    $13,$0c,$08
    $13,$0c,$0d
    $0b,$0c,$0d
    $06,$06,$0b
    $1d,$0c,$09
    $10,$0c,$0b
    $1e,$04,$0c
    $05,$06,$0a
    $05,$06,$0b
    $0b,$0c,$0a
    $1c,$04,$0d
    $05,$06,$0b
    $18,$0c,$0c
    $0c,$0c,$0c
    $1b,$07,$0d
    $15,$0c,$0d
    $14,$0c,$0b
    $0b,$0c,$0d
    $1e,$0c,$0b
    $1b,$0c,$0c
    $0b,$0c,$0c
    $0d,$0c,$0d
    $1a,$0c,$09
    $15,$0c,$09
    $0a,$0c,$0a
    $06,$06,$07
    $17,$0c,$09
    $10,$0c,$08
    $1b,$0c,$07
    $06,$06,$06
    $17,$0c,$07
    $0c,$0c,$07
    $06,$06,$07
    $0e,$0f,$07
    $14,$0c,$07
    $10,$0c,$04
    $1a,$0c,$05
    $12,$0c,$04
    $1c,$0c,$03
    $14,$0c,$03
    $1e,$0c,$03
    $1d,$07,$02
    $08,$06,$01
    $16,$0c,$01
    $15,$0c,$01
    $00,$00,$00
end


 bank 14
  
   newblock
    incgraphic gfx/ex2/boss10a.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss10b.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss10c.png 160A 1 0 2 3
    incgraphic gfx/ex2/boss10d.png 160A 1 0 2 3

boss10_battle
    playsfx sfx_museboom_boss10
    savescreen
    ;──═◙ Set Palette Colors
     P0C1 = $F7 : P0C2 = $1C : P0C3 = $0F  ; City Defense Beam              
     P1C1 = $0F : P1C2 = $46 : P1C3 = $08  ; Drone: c1 rotors  c2 body  c3 middle
     P2C1 = $42 : P2C2 = $4A : P2C3 = $0C  ; Drone Laser  
     P3C1 = $38 : P3C2 = $36 : P3C3 = $32  ; Top Enemy Vehicle
     P4C1 = $08 : P4C2 = $0A : P4C3 = $0F  ; Top Line of Scrolling Background  |  C1:shadow  C2:bldg color  C3:window color
     P5C1 = $82 : P5C2 = $84 : P5C3 = $96  ; Middle Enemy Vehicle & Missile
     P6C1 = $42 : P6C2 = $44 : P6C3 = $46  ; Bottom Enemy Vehicle & Laser
    ;P7C1 = $02 : P7C2 = $04 : P7C3 = $06  ; level 1 city color
    ;P4C1 = $12 : P4C2 = $16 : P4C3 = $0A  ; level 2 city color
    ;P4C1 = $22 : P4C2 = $26 : P4C3 = $08  ; level 3 city color
    ;P4C1 = $32 : P4C2 = $36 : P4C3 = $0A  ; level 4 city color
    ;P4C1 = $62 : P4C2 = $66 : P4C3 = $08  ; level 5 city color
    ;P4C1 = $52 : P4C2 = $56 : P4C3 = $0A  ; level 6 city color
    ;P4C1 = $42 : P4C2 = $46 : P4C3 = $08  ; level 7 city color
    ;P4C1 = $72 : P4C2 = $76 : P4C3 = $0A  ; level 8 city color 
    ;P4C1 = $82 : P4C2 = $86 : P4C3 = $08  ; level 9 city color
    ;P4C1 = $A2 : P4C2 = $A6 : P4C3 = $0A  ; level 10 city color
    ;P4C1 = $C2 : P4C2 = $C6 : P4C3 = $0A  ; level 11 city color

    if levelLo=$02 then P4C1=$12:P4C2=$16:P4C3=$0A
    if levelLo=$03 then P4C1=$22:P4C2=$26:P4C3=$08
    if levelLo=$04 then P4C1=$32:P4C2=$36:P4C3=$0A
    if levelLo=$05 then P4C1=$62:P4C2=$66:P4C3=$08
    if levelLo=$06 then P4C1=$52:P4C2=$56:P4C3=$0A
    if levelLo=$07 then P4C1=$42:P4C2=$46:P4C3=$08
    if levelLo=$08 then P4C1=$72:P4C2=$76:P4C3=$0A
    if levelLo=$09 then P4C1=$82:P4C2=$86:P4C3=$08
    if levelLo=$10 then P4C1=$A2:P4C2=$A6:P4C3=$0A
    if levelLo>$10 then P4C1=$C2:P4C2=$C6:P4C3=$0A

    ;──═◙ Set Drone Health for this Boss Battle
    healthHi = $00 : healthMed = $00 : healthLo = $51

    ;──═◙ Set Boss Health for this battle
    bossHi = $00 : bossMed = $00 : bossLo = $60

    ;──═◙ Set Initial values for Boss Frame Counters
    boss_move_counter=0 :  boss_counter = 0

    ;──═◙ Set Initial Location for Boss
    boss10a_xpos = 200.0 : boss10a_ypos = 132.1
    boss10b_xpos = 200.0 : boss10b_ypos = 140.1
    boss10c_xpos = 200.0 : boss10c_ypos = 148.1
    boss10d_xpos = 200.0 : boss10d_ypos = 156.1

    drone_xpos=0:drone_ypos=22

    boss_vertical_flag=0
    boss_init_counter = 0

    direction = 0

    scorea=scorea+100

boss10_battle_transition

    BACKGRND=$00

    if drone_xpos<70 then drone_xpos=drone_xpos+1

    ;──═◙ Increment frame and animation counters
    frame_counter=frame_counter+1
    if frame_counter>2 then frame_counter=0
    if frame_counter=2 then animate1=animate1+1
    if animate1>3 then animate1=0 

    ;──═◙ Move boss in from the right side of the screen
    boss10a_xpos=boss10a_xpos-0.8:boss10b_xpos=boss10b_xpos-0.8:boss10c_xpos=boss10c_xpos-0.8:boss10d_xpos=boss10d_xpos-0.8
    rocket1_xpos=rocket1_xpos-0.8:rocket2_xpos=rocket2_xpos-0.8:rocket3_xpos=rocket3_xpos-0.8:rocket4_xpos=rocket4_xpos-0.8

    restorescreen

    plotchars 'boss health:' 3 0 22
    plotchars 'drone health:' 3 84 22
    plotvalue    scoredigits      3     scoref       6       50    22    ; Boss Health
    plotvalue    scoredigits      3     scored       6       137   22    ; Drone Health  
    plotsprite boss10a 5 boss10a_xpos boss10a_ypos
    plotsprite boss10b 5 boss10b_xpos boss10b_ypos
    plotsprite boss10c 5 boss10c_xpos boss10c_ypos
    plotsprite boss10d 5 boss10d_xpos boss10d_ypos
    plotsprite drone1 1 drone_xpos drone_ypos animate1 
 
    drawscreen

    if boss10a_xpos>20 then goto boss10_battle_transition

boss10_battle_init

    ;──═◙ Set Initial Location for Boss
    boss10a_xpos = 20.0 : boss10a_ypos = 132.1
    boss10b_xpos = 20.0 : boss10b_ypos = 140.1
    boss10c_xpos = 20.0 : boss10c_ypos = 148.1
    boss10d_xpos = 20.0 : boss10d_ypos = 156.1

    ;──═◙ Set Boss Movement Flags
    boss_move_flag1=0  :  boss_move_flag2=0  :  boss_move_flag3=0   :  boss_move_flag4=0 

    ;──═◙ Set Initial Location for Boss Rockets
    rocket1_xpos = 42.0 : rocket1_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket2_xpos = 54.0 : rocket2_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket3_xpos = 77.0 : rocket3_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos
    rocket4_xpos = 89.0 : rocket4_ypos = 130.0 : rocket4_xpos_save = rocket4_xpos

    fire_debounce_1=0

    boss_vertical_flag=1

boss10_battle_loop

    boss_counter=boss_counter+1
    if boss_counter>254 then boss_counter=0
    if boss_init_counter<30 then boss_init_counter=boss_init_counter+1
    if boss_init_counter=30 then boss_init_counter=30
    if boss_init_counter<30 then rocket1_xpos_save=boss10a_xpos+12 : rocket2_xpos_save=boss10a_xpos+34 : rocket3_xpos_save=boss10a_xpos+57 : rocket4_xpos_save=boss10a_xpos+69

    
    BACKGRND=$00

    ;──═◙ Increment frame and animation counters
    frame_counter=frame_counter+1
    if frame_counter>2 then frame_counter=0
    if frame_counter=2 then animate1=animate1+1
    if animate1>3 then animate1=0 
    animate2=animate2+1
    if animate2>2 then animate2=0

    ;──═◙ Check for Game Over if drone health reaches zero
    if healthLo=$00 && healthMed = $01 then goto skiphealthcheck_boss10
    if healthLo<$01 || healthMed>$01 then healthLo=$00:healthMed=$00:player_flag=1:return; if health falls to zero, you are dead - add animation, explosion, game over, etc.
skiphealthcheck_boss10

    ;──═◙ Move Boss Left and Right
    if boss_counter>100 && boss_counter<180 then goto skip_boss10_move
    if boss10a_xpos>96 then boss_move_counter=1
    if boss10a_xpos<2 then boss_move_counter=0
    if boss_move_counter=0 then gosub boss10_move_right
    if boss_move_counter=1 then gosub boss10_move_left
skip_boss10_move

    if boss10a_ypos>134 then boss_vertical_flag=1    ;too far down, set vertical flag to move up
    if boss10a_ypos<100 then boss_vertical_flag=2    ;too far up, set vertical flag to move down

boss10_up_only
    if boss_counter>80 && boss_counter<160 && boss_vertical_flag=1 then gosub boss10_move_up

boss10_down_only
    if boss_counter>160 && boss_counter<240 && boss_vertical_flag=2 then gosub boss10_move_down

    if rocket1_ypos=136 then gosub sfx_plainlaser

    ;──═◙  Boss Fire cannons 
    if rocket1_ypos<8 then rocket1_ypos=130.0:rocket1_xpos_save=rocket1_xpos:rocket2_xpos_save=rocket2_xpos:rocket3_xpos_save=rocket3_xpos:rocket4_xpos_save=rocket4_xpos:gosub sfx_plainlaser
    rocket1_ypos=rocket1_ypos-1.8
    if rocket2_ypos<8 then rocket2_ypos=130.0:gosub sfx_plainlaser
    rocket2_ypos=rocket2_ypos-1.8
    if rocket3_ypos<8 then rocket3_ypos=130.0:gosub sfx_plainlaser
    rocket3_ypos=rocket3_ypos-1.8
    if rocket4_ypos<8 then rocket4_ypos=130.0:gosub sfx_plainlaser
    rocket4_ypos=rocket4_ypos-1.8


    ;──═◙ Check for Game Reset
    if switchreset then reboot

    ;──═◙ Debounce Fire Buttons
    if joy0fire1 then fire_debounce_1=1  ; Left Button
    if !joy0fire1 && fire_debounce_1=1 then fire_debounce_1=2
 
    ;──═◙ Move the drone on the screen
    if joy0right then drone_xpos=drone_xpos+1+drone_speed
    if joy0left then drone_xpos=drone_xpos-1-drone_speed
    if joy0up then drone_ypos=drone_ypos-1-drone_speed
    if joy0down then drone_ypos=drone_ypos+1+drone_speed

    ;──═◙ Keep the drone on the screen
    if drone_ypos>90 then drone_ypos=90
    if drone_ypos<8 then drone_ypos=8
    if drone_xpos<8 then drone_xpos=8
    if drone_xpos>128 then drone_xpos=128


    if laser_counter>10 then laser_fire_flag=1 
    if fire_debounce_1=1 then laser_counter=laser_counter+1 else laser_fire_flag=0:laser_counter=0

    ;──═◙ Detect Boss Hit
    if crosshair_x_offset_1=200 then goto skip_boss10_coll 
    asm
    QBOXCOLLISIONCHECK boss10b_xpos,boss10b_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1
    asm
    QBOXCOLLISIONCHECK boss10c_xpos,boss10c_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1
    asm
    QBOXCOLLISIONCHECK boss10d_xpos,boss10d_ypos,64,8,crosshair_x_offset_1,laser_y_offset_10,4,4
end
    if CARRY then dec scoref=scoref-1
skip_boss10_coll

    ;──═◙ Detect Drone Hit
    asm
    QBOXCOLLISIONCHECK rocket1_xpos,rocket1_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone
    asm
    QBOXCOLLISIONCHECK rocket2_xpos,rocket2_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone
    asm
    QBOXCOLLISIONCHECK rocket3_xpos,rocket3_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone
    asm
    QBOXCOLLISIONCHECK rocket4_xpos,rocket4_ypos,3,4,drone_xpos,drone_ypos,16,8
end
    if CARRY then dec scored=scored-1:gosub sfx_missiles:gosub shake_drone

   ; this sets the defeated flag for Boss 10
   if bossLo<$50 then gosub switch_screen bank2:healthHi = $00 : healthMed = $05 : healthLo = $00:transition_flag=0:boss10_defeated_flag=1:levelLo=$11:return

   restorescreen

    plotchars 'boss health:' 3 0 22
    plotchars 'drone health:' 3 84 22
    plotvalue    scoredigits      3     scoref       6       50    22    ; Boss Health
    plotvalue    scoredigits      3     scored       6       137   22    ; Drone Health  
    plotsprite boss10a 5 boss10a_xpos boss10a_ypos
    plotsprite boss10b 5 boss10b_xpos boss10b_ypos
    plotsprite boss10c 5 boss10c_xpos boss10c_ypos
    plotsprite boss10d 5 boss10d_xpos boss10d_ypos

    plotsprite bomb_large_up 6 rocket1_xpos_save rocket1_ypos
    plotsprite bomb_large_up 6 rocket2_xpos_save rocket2_ypos
    plotsprite bomb_large_up 6 rocket3_xpos_save rocket3_ypos
    plotsprite bomb_large_up 6 rocket4_xpos_save rocket4_ypos

    if joy0left then plotsprite      drone1_left     1      drone_xpos      drone_ypos      animate1        : goto skip_next_boss10
    if joy0right then plotsprite     drone1_right    1      drone_xpos      drone_ypos      animate1        : goto skip_next_boss10
    plotsprite      drone1                      1      drone_xpos      drone_ypos      animate1        ; Drone
skip_next_boss10

    ;──═◙ Plot the laser when you press the fire button
    ;if joy0left || joy0right then goto skiplaserfire_boss10  ; You can only fire when you're not moving
    ;if joy0up || joy0down then goto skiplaserfire_boss10     ; ...
    if laser_fire_flag=1 then goto skiplaserfire_boss10
    if drone_ypos<22 then goto skiplaserfire_boss10 ; If you are too high up you can't fire
    if fire_debounce_1=1 then gosub sfx_pulsecannon bank2:gosub draw_laser bank2
    if fire_debounce_1<>1 then crosshair_x_offset_1=200
skiplaserfire_boss10

   drawscreen
   
  goto boss10_battle_loop
  
boss10_move_up

    boss10a_ypos=boss10a_ypos-0.6:boss10b_ypos=boss10b_ypos-0.6:boss10c_ypos=boss10c_ypos-0.6:boss10d_ypos=boss10d_ypos-0.6
    rocket1_ypos=rocket1_ypos-0.6:rocket2_ypos=rocket1_ypos-0.6:rocket3_ypos=rocket1_ypos-0.6:rocket4_ypos=rocket1_ypos-0.6

  return

boss10_move_down

    boss10a_ypos=boss10a_ypos+0.6:boss10b_ypos=boss10b_ypos+0.6:boss10c_ypos=boss10c_ypos+0.6:boss10d_ypos=boss10d_ypos+0.6
    rocket1_ypos=rocket1_ypos+0.6:rocket2_ypos=rocket1_ypos+0.6:rocket3_ypos=rocket1_ypos+0.6:rocket4_ypos=rocket1_ypos+0.6

  return

boss10_move_right

    boss10a_xpos=boss10a_xpos+1.6:boss10b_xpos=boss10b_xpos+1.6:boss10c_xpos=boss10c_xpos+1.6:boss10d_xpos=boss10d_xpos+1.6
    rocket1_xpos=rocket1_xpos+0.8:rocket2_xpos=rocket2_xpos+0.8:rocket3_xpos=rocket3_xpos+0.8:rocket4_xpos=rocket4_xpos+0.8
    boss_vertical_flag=1

  return

boss10_move_left

    boss10a_xpos=boss10a_xpos-1.6:boss10b_xpos=boss10b_xpos-1.6:boss10c_xpos=boss10c_xpos-1.6:boss10d_xpos=boss10d_xpos-1.6
    rocket1_xpos=rocket1_xpos-0.8:rocket2_xpos=rocket2_xpos-0.8:rocket3_xpos=rocket3_xpos-0.8:rocket4_xpos=rocket4_xpos-0.8
    boss_vertical_flag=2

  return

 ; ##################################################################################################################################################################3
 
    data sfx_museboom_boss10
    $10,$10,$00 ; version, priority, frames per chunk
    $15,$04,$0b ; first chunk of freq,channel,volume
    $12,$0c,$0b
    $1e,$04,$0d
    $16,$04,$0b
    $04,$06,$0c
    $1c,$0c,$0d
    $0a,$0c,$0b
    $15,$04,$0c
    $1a,$0c,$0a
    $0c,$0c,$0d
    $13,$0c,$0a
    $15,$04,$0a
    $1a,$0c,$0a
    $05,$06,$09
    $0b,$0c,$09
    $16,$04,$0d
    $13,$0c,$08
    $13,$0c,$0d
    $0b,$0c,$0d
    $06,$06,$0b
    $1d,$0c,$09
    $10,$0c,$0b
    $1e,$04,$0c
    $05,$06,$0a
    $05,$06,$0b
    $0b,$0c,$0a
    $1c,$04,$0d
    $05,$06,$0b
    $18,$0c,$0c
    $0c,$0c,$0c
    $1b,$07,$0d
    $15,$0c,$0d
    $14,$0c,$0b
    $0b,$0c,$0d
    $1e,$0c,$0b
    $1b,$0c,$0c
    $0b,$0c,$0c
    $0d,$0c,$0d
    $1a,$0c,$09
    $15,$0c,$09
    $0a,$0c,$0a
    $06,$06,$07
    $17,$0c,$09
    $10,$0c,$08
    $1b,$0c,$07
    $06,$06,$06
    $17,$0c,$07
    $0c,$0c,$07
    $06,$06,$07
    $0e,$0f,$07
    $14,$0c,$07
    $10,$0c,$04
    $1a,$0c,$05
    $12,$0c,$04
    $1c,$0c,$03
    $14,$0c,$03
    $1e,$0c,$03
    $1d,$07,$02
    $08,$06,$01
    $16,$0c,$01
    $15,$0c,$01
    $00,$00,$00
end


 bank 15

  ; Hold the fire button to scroll through numbers more quickly, without fire each one is debounced

password_logic

  if pwdpos1=1 && joy0up && joy0fire then password1=password1+1
  if pwdpos1=1 && joy0down && joy0fire then password1=password1-1

  if pwdpos2=1 && joy0up && joy0fire then password2=password2+1
  if pwdpos2=1 && joy0down && joy0fire then password2=password2-1

  if pwdpos3=1 && joy0up && joy0fire then password3=password3+1
  if pwdpos3=1 && joy0down && joy0fire then password3=password3-1

  if pwdpos4=1 && joy0up && joy0fire then password4=password4+1
  if pwdpos4=1 && joy0down && joy0fire then password4=password4-1

  if pwdpos5=1 && joy0up && joy0fire then password5=password5+1
  if pwdpos5=1 && joy0down && joy0fire then password5=password5-1

  if pwdpos6=1 && joy0up&& joy0fire  then password6=password6+1
  if pwdpos6=1 && joy0down && joy0fire then password6=password6-1

  if pwdpos7=1 && joy0up && joy0fire then password7=password7+1
  if pwdpos7=1 && joy0down && joy0fire then password7=password7-1

  if pwdpos8=1 && joy0up && joy0fire then password8=password8+1
  if pwdpos8=1 && joy0down && joy0fire then password8=password8-1

   
  if pwdpos1=1 && joy0up && debounce_up=6 then password1=password1+1
  if pwdpos1=1 && joy0down && debounce_down=6 then password1=password1-1

  if pwdpos2=1 && joy0up && debounce_up=6 then password2=password2+1
  if pwdpos2=1 && joy0down && debounce_down=6 then password2=password2-1

  if pwdpos3=1 && joy0up && debounce_up=6 then password3=password3+1
  if pwdpos3=1 && joy0down && debounce_down=6 then password3=password3-1

  if pwdpos4=1 && joy0up && debounce_up=6 then password4=password4+1
  if pwdpos4=1 && joy0down && debounce_down=6 then password4=password4-1

  if pwdpos5=1 && joy0up && debounce_up=6 then password5=password5+1
  if pwdpos5=1 && joy0down && debounce_down=6 then password5=password5-1

  if pwdpos6=1 && joy0up&& debounce_up=6  then password6=password6+1
  if pwdpos6=1 && joy0down && debounce_down=6 then password6=password6-1

  if pwdpos7=1 && joy0up && debounce_up=6 then password7=password7+1
  if pwdpos7=1 && joy0down && debounce_down=6 then password7=password7-1

  if pwdpos8=1 && joy0up && debounce_up=6 then password8=password8+1
  if pwdpos8=1 && joy0down && debounce_down=6 then password8=password8-1

      ;──═◙ Change the color of the selected menu item
    ;--------------------------
    ; This changes the color of the menu item you're on, making it easier to keep track of which menu item you're currently selecting.  
    if pwdpos1=1 then pwdcolor1=7:pwdcolor2=2:pwdcolor3=2:pwdcolor4=2:pwdcolor5=2:pwdcolor6=2:pwdcolor7=2:pwdcolor8=2
    if pwdpos2=1 then pwdcolor1=2:pwdcolor2=7:pwdcolor3=2:pwdcolor4=2:pwdcolor5=2:pwdcolor6=2:pwdcolor7=2:pwdcolor8=2
    if pwdpos3=1 then pwdcolor1=2:pwdcolor2=2:pwdcolor3=7:pwdcolor4=2:pwdcolor5=2:pwdcolor6=2:pwdcolor7=2:pwdcolor8=2
    if pwdpos4=1 then pwdcolor1=2:pwdcolor2=2:pwdcolor3=2:pwdcolor4=7:pwdcolor5=2:pwdcolor6=2:pwdcolor7=2:pwdcolor8=2
    if pwdpos5=1 then pwdcolor1=2:pwdcolor2=2:pwdcolor3=2:pwdcolor4=2:pwdcolor5=7:pwdcolor6=2:pwdcolor7=2:pwdcolor8=2
    if pwdpos6=1 then pwdcolor1=2:pwdcolor2=2:pwdcolor3=2:pwdcolor4=2:pwdcolor5=2:pwdcolor6=7:pwdcolor7=2:pwdcolor8=2
    if pwdpos7=1 then pwdcolor1=2:pwdcolor2=2:pwdcolor3=2:pwdcolor4=2:pwdcolor5=2:pwdcolor6=2:pwdcolor7=7:pwdcolor8=2
    if pwdpos8=1 then pwdcolor1=2:pwdcolor2=2:pwdcolor3=2:pwdcolor4=2:pwdcolor5=2:pwdcolor6=2:pwdcolor7=2:pwdcolor8=7

 return

check_password

   ; if transition_flag=1 then transition_timer=transition_timer+1
   ; if transition_flag=1 && transition_timer<100 then gosub move_sprites_offscreen
   ; if transition_flag=1 && transition_timer>90 then gosub sfx_defense_beam: BACKGRND=$40
   ; if transition_timer=99 && level_flag=2 && boss1_defeated_flag=0 then transition_flag=0:gosub boss_l2 bank8:gosub level_up bank2     ; 5,000    goes to boss1_battle bank5
   ; if transition_timer=99 && level_flag=4 && boss2_defeated_flag=0 then transition_flag=0:gosub boss_l3 bank8:gosub level_up bank2     ; 10,000   goes to boss2_battle bank5
   ; if transition_timer=99 && level_flag=6 && boss3_defeated_flag=0 then transition_flag=0:gosub boss_l4 bank8:gosub level_up bank2     ; 20,000   goes to boss3_battle bank5
   ; if transition_timer=99 && level_flag=8 && boss4_defeated_flag=0 then transition_flag=0:gosub boss_l5 bank8:gosub level_up bank2
   ; if transition_timer=99 && level_flag=10 && boss5_defeated_flag=0 then transition_flag=0:gosub boss_l6 bank8:gosub level_up bank2
   ; if transition_timer=99 && level_flag=12 && boss6_defeated_flag=0 then transition_flag=0:gosub boss_l7 bank8:gosub level_up bank2
   ; if transition_timer=99 && level_flag=14 && boss7_defeated_flag=0 then transition_flag=0:gosub boss_l8 bank8:gosub level_up bank2
   ; if transition_timer=99 && level_flag=16 && boss8_defeated_flag=0 then transition_flag=0:gosub boss_l9 bank8:gosub level_up bank2
   ; if transition_timer=99 && level_flag=18 && boss9_defeated_flag=0 then transition_flag=0:gosub boss_l10 bank8:gosub level_up bank2
   ; if transition_timer=99 && level_flag=20 && boss10_defeated_flag=0 then transition_flag=0:gosub boss_l11 bank8:gosub level_up bank2

  ; Add developer passwords for god mode, unlimited laser

    ; Easy
    if password1= $01 && password2= $00 && password3= $00 && password4= $00 && password5= $00 && password6= $00 && password7= $00 && password8= $00 then start_option=1    ; 01 00 00 00 00 00 00 00 ; For Testing
    if password1= $01 && password2= $FA && password3= $2A && password4= $19 && password5= $3F && password6= $FC && password7= $00 && password8= $29 then start_option=1    ; 01 FA 2A 19 3F FC 00 29 
    if password1= $02 && password2= $0B && password3= $10 && password4= $07 && password5= $15 && password6= $03 && password7= $0E && password8= $26 then start_option=2    ; 02 0B 10 07 15 03 0E 26 
    if password1= $03 && password2= $0C && password3= $1B && password4= $10 && password3= $13 && password6= $00 && password7= $22 && password8= $39 then start_option=3    ; 03 0C 1B 10 13 00 22 39 
    if password1= $04 && password2= $0A && password3= $00 && password4= $01 && password5= $3B && password6= $00 && password7= $F8 && password8= $00 then start_option=4    ; 04 0A 00 01 3B 00 F8 00 
    if password1= $05 && password2= $00 && password3= $25 && password4= $08 && password5= $28 && password6= $00 && password7= $0C && password8= $F7 then start_option=5    ; 05 00 25 08 28 00 0C F7 
    if password1= $06 && password2= $05 && password3= $09 && password4= $0A && password5= $3C && password6= $4B && password7= $2C && password8= $27 then start_option=6    ; 06 05 09 0A 3C 4B 2C 27 
    if password1= $07 && password2= $12 && password3= $21 && password4= $2C && password5= $01 && password6= $4C && password7= $FA && password8= $17 then start_option=7    ; 07 12 21 2C 01 4C FA 17 
    if password1= $08 && password2= $EF && password3= $0B && password4= $33 && password5= $0E && password6= $0A && password7= $4F && password8= $15 then start_option=8    ; 08 EF 0B 33 0E 0A 4F 15 
    if password1= $09 && password2= $34 && password3= $F8 && password4= $F9 && password5= $2A && password6= $25 && password7= $03 && password8= $09 then start_option=9    ; 09 34 F8 F9 2A 25 03 09 
    if password1= $0A && password2= $11 && password3= $28 && password4= $FF && password5= $33 && password6= $23 && password7= $01 && password8= $0A then start_option=10   ; 0A 11 28 FF 33 23 01 0A 
    if password1= $0B && password2= $2C && password3= $0C && password4= $FB && password5= $0B && password6= $00 && password7= $10 && password8= $00 then start_option=11   ; 0B 2C 0C FB 0B 00 10 00 
    if password1= $0C && password2= $1F && password3= $01 && password4= $0B && password5= $16 && password6= $13 && password7= $30 && password8= $0B then start_option=12   ; 0C 1F 01 0B 16 13 30 0B 
    if password1= $0D && password2= $0A && password3= $00 && password4= $21 && password5= $00 && password6= $0B && password7= $3B && password8= $00 then start_option=13   ; 0D 0A 00 21 00 0B 3B 00 
    if password1= $0E && password2= $25 && password3= $35 && password4= $00 && password5= $00 && password6= $00 && password7= $00 && password8= $2A then start_option=14   ; 0E 25 35 00 00 00 00 2A 
    if password1= $0F && password2= $FB && password3= $22 && password4= $04 && password5= $0C && password6= $00 && password7= $00 && password8= $0B then start_option=15   ; 0F FB 22 04 0C 00 00 0B 
    if password1= $10 && password2= $1F && password3= $02 && password4= $36 && password5= $18 && password6= $22 && password7= $28 && password8= $0C then start_option=16   ; 10 1F 02 36 18 22 28 0C 
    if password1= $11 && password2= $0E && password3= $06 && password4= $F8 && password5= $16 && password6= $31 && password7= $26 && password8= $2A then start_option=17   ; 11 0E 06 F8 16 31 26 2A 
    if password1= $12 && password2= $10 && password3= $03 && password4= $20 && password5= $02 && password6= $37 && password7= $22 && password8= $23 then start_option=18   ; 12 10 03 20 02 37 22 23 
    if password1= $13 && password2= $15 && password3= $18 && password4= $06 && password5= $01 && password6= $10 && password7= $12 && password8= $03 then start_option=19   ; 13 15 18 06 01 10 12 03 
    if password1= $14 && password2= $3B && password3= $04 && password4= $FA && password5= $19 && password6= $06 && password7= $0C && password8= $38 then start_option=20   ; 14 3B 04 FA 19 06 0C 38 

    ; Standard     
    if password1= $15 && password2= $FC && password3= $00 && password4= $FA && password5= $2A && password6= $30 && password7= $00 && password8= $19 then start_option=21   ; 15 FC 00 FA 2A 30 00 19 
    if password1= $16 && password2= $03 && password3= $0E && password4= $0B && password5= $10 && password6= $31 && password7= $0E && password8= $07 then start_option=22   ; 16 03 0E 0B 10 31 0E 07 
    if password1= $17 && password2= $00 && password3= $22 && password4= $0C && password3= $1B && password6= $F8 && password7= $22 && password8= $10 then start_option=23   ; 17 00 22 0C 1B F8 22 10 
    if password1= $18 && password2= $00 && password3= $F8 && password4= $0A && password5= $00 && password6= $0C && password7= $F8 && password8= $01 then start_option=24   ; 18 00 F8 0A 00 0C F8 01 
    if password1= $19 && password2= $2C && password3= $0C && password4= $10 && password5= $25 && password6= $25 && password7= $0C && password8= $08 then start_option=25   ; 19 2C 0C 10 25 25 0C 08 
    if password1= $20 && password2= $1F && password3= $01 && password4= $27 && password5= $09 && password6= $00 && password7= $2C && password8= $0A then start_option=26   ; 20 1F 01 27 09 00 2C 0A 
    if password1= $21 && password2= $0A && password3= $00 && password4= $0A && password5= $21 && password6= $FB && password7= $FA && password8= $2C then start_option=27   ; 21 0A 00 0A 21 FB FA 2C 
    if password1= $22 && password2= $25 && password3= $35 && password4= $13 && password5= $0B && password6= $2C && password7= $4F && password8= $33 then start_option=28   ; 22 25 35 13 0B 2C 4F 33 
    if password1= $23 && password2= $FB && password3= $22 && password4= $00 && password5= $F8 && password6= $0E && password7= $03 && password8= $F9 then start_option=29   ; 23 FB 22 00 F8 0E 03 F9 
    if password1= $24 && password2= $1F && password3= $02 && password4= $FF && password5= $28 && password6= $00 && password7= $01 && password8= $FF then start_option=30   ; 24 1F 02 FF 28 00 01 FF 
    if password1= $25 && password2= $0E && password3= $06 && password4= $0B && password5= $0C && password6= $10 && password7= $36 && password8= $18 then start_option=31   ; 25 0E 06 0B 0C 10 36 18 
    if password1= $26 && password2= $10 && password3= $03 && password4= $F6 && password5= $01 && password6= $27 && password7= $F8 && password8= $16 then start_option=32   ; 26 10 03 F6 01 27 F8 16 
    if password1= $27 && password2= $0B && password3= $3B && password4= $0A && password5= $00 && password6= $0A && password7= $20 && password8= $02 then start_option=33   ; 27 0B 3B 0A 00 0A 20 02 
    if password1= $28 && password2= $00 && password3= $00 && password4= $25 && password5= $35 && password6= $13 && password7= $06 && password8= $01 then start_option=34   ; 28 00 00 25 35 13 06 01 
    if password1= $29 && password2= $19 && password3= $3F && password4= $FB && password5= $22 && password6= $00 && password7= $FA && password8= $19 then start_option=35   ; 29 19 3F FB 22 00 FA 19 
    if password1= $3A && password2= $07 && password3= $15 && password4= $1F && password5= $02 && password6= $FF && password7= $28 && password8= $36 then start_option=36   ; 3A 07 15 1F 02 FF 28 36 
    if password1= $3B && password2= $10 && password3= $13 && password4= $0E && password5= $06 && password6= $0B && password7= $26 && password8= $F8 then start_option=37   ; 3B 10 13 0E 06 0B 26 F8 
    if password1= $3C && password2= $01 && password3= $3B && password4= $10 && password5= $03 && password6= $F6 && password7= $22 && password8= $20 then start_option=38   ; 3C 01 3B 10 03 F6 22 20 
    if password1= $3D && password2= $08 && password3= $28 && password4= $15 && password5= $18 && password6= $3B && password7= $12 && password8= $06 then start_option=39   ; 3D 08 28 15 18 3B 12 06 
    if password1= $3E && password2= $7A && password3= $3C && password4= $3B && password5= $04 && password6= $2A && password7= $0C && password8= $FA then start_option=40   ; 3E 7A 3C 3B 04 2A 0C FA 

    ; Advanced   
    if password1= $3F && password2= $2A && password3= $30 && password4= $00 && password5= $2A && password6= $FC && password7= $00 && password8= $FA then start_option=41   ; 3F 2A 30 00 2A FC 00 FA 
    if password1= $40 && password2= $10 && password3= $31 && password4= $0E && password5= $10 && password6= $03 && password7= $0E && password8= $0B then start_option=42   ; 40 10 31 0E 10 03 0E 0B 
    if password1= $41 && password2= $1B && password3= $F8 && password4= $22 && password3= $1B && password6= $00 && password7= $22 && password8= $0C then start_option=43   ; 41 1B F8 22 1B 00 22 0C 
    if password1= $42 && password2= $FA && password3= $0C && password4= $F8 && password5= $11 && password6= $35 && password7= $F8 && password8= $0A then start_option=44   ; 42 FA 0C F8 11 35 F8 0A 
    if password1= $43 && password2= $25 && password3= $25 && password4= $0C && password5= $25 && password6= $2C && password7= $0C && password8= $10 then start_option=45   ; 43 25 25 0C 25 2C 0C 10 
    if password1= $44 && password2= $09 && password3= $00 && password4= $2C && password5= $09 && password6= $1F && password7= $01 && password8= $27 then start_option=46   ; 44 09 00 2C 09 1F 01 27 
    if password1= $45 && password2= $21 && password3= $FB && password4= $FA && password5= $21 && password6= $0A && password7= $35 && password8= $0A then start_option=47   ; 45 21 FB FA 21 0A 35 0A 
    if password1= $46 && password2= $0B && password3= $2C && password4= $4F && password5= $0B && password6= $25 && password7= $35 && password8= $13 then start_option=48   ; 46 0B 2C 4F 0B 25 35 13 
    if password1= $47 && password2= $F8 && password3= $0E && password4= $03 && password5= $F8 && password6= $FB && password7= $22 && password8= $34 then start_option=49   ; 47 F8 0E 03 F8 FB 22 34 
    if password1= $48 && password2= $28 && password3= $00 && password4= $01 && password5= $28 && password6= $1F && password7= $02 && password8= $FF then start_option=50   ; 48 28 00 01 28 1F 02 FF 
    if password1= $49 && password2= $0C && password3= $10 && password4= $36 && password5= $0C && password6= $0E && password7= $06 && password8= $0B then start_option=51   ; 49 0C 10 36 0C 0E 06 0B 
    if password1= $4A && password2= $01 && password3= $27 && password4= $F8 && password5= $01 && password6= $10 && password7= $03 && password8= $F6 then start_option=52   ; 4A 01 27 F8 01 10 03 F6 
    if password1= $4B && password2= $00 && password3= $0A && password4= $20 && password5= $00 && password6= $0B && password7= $3B && password8= $0A then start_option=53   ; 4B 00 0A 20 00 0B 3B 0A 
    if password1= $4C && password2= $35 && password3= $13 && password4= $06 && password5= $35 && password6= $00 && password7= $00 && password8= $25 then start_option=54   ; 4C 35 13 06 35 00 00 25 
    if password1= $4D && password2= $22 && password3= $00 && password4= $FA && password5= $22 && password6= $19 && password7= $3F && password8= $FB then start_option=55   ; 4D 22 00 FA 22 19 3F FB 
    if password1= $4E && password2= $02 && password3= $FF && password4= $28 && password5= $02 && password6= $07 && password7= $15 && password8= $1F then start_option=56   ; 4E 02 FF 28 02 07 15 1F 
    if password1= $4F && password2= $06 && password3= $0B && password4= $26 && password5= $06 && password6= $10 && password7= $13 && password8= $0E then start_option=57   ; 4F 06 0B 26 06 10 13 0E 
    if password1= $50 && password2= $03 && password3= $F6 && password4= $22 && password5= $03 && password6= $01 && password7= $3B && password8= $10 then start_option=58   ; 50 03 F6 22 03 01 3B 10 
    if password1= $51 && password2= $18 && password3= $3B && password4= $12 && password5= $18 && password6= $08 && password7= $28 && password8= $15 then start_option=59   ; 51 18 3B 12 18 08 28 15 
    if password1= $52 && password2= $8A && password3= $2A && password4= $0C && password5= $04 && password6= $0A && password7= $3C && password8= $3B then start_option=60   ; 52 8A 2A 0C 04 0A 3C 3B 

    ; Expert  
    if password1= $53 && password2= $5A && password3= $06 && password4= $0B && password5= $2A && password6= $10 && password7= $33 && password8= $18 then start_option=61   ; 53 5A 06 0B 2A 10 33 18 
    if password1= $54 && password2= $22 && password3= $5B && password4= $F6 && password5= $10 && password6= $27 && password7= $0E && password8= $16 then start_option=62   ; 54 22 5B F6 10 27 0E 16 
    if password1= $55 && password2= $02 && password3= $3B && password4= $5C && password3= $1B && password6= $0E && password7= $22 && password8= $02 then start_option=63   ; 55 02 3B 5C 1B 0E 22 02 
    if password1= $56 && password2= $06 && password3= $00 && password4= $25 && password5= $5D && password6= $10 && password7= $F8 && password8= $01 then start_option=64   ; 56 06 00 25 5D 10 F8 01 
    if password1= $57 && password2= $03 && password3= $3F && password4= $FB && password5= $25 && password6= $5E && password7= $0C && password8= $19 then start_option=65   ; 57 03 3F FB 25 5E 0C 19 
    if password1= $58 && password2= $3B && password3= $2A && password4= $19 && password5= $09 && password6= $00 && password7= $5F && password8= $36 then start_option=66   ; 58 3B 2A 19 09 00 5F 36 
    if password1= $59 && password2= $01 && password3= $10 && password4= $07 && password5= $21 && password6= $19 && password7= $00 && password8= $51 then start_option=67   ; 59 01 10 07 21 19 00 51 
    if password1= $5A && password2= $03 && password3= $1B && password4= $11 && password5= $0B && password6= $07 && password7= $35 && password8= $20 then start_option=68   ; 5A 03 1B 11 0B 07 35 20 
    if password1= $5B && password2= $53 && password3= $32 && password4= $01 && password5= $F8 && password6= $10 && password7= $22 && password8= $06 then start_option=69   ; 5B 53 32 01 F8 10 22 06 
    if password1= $5C && password2= $00 && password3= $54 && password4= $08 && password5= $28 && password6= $01 && password7= $02 && password8= $FA then start_option=70   ; 5C 00 54 08 28 01 02 FA 
    if password1= $5D && password2= $2C && password3= $09 && password4= $55 && password5= $0B && password6= $3B && password7= $0A && password8= $00 then start_option=71   ; 5D 2C 09 55 0B 3B 0A 00 
    if password1= $5E && password2= $1F && password3= $21 && password4= $35 && password5= $56 && password6= $00 && password7= $25 && password8= $35 then start_option=72   ; 5E 1F 21 35 56 00 25 35 
    if password1= $5F && password2= $0A && password3= $0B && password4= $22 && password5= $19 && password6= $57 && password7= $FB && password8= $22 then start_option=73   ; 5F 0A 0B 22 19 57 FB 22 
    if password1= $60 && password2= $25 && password3= $F8 && password4= $02 && password5= $07 && password6= $15 && password7= $58 && password8= $02 then start_option=74   ; 60 25 F8 02 07 15 58 02 
    if password1= $61 && password2= $FB && password3= $00 && password4= $06 && password5= $10 && password6= $13 && password7= $0E && password8= $59 then start_option=75   ; 61 FB 00 06 10 13 0E 59 
    if password1= $62 && password2= $FF && password3= $00 && password4= $03 && password5= $01 && password6= $3B && password7= $10 && password8= $03 then start_option=76   ; 62 FF 00 03 01 3B 10 03 
    if password1= $63 && password2= $5B && password3= $00 && password4= $18 && password5= $08 && password6= $28 && password7= $15 && password8= $18 then start_option=77   ; 63 5B 00 18 08 28 15 18 
    if password1= $64 && password2= $F6 && password3= $5C && password4= $04 && password5= $0A && password6= $3C && password7= $3B && password8= $04 then start_option=78   ; 64 F6 5C 04 0A 3C 3B 04 
    if password1= $65 && password2= $3B && password3= $01 && password4= $5D && password5= $16 && password6= $19 && password7= $28 && password8= $00 then start_option=79   ; 65 3B 01 5D 16 19 28 00 
    if password1= $66 && password2= $2A && password3= $5F && password4= $31 && password5= $5E && password6= $22 && password7= $3C && password8= $21 then start_option=80   ; 66 2A 5F 31 5E 22 3C 21 

  if start_option=1 then goto start_option_1      ; 01 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 0 0 0 0 0 0 0 0 0 0, Level 1, 4900 Points
  if start_option=2 then goto start_option_2      ; 02 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 0 0 0 0 0 0 0 0 0, Level 1, 5000 Points

  if start_option=3 then goto start_option_3      ; 03 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 0 0 0 0 0 0 0 0 0, Level 2, 9900 Points
  if start_option=4 then goto start_option_4      ; 04 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 0 0 0 0 0 0 0 0, Level 2, 10000 Points

  if start_option=5 then goto start_option_5     ; 05 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 0 0 0 0 0 0 0 0, Level 3, 19900 Points
  if start_option=6 then goto start_option_6     ; 06 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 0 0 0 0 0 0 0, Level 3, 20000 Points

  if start_option=7 then goto start_option_7     ; 07 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 0 0 0 0 0 0 0, Level 4, 29900 Points
  if start_option=8 then goto start_option_8     ; 08 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 1 0 0 0 0 0 0, Level 4, 30000 Points

  if start_option=9 then goto start_option_9     ; 09 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 1 0 0 0 0 0 0, Level 5, 39900 Points
  if start_option=10 then goto start_option_10   ; 0A 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 1 1 0 0 0 0 0, Level 5, 40000 Points

  if start_option=11 then goto start_option_11   ; 0B 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 1 1 0 0 0 0 0, Level 6, 49900 Points
  if start_option=12 then goto start_option_12   ; 0C 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 1 1 1 0 0 0 0, Level 6, 50000 Points

  if start_option=13 then goto start_option_13   ; 0D 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 1 1 1 0 0 0 0, Level 7, 59900 Points
  if start_option=14 then goto start_option_14   ; 0E 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 1 1 1 1 0 0 0, Level 7, 60000 Points

  if start_option=15 then goto start_option_15   ; 0F 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 1 1 1 1 0 0 0, Level 8, 69900 Points
  if start_option=16 then goto start_option_16   ; 10 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 0 0, Level 8, 70000 Points

  if start_option=17 then goto start_option_17   ; 11 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 0 0, Level 9, 79900 Points
  if start_option=18 then goto start_option_18   ; 12 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 1 0, Level 9, 80000 Points

  if start_option=19 then goto start_option_19   ; 13 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 1 0, Level 10, 89900 Points
  if start_option=20 then goto start_option_20   ; 14 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 1 1, Level 10, 90000 Points


  if start_option=21 then goto start_option_21   ; 15 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 0 0 0 0 0 0 0 0 0 0, Level 1, 4900 Points
  if start_option=22 then goto start_option_22   ; 16 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 0 0 0 0 0 0 0 0 0, Level 1, 5000 Points

  if start_option=23 then goto start_option_23   ; 17 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 0 0 0 0 0 0 0 0 0, Level 2, 9900 Points
  if start_option=24 then goto start_option_24   ; 18 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 0 0 0 0 0 0 0 0, Level 2, 10000 Points

  if start_option=25 then goto start_option_25   ; 19 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 0 0 0 0 0 0 0 0, Level 3, 19900 Points
  if start_option=26 then goto start_option_26   ; 20 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 0 0 0 0 0 0 0, Level 3, 20000 Points

  if start_option=27 then goto start_option_27   ; 21 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 0 0 0 0 0 0 0, Level 4, 29900 Points
  if start_option=28 then goto start_option_28   ; 22 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 1 0 0 0 0 0 0, Level 4, 30000 Points

  if start_option=29 then goto start_option_29   ; 23 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 1 0 0 0 0 0 0, Level 5, 39900 Points
  if start_option=30 then goto start_option_30   ; 24 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 1 1 0 0 0 0 0, Level 5, 40000 Points

  if start_option=31 then goto start_option_31   ; 25 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 1 1 0 0 0 0 0, Level 6, 49900 Points
  if start_option=32 then goto start_option_32   ; 26 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 1 1 1 0 0 0 0, Level 6, 50000 Points

  if start_option=33 then goto start_option_33   ; 27 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 1 1 1 0 0 0 0, Level 7, 59900 Points
  if start_option=34 then goto start_option_34   ; 28 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 1 1 1 1 0 0 0, Level 7, 60000 Points

  if start_option=35 then goto start_option_35   ; 29 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 1 1 1 1 0 0 0, Level 8, 69900 Points
  if start_option=36 then goto start_option_36   ; 2A 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 0 0, Level 8, 70000 Points

  if start_option=37 then goto start_option_37   ; 2B 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 0 0, Level 9, 79900 Points
  if start_option=38 then goto start_option_38   ; 2C 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 1 0, Level 9, 80000 Points

  if start_option=39 then goto start_option_39   ; 2D 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 1 0, Level 10, 89900 Points
  if start_option=40 then goto start_option_40   ; 2E 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 1 1, Level 10, 90000 Points


  if start_option=41 then goto start_option_41   ; 15 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 0 0 0 0 0 0 0 0 0 0, Level 1, 4900 Points
  if start_option=42 then goto start_option_22   ; 16 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 0 0 0 0 0 0 0 0 0, Level 1, 5000 Points

  if start_option=43 then goto start_option_43   ; 17 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 0 0 0 0 0 0 0 0 0, Level 2, 9900 Points
  if start_option=44 then goto start_option_44   ; 18 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 0 0 0 0 0 0 0 0, Level 2, 10000 Points

  if start_option=45 then goto start_option_45   ; 19 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 0 0 0 0 0 0 0 0, Level 3, 19900 Points
  if start_option=46 then goto start_option_46   ; 20 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 0 0 0 0 0 0 0, Level 3, 20000 Points

  if start_option=47 then goto start_option_47   ; 21 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 0 0 0 0 0 0 0, Level 4, 29900 Points
  if start_option=48 then goto start_option_48   ; 22 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 1 0 0 0 0 0 0, Level 4, 30000 Points

  if start_option=49 then goto start_option_49   ; 23 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 1 0 0 0 0 0 0, Level 5, 39900 Points
  if start_option=50 then goto start_option_50   ; 24 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 1 1 0 0 0 0 0, Level 5, 40000 Points

  if start_option=51 then goto start_option_51   ; 25 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 1 1 0 0 0 0 0, Level 6, 49900 Points
  if start_option=52 then goto start_option_52   ; 26 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 1 1 1 0 0 0 0, Level 6, 50000 Points

  if start_option=53 then goto start_option_53   ; 27 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 1 1 1 0 0 0 0, Level 7, 59900 Points
  if start_option=54 then goto start_option_54   ; 28 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 1 1 1 1 0 0 0, Level 7, 60000 Points

  if start_option=55 then goto start_option_55   ; 29 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 1 1 1 1 0 0 0, Level 8, 69900 Points
  if start_option=56 then goto start_option_56   ; 2A 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 0 0, Level 8, 70000 Points

  if start_option=57 then goto start_option_57   ; 2B 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 0 0, Level 9, 79900 Points
  if start_option=58 then goto start_option_58   ; 2C 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 1 0, Level 9, 80000 Points

  if start_option=59 then goto start_option_59   ; 2D 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 1 0, Level 10, 89900 Points
  if start_option=60 then goto start_option_60   ; 2E 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 1 1, Level 10, 90000 Points


  if start_option=61 then goto start_option_61   ; 15 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 0 0 0 0 0 0 0 0 0 0, Level 1, 4900 Points
  if start_option=62 then goto start_option_62   ; 16 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 0 0 0 0 0 0 0 0 0, Level 1, 5000 Points

  if start_option=63 then goto start_option_63   ; 17 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 0 0 0 0 0 0 0 0 0, Level 2, 9900 Points
  if start_option=64 then goto start_option_64   ; 18 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 0 0 0 0 0 0 0 0, Level 2, 10000 Points

  if start_option=65 then goto start_option_65   ; 19 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 0 0 0 0 0 0 0 0, Level 3, 19900 Points
  if start_option=66 then goto start_option_66   ; 20 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 0 0 0 0 0 0 0, Level 3, 20000 Points

  if start_option=67 then goto start_option_67   ; 21 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 0 0 0 0 0 0 0, Level 4, 29900 Points
  if start_option=68 then goto start_option_68   ; 22 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 1 0 0 0 0 0 0, Level 4, 30000 Points

  if start_option=69 then goto start_option_69   ; 23 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 1 0 0 0 0 0 0, Level 5, 39900 Points
  if start_option=70 then goto start_option_70   ; 24 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 1 1 0 0 0 0 0, Level 5, 40000 Points

  if start_option=71 then goto start_option_71   ; 25 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 1 1 0 0 0 0 0, Level 6, 49900 Points
  if start_option=72 then goto start_option_72   ; 26 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 1 1 1 0 0 0 0, Level 6, 50000 Points

  if start_option=73 then goto start_option_73   ; 27 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 1 1 1 0 0 0 0, Level 7, 59900 Points
  if start_option=74 then goto start_option_74   ; 28 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 1 1 1 1 0 0 0, Level 7, 60000 Points

  if start_option=75 then goto start_option_75   ; 29 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 1 1 1 1 0 0 0, Level 8, 69900 Points
  if start_option=76 then goto start_option_76   ; 2A 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 0 0, Level 8, 70000 Points

  if start_option=77 then goto start_option_77   ; 2B 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 0 0, Level 9, 79900 Points
  if start_option=78 then goto start_option_78   ; 2C 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 1 0, Level 9, 80000 Points

  if start_option=79 then goto start_option_79   ; 2D 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 1 0, Level 10, 89900 Points
  if start_option=80 then goto start_option_80   ; 2E 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 1 1, Level 10, 90000 Points

  
start_option_1              ; 01 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 0 0 0 0 0 0 0 0 0 0, Level 1, 4900 Points [fight boss_l2 (boss1_battle) - go to level 2]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=0 : boss2_defeated_flag=0 : boss3_defeated_flag=0 : boss4_defeated_flag=0 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$00 : pointsMed=$49 : pointsLo=$00
   levelLo=$01
   gamedifficulty=0 : debounce_fire=0 : beam_counter=0
   level_flag=2
   transition_flag=1
   goto set_speed bank3


start_option_2              ; 02 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 0 0 0 0 0 0 0 0 0, Level 2, 5000 Points   [boss1 battle complete]  
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=0 : boss3_defeated_flag=0 : boss4_defeated_flag=0 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$00 : pointsMed=$50 : pointsLo=$00
   levelLo=$02
   gamedifficulty=0 : debounce_fire=0 : beam_counter=0
   level_flag=2
   transition_flag=0

   goto set_speed bank3


start_option_3              ; 03 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 0 0 0 0 0 0 0 0 0, Level 2, 9900 Points [fight boss_l3 (boss2_battle) - go to level 3]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=0 : boss3_defeated_flag=0 : boss4_defeated_flag=0 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$00 : pointsMed=$99 : pointsLo=$00
   levelLo=$02
   gamedifficulty=0 : debounce_fire=0 : beam_counter=0
   level_flag=4
   transition_flag=1

   goto set_speed bank3

start_option_4              ; 04 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 0 0 0 0 0 0 0 0, Level 3, 10000 Points [boss2 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=0 : boss4_defeated_flag=0 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$01 : pointsMed=$00 : pointsLo=$00
   levelLo=$03
   gamedifficulty=0 : debounce_fire=0 : beam_counter=0
   level_flag=4
   transition_flag=0

   goto set_speed bank3

start_option_5              ; 05 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 0 0 0 0 0 0 0 0, Level 3, 19900 Points [fight boss_l4 (boss3_battle) - go to level 4]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=0 : boss4_defeated_flag=0 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$01 : pointsMed=$99 : pointsLo=$00
   levelLo=$03
   gamedifficulty=0 : debounce_fire=0 : beam_counter=0
   level_flag=6
   transition_flag=1

   goto set_speed bank3

start_option_6              ; 06 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 0 0 0 0 0 0 0, Level 3, 20000 Points [boss3 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=0 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$02 : pointsMed=$00 : pointsLo=$00
   levelLo=$04
   gamedifficulty=0 : debounce_fire=0 : beam_counter=0
   level_flag=6
   transition_flag=0

   goto set_speed bank3

start_option_7              ; 07 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 0 0 0 0 0 0 0, Level 4, 29900 Points [fight boss_l5 (boss4_battle) - go to level 5]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=0 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$02 : pointsMed=$99 : pointsLo=$00
   levelLo=$04
   gamedifficulty=0 : debounce_fire=0 : beam_counter=0
   level_flag=8
   transition_flag=1

   goto set_speed bank3

start_option_8              ; 08 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 1 0 0 0 0 0 0, Level 4, 30000 Points [boss4 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$03 : pointsMed=$00 : pointsLo=$00
   levelLo=$05
   gamedifficulty=0 : debounce_fire=0 : beam_counter=0
   level_flag=8
   transition_flag=0

   goto set_speed bank3

start_option_9              ; 09 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 1 0 0 0 0 0 0, Level 5, 39900 Points [fight boss_l6 (boss5_battle) - go to level 6]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$03 : pointsMed=$99 : pointsLo=$00
   levelLo=$05
   gamedifficulty=0 : debounce_fire=0 : beam_counter=0
   level_flag=10
   transition_flag=1

   goto set_speed bank3

start_option_10             ; 0A 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 1 1 0 0 0 0 0, Level 5, 40000 Points [boss5 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$04 : pointsMed=$00 : pointsLo=$00
   levelLo=$06
   gamedifficulty=0 : debounce_fire=0 : beam_counter=0
   level_flag=10
   transition_flag=0

   goto set_speed bank3

start_option_11             ; 0B 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 1 1 0 0 0 0 0, Level 6, 49900 Points [fight boss_l7 (boss6_battle) - go to level 7]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$04 : pointsMed=$99 : pointsLo=$00
   levelLo=$06
   gamedifficulty=0 : debounce_fire=0 : beam_counter=0
   level_flag=12
   transition_flag=1

   goto set_speed bank3

start_option_12             ; 0C 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 1 1 1 0 0 0 0, Level 6, 50000 Points [boss6 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$05 : pointsMed=$00 : pointsLo=$00
   levelLo=$07
   gamedifficulty=0 : debounce_fire=0 : beam_counter=0
   level_flag=12
   transition_flag=0

   goto set_speed bank3

start_option_13             ; 0D 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 1 1 1 0 0 0 0, Level 7, 59900 Points [fight boss_l8 (boss7_battle) - go to level 8]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$05 : pointsMed=$99 : pointsLo=$00
   levelLo=$07
   gamedifficulty=0 : debounce_fire=0 : beam_counter=0
   level_flag=14
   transition_flag=1

   goto set_speed bank3

start_option_14             ; 0E 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 1 1 1 1 0 0 0, Level 7, 60000 Points [boss7 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=1 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$06 : pointsMed=$00 : pointsLo=$00
   levelLo=$08
   gamedifficulty=0 : debounce_fire=0 : beam_counter=0
   level_flag=14
   transition_flag=0

   goto set_speed bank3

start_option_15             ; 0F 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 1 1 1 1 0 0 0, Level 8, 69900 Points [fight boss_l9 (boss9_battle) - go to level 9]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=1 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$06 : pointsMed=$99 : pointsLo=$00
   levelLo=$08
   gamedifficulty=0 : debounce_fire=0 : beam_counter=0
   level_flag=16
   transition_flag=1

   goto set_speed bank3

start_option_16             ; 10 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 0 0, Level 8, 70000 Points [boss8 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=1 : boss8_defeated_flag=1 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$07 : pointsMed=$00 : pointsLo=$00
   levelLo=$09
   gamedifficulty=0 : debounce_fire=0 : beam_counter=0
   level_flag=16
   transition_flag=0

   goto set_speed bank3

start_option_17             ; 11 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 0 0, Level 9, 79900 Points [fight boss_l10 (boss9_battle) - go to level 10]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=1 : boss8_defeated_flag=1 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$07 : pointsMed=$99 : pointsLo=$00
   levelLo=$09
   gamedifficulty=0 : debounce_fire=0 : beam_counter=0
   level_flag=18
   transition_flag=1

   goto set_speed bank3

start_option_18             ; 12 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 1 0, Level 9, 80000 Points [boss9 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=1 : boss8_defeated_flag=1 : boss9_defeated_flag=1 : boss10_defeated_flag=0
   pointsHi=$08 : pointsMed=$00 : pointsLo=$00
   levelLo=$10
   gamedifficulty=0 : debounce_fire=0 : beam_counter=0
   level_flag=18
   transition_flag=0

   goto set_speed bank3

start_option_19             ; 13 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 1 0, Level 10, 89900 Points [fight boss_l11 (boss10_battle) - go to level 11]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=1 : boss8_defeated_flag=1 : boss9_defeated_flag=1 : boss10_defeated_flag=0
   pointsHi=$08 : pointsMed=$99 : pointsLo=$00
   levelLo=$10
   gamedifficulty=0 : debounce_fire=0 : beam_counter=0
   level_flag=20
   transition_flag=1

   goto set_speed bank3

start_option_20             ; 14 00 00 00 00 00 00 00 Easy Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 1 1, Level 10, 90000 Points [boss10 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=1 : boss8_defeated_flag=1 : boss9_defeated_flag=1 : boss10_defeated_flag=1
   pointsHi=$09 : pointsMed=$00 : pointsLo=$00
   levelLo=$11
   gamedifficulty=0 : debounce_fire=0 : beam_counter=0
   level_flag=20
   transition_flag=0

   goto set_speed bank3

start_option_21              ; 01 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 0 0 0 0 0 0 0 0 0 0, Level 1, 4900 Points [fight boss_l2 (boss1_battle) - go to level 2]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=0 : boss2_defeated_flag=0 : boss3_defeated_flag=0 : boss4_defeated_flag=0 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$00 : pointsMed=$49 : pointsLo=$00
   levelLo=$01
   gamedifficulty=1 : debounce_fire=0 : beam_counter=0
   level_flag=2
   transition_flag=1

   goto set_speed bank3


start_option_22              ; 02 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 0 0 0 0 0 0 0 0 0, Level 2, 5000 Points   [boss1 battle complete]  
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=0 : boss3_defeated_flag=0 : boss4_defeated_flag=0 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$00 : pointsMed=$50 : pointsLo=$00
   levelLo=$02
   gamedifficulty=1 : debounce_fire=0 : beam_counter=0
   level_flag=2
   transition_flag=0

   goto set_speed bank3


start_option_23              ; 03 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 0 0 0 0 0 0 0 0 0, Level 2, 9900 Points [fight boss_l3 (boss2_battle) - go to level 3]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=0 : boss3_defeated_flag=0 : boss4_defeated_flag=0 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$00 : pointsMed=$99 : pointsLo=$00
   levelLo=$02
   gamedifficulty=1 : debounce_fire=0 : beam_counter=0
   level_flag=4
   transition_flag=1

   goto set_speed bank3

start_option_24              ; 04 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 0 0 0 0 0 0 0 0, Level 3, 10000 Points [boss2 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=0 : boss4_defeated_flag=0 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$01 : pointsMed=$00 : pointsLo=$00
   levelLo=$03
   gamedifficulty=1 : debounce_fire=0 : beam_counter=0
   level_flag=4
   transition_flag=0

   goto set_speed bank3

start_option_25              ; 05 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 0 0 0 0 0 0 0 0, Level 3, 19900 Points [fight boss_l4 (boss3_battle) - go to level 4]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=0 : boss4_defeated_flag=0 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$01 : pointsMed=$99 : pointsLo=$00
   levelLo=$03
   gamedifficulty=1 : debounce_fire=0 : beam_counter=0
   level_flag=6
   transition_flag=1

   goto set_speed bank3

start_option_26              ; 06 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 0 0 0 0 0 0 0, Level 3, 20000 Points [boss3 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=0 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$02 : pointsMed=$00 : pointsLo=$00
   levelLo=$04
   gamedifficulty=1 : debounce_fire=0 : beam_counter=0
   level_flag=6
   transition_flag=0

   goto set_speed bank3

start_option_27              ; 07 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 0 0 0 0 0 0 0, Level 4, 29900 Points [fight boss_l5 (boss4_battle) - go to level 5]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=0 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$02 : pointsMed=$99 : pointsLo=$00
   levelLo=$04
   gamedifficulty=1 : debounce_fire=0 : beam_counter=0
   level_flag=8
   transition_flag=1

   goto set_speed bank3

start_option_28              ; 08 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 1 0 0 0 0 0 0, Level 4, 30000 Points [boss4 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$03 : pointsMed=$00 : pointsLo=$00
   levelLo=$05
   gamedifficulty=1 : debounce_fire=0 : beam_counter=0
   level_flag=8
   transition_flag=0

   goto set_speed bank3

start_option_29              ; 09 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 1 0 0 0 0 0 0, Level 5, 39900 Points [fight boss_l6 (boss5_battle) - go to level 6]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$03 : pointsMed=$99 : pointsLo=$00
   levelLo=$05
   gamedifficulty=1 : debounce_fire=0 : beam_counter=0
   level_flag=10
   transition_flag=1

   goto set_speed bank3

start_option_30             ; 0A 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 1 1 0 0 0 0 0, Level 5, 40000 Points [boss5 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$04 : pointsMed=$00 : pointsLo=$00
   levelLo=$06
   gamedifficulty=1 : debounce_fire=0 : beam_counter=0
   level_flag=10
   transition_flag=0

   goto set_speed bank3

start_option_31             ; 0B 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 1 1 0 0 0 0 0, Level 6, 49900 Points [fight boss_l7 (boss6_battle) - go to level 7]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$04 : pointsMed=$99 : pointsLo=$00
   levelLo=$06
   gamedifficulty=1 : debounce_fire=0 : beam_counter=0
   level_flag=12
   transition_flag=1

   goto set_speed bank3

start_option_32             ; 0C 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 1 1 1 0 0 0 0, Level 6, 50000 Points [boss6 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$05 : pointsMed=$00 : pointsLo=$00
   levelLo=$07
   gamedifficulty=1 : debounce_fire=0 : beam_counter=0
   level_flag=12
   transition_flag=0

   goto set_speed bank3

start_option_33             ; 0D 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 1 1 1 0 0 0 0, Level 7, 59900 Points [fight boss_l8 (boss7_battle) - go to level 8]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$05 : pointsMed=$99 : pointsLo=$00
   levelLo=$07
   gamedifficulty=1 : debounce_fire=0 : beam_counter=0
   level_flag=14
   transition_flag=1

   goto set_speed bank3

start_option_34             ; 0E 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 1 1 1 1 0 0 0, Level 7, 60000 Points [boss7 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=1 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$06 : pointsMed=$00 : pointsLo=$00
   levelLo=$08
   gamedifficulty=1 : debounce_fire=0 : beam_counter=0
   level_flag=14
   transition_flag=0

   goto set_speed bank3

start_option_35             ; 0F 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 1 1 1 1 0 0 0, Level 8, 69900 Points [fight boss_l9 (boss9_battle) - go to level 9]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=1 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$06 : pointsMed=$99 : pointsLo=$00
   levelLo=$08
   gamedifficulty=1 : debounce_fire=0 : beam_counter=0
   level_flag=16
   transition_flag=1

   goto set_speed bank3

start_option_36             ; 10 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 0 0, Level 8, 70000 Points [boss8 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=1 : boss8_defeated_flag=1 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$07 : pointsMed=$00 : pointsLo=$00
   levelLo=$09
   gamedifficulty=1 : debounce_fire=0 : beam_counter=0
   level_flag=16
   transition_flag=0

   goto set_speed bank3

start_option_37             ; 11 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 0 0, Level 9, 79900 Points [fight boss_l10 (boss9_battle) - go to level 10]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=1 : boss8_defeated_flag=1 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$07 : pointsMed=$99 : pointsLo=$00
   levelLo=$09
   gamedifficulty=1 : debounce_fire=0 : beam_counter=0
   level_flag=18
   transition_flag=1

   goto set_speed bank3

start_option_38             ; 12 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 1 0, Level 9, 80000 Points [boss9 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=1 : boss8_defeated_flag=1 : boss9_defeated_flag=1 : boss10_defeated_flag=0
   pointsHi=$08 : pointsMed=$00 : pointsLo=$00
   levelLo=$10
   gamedifficulty=1 : debounce_fire=0 : beam_counter=0
   level_flag=18
   transition_flag=0

   goto set_speed bank3

start_option_39             ; 13 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 1 0, Level 10, 89900 Points [fight boss_l11 (boss10_battle) - go to level 11]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=1 : boss8_defeated_flag=1 : boss9_defeated_flag=1 : boss10_defeated_flag=0
   pointsHi=$08 : pointsMed=$99 : pointsLo=$00
   levelLo=$10
   gamedifficulty=1 : debounce_fire=0 : beam_counter=0
   level_flag=20
   transition_flag=1

   goto set_speed bank3

start_option_40             ; 14 00 00 00 00 00 00 00 Standard Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 1 1, Level 10, 90000 Points [boss10 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=1 : boss8_defeated_flag=1 : boss9_defeated_flag=1 : boss10_defeated_flag=1
   pointsHi=$09 : pointsMed=$00 : pointsLo=$00
   levelLo=$11
   gamedifficulty=1 : debounce_fire=0 : beam_counter=0
   level_flag=20
   transition_flag=0

   goto set_speed bank3

start_option_41              ; 01 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 0 0 0 0 0 0 0 0 0 0, Level 1, 4900 Points [fight boss_l2 (boss1_battle) - go to level 2]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=0 : boss2_defeated_flag=0 : boss3_defeated_flag=0 : boss4_defeated_flag=0 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$00 : pointsMed=$49 : pointsLo=$00
   levelLo=$01
   gamedifficulty=2 : debounce_fire=0 : beam_counter=0
   level_flag=2
   transition_flag=1

   goto set_speed bank3


start_option_42              ; 02 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 0 0 0 0 0 0 0 0 0, Level 2, 5000 Points   [boss1 battle complete]  
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=0 : boss3_defeated_flag=0 : boss4_defeated_flag=0 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$00 : pointsMed=$50 : pointsLo=$00
   levelLo=$02
   gamedifficulty=2 : debounce_fire=0 : beam_counter=0
   level_flag=2
   transition_flag=0

   goto set_speed bank3


start_option_43              ; 03 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 0 0 0 0 0 0 0 0 0, Level 2, 9900 Points [fight boss_l3 (boss2_battle) - go to level 3]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=0 : boss3_defeated_flag=0 : boss4_defeated_flag=0 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$00 : pointsMed=$99 : pointsLo=$00
   levelLo=$02
   gamedifficulty=2 : debounce_fire=0 : beam_counter=0
   level_flag=4
   transition_flag=1

   goto set_speed bank3

start_option_44              ; 04 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 0 0 0 0 0 0 0 0, Level 3, 10000 Points [boss2 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=0 : boss4_defeated_flag=0 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$01 : pointsMed=$00 : pointsLo=$00
   levelLo=$03
   gamedifficulty=2 : debounce_fire=0 : beam_counter=0
   level_flag=4
   transition_flag=0

   goto set_speed bank3

start_option_45              ; 05 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 0 0 0 0 0 0 0 0, Level 3, 19900 Points [fight boss_l4 (boss3_battle) - go to level 4]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=0 : boss4_defeated_flag=0 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$01 : pointsMed=$99 : pointsLo=$00
   levelLo=$03
   gamedifficulty=2 : debounce_fire=0 : beam_counter=0
   level_flag=6
   transition_flag=1

   goto set_speed bank3

start_option_46              ; 06 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 0 0 0 0 0 0 0, Level 3, 20000 Points [boss3 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=0 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$02 : pointsMed=$00 : pointsLo=$00
   levelLo=$04
   gamedifficulty=2 : debounce_fire=0 : beam_counter=0
   level_flag=6
   transition_flag=0

   goto set_speed bank3

start_option_47              ; 07 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 0 0 0 0 0 0 0, Level 4, 29900 Points [fight boss_l5 (boss4_battle) - go to level 5]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=0 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$02 : pointsMed=$99 : pointsLo=$00
   levelLo=$04
   gamedifficulty=2 : debounce_fire=0 : beam_counter=0
   level_flag=8
   transition_flag=1

   goto set_speed bank3

start_option_48              ; 08 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 1 0 0 0 0 0 0, Level 4, 30000 Points [boss4 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$03 : pointsMed=$00 : pointsLo=$00
   levelLo=$05
   gamedifficulty=2 : debounce_fire=0 : beam_counter=0
   level_flag=8
   transition_flag=0

   goto set_speed bank3

start_option_49              ; 09 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 1 0 0 0 0 0 0, Level 5, 39900 Points [fight boss_l6 (boss5_battle) - go to level 6]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$03 : pointsMed=$99 : pointsLo=$00
   levelLo=$05
   gamedifficulty=2 : debounce_fire=0 : beam_counter=0
   level_flag=10
   transition_flag=1

   goto set_speed bank3

start_option_50             ; 0A 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 1 1 0 0 0 0 0, Level 5, 40000 Points [boss5 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$04 : pointsMed=$00 : pointsLo=$00
   levelLo=$06
   gamedifficulty=2 : debounce_fire=0 : beam_counter=0
   level_flag=10
   transition_flag=0

   goto set_speed bank3

start_option_51             ; 0B 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 1 1 0 0 0 0 0, Level 6, 49900 Points [fight boss_l7 (boss6_battle) - go to level 7]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$04 : pointsMed=$99 : pointsLo=$00
   levelLo=$06
   gamedifficulty=2 : debounce_fire=0 : beam_counter=0
   level_flag=12
   transition_flag=1

   goto set_speed bank3

start_option_52             ; 0C 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 1 1 1 0 0 0 0, Level 6, 50000 Points [boss6 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$05 : pointsMed=$00 : pointsLo=$00
   levelLo=$07
   gamedifficulty=2 : debounce_fire=0 : beam_counter=0
   level_flag=12
   transition_flag=0

   goto set_speed bank3

start_option_53             ; 0D 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 1 1 1 0 0 0 0, Level 7, 59900 Points [fight boss_l8 (boss7_battle) - go to level 8]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$05 : pointsMed=$99 : pointsLo=$00
   levelLo=$07
   gamedifficulty=2 : debounce_fire=0 : beam_counter=0
   level_flag=14
   transition_flag=1

   goto set_speed bank3

start_option_54             ; 0E 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 1 1 1 1 0 0 0, Level 7, 60000 Points [boss7 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=1 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$06 : pointsMed=$00 : pointsLo=$00
   levelLo=$08
   gamedifficulty=2 : debounce_fire=0 : beam_counter=0
   level_flag=14
   transition_flag=0

   goto set_speed bank3

start_option_55             ; 0F 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 1 1 1 1 0 0 0, Level 8, 69900 Points [fight boss_l9 (boss9_battle) - go to level 9]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=1 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$06 : pointsMed=$99 : pointsLo=$00
   levelLo=$08
   gamedifficulty=2 : debounce_fire=0 : beam_counter=0
   level_flag=16
   transition_flag=1

   goto set_speed bank3

start_option_56             ; 10 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 0 0, Level 8, 70000 Points [boss8 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=1 : boss8_defeated_flag=1 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$07 : pointsMed=$00 : pointsLo=$00
   levelLo=$09
   gamedifficulty=2 : debounce_fire=0 : beam_counter=0
   level_flag=16
   transition_flag=0

   goto set_speed bank3

start_option_57             ; 11 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 0 0, Level 9, 79900 Points [fight boss_l10 (boss9_battle) - go to level 10]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=1 : boss8_defeated_flag=1 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$07 : pointsMed=$99 : pointsLo=$00
   levelLo=$09
   gamedifficulty=2 : debounce_fire=0 : beam_counter=0
   level_flag=18
   transition_flag=1

   goto set_speed bank3

start_option_58             ; 12 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 1 0, Level 9, 80000 Points [boss9 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=1 : boss8_defeated_flag=1 : boss9_defeated_flag=1 : boss10_defeated_flag=0
   pointsHi=$08 : pointsMed=$00 : pointsLo=$00
   levelLo=$10
   gamedifficulty=2 : debounce_fire=0 : beam_counter=0
   level_flag=18
   transition_flag=0

   goto set_speed bank3

start_option_59             ; 13 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 1 0, Level 10, 89900 Points [fight boss_l11 (boss10_battle) - go to level 11]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=1 : boss8_defeated_flag=1 : boss9_defeated_flag=1 : boss10_defeated_flag=0
   pointsHi=$08 : pointsMed=$99 : pointsLo=$00
   levelLo=$10
   gamedifficulty=2 : debounce_fire=0 : beam_counter=0
   level_flag=20
   transition_flag=1

   goto set_speed bank3

start_option_60             ; 14 00 00 00 00 00 00 00 Advanced Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 1 1, Level 10, 90000 Points [boss10 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=1 : boss8_defeated_flag=1 : boss9_defeated_flag=1 : boss10_defeated_flag=1
   pointsHi=$09 : pointsMed=$00 : pointsLo=$00
   levelLo=$11
   gamedifficulty=2 : debounce_fire=0 : beam_counter=0
   level_flag=20
   transition_flag=0

   goto set_speed bank3

start_option_61              ; 01 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 0 0 0 0 0 0 0 0 0 0, Level 1, 4900 Points [fight boss_l2 (boss1_battle) - go to level 2]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=0 : boss2_defeated_flag=0 : boss3_defeated_flag=0 : boss4_defeated_flag=0 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$00 : pointsMed=$49 : pointsLo=$00
   levelLo=$01
   gamedifficulty=3 : debounce_fire=0 : beam_counter=0
   level_flag=2
   transition_flag=1

   goto set_speed bank3


start_option_62              ; 02 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 0 0 0 0 0 0 0 0 0, Level 2, 5000 Points   [boss1 battle complete]  
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=0 : boss3_defeated_flag=0 : boss4_defeated_flag=0 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$00 : pointsMed=$50 : pointsLo=$00
   levelLo=$02
   gamedifficulty=3 : debounce_fire=0 : beam_counter=0
   level_flag=2
   transition_flag=0

   goto set_speed bank3


start_option_63              ; 03 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 0 0 0 0 0 0 0 0 0, Level 2, 9900 Points [fight boss_l3 (boss2_battle) - go to level 3]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=0 : boss3_defeated_flag=0 : boss4_defeated_flag=0 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$00 : pointsMed=$99 : pointsLo=$00
   levelLo=$02
   gamedifficulty=3 : debounce_fire=0 : beam_counter=0
   level_flag=4
   transition_flag=1

   goto set_speed bank3

start_option_64              ; 04 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 0 0 0 0 0 0 0 0, Level 3, 10000 Points [boss2 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=0 : boss4_defeated_flag=0 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$01 : pointsMed=$00 : pointsLo=$00
   levelLo=$03
   gamedifficulty=3 : debounce_fire=0 : beam_counter=0
   level_flag=4
   transition_flag=0

   goto set_speed bank3

start_option_65              ; 05 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 0 0 0 0 0 0 0 0, Level 3, 19900 Points [fight boss_l4 (boss3_battle) - go to level 4]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=0 : boss4_defeated_flag=0 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$01 : pointsMed=$99 : pointsLo=$00
   levelLo=$03
   gamedifficulty=3 : debounce_fire=0 : beam_counter=0
   level_flag=6
   transition_flag=1

   goto set_speed bank3

start_option_66              ; 06 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 0 0 0 0 0 0 0, Level 3, 20000 Points [boss3 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=0 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$02 : pointsMed=$00 : pointsLo=$00
   levelLo=$04
   gamedifficulty=3 : debounce_fire=0 : beam_counter=0
   level_flag=6
   transition_flag=0

   goto set_speed bank3

start_option_67              ; 07 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 0 0 0 0 0 0 0, Level 4, 29900 Points [fight boss_l5 (boss4_battle) - go to level 5]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=0 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$02 : pointsMed=$99 : pointsLo=$00
   levelLo=$04
   gamedifficulty=3 : debounce_fire=0 : beam_counter=0
   level_flag=8
   transition_flag=1

   goto set_speed bank3

start_option_68              ; 08 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 1 0 0 0 0 0 0, Level 4, 30000 Points [boss4 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$03 : pointsMed=$00 : pointsLo=$00
   levelLo=$05
   gamedifficulty=3 : debounce_fire=0 : beam_counter=0
   level_flag=8
   transition_flag=0

   goto set_speed bank3

start_option_69              ; 09 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 1 0 0 0 0 0 0, Level 5, 39900 Points [fight boss_l6 (boss5_battle) - go to level 6]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=0
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$03 : pointsMed=$99 : pointsLo=$00
   levelLo=$05
   gamedifficulty=3 : debounce_fire=0 : beam_counter=0
   level_flag=10
   transition_flag=1

   goto set_speed bank3

start_option_70             ; 0A 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 1 1 0 0 0 0 0, Level 5, 40000 Points [boss5 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$04 : pointsMed=$00 : pointsLo=$00
   levelLo=$06
   gamedifficulty=3 : debounce_fire=0 : beam_counter=0
   level_flag=10
   transition_flag=0

   goto set_speed bank3

start_option_71             ; 0B 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 1 1 0 0 0 0 0, Level 6, 49900 Points [fight boss_l7 (boss6_battle) - go to level 7]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=0 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$04 : pointsMed=$99 : pointsLo=$00
   levelLo=$06
   gamedifficulty=3 : debounce_fire=0 : beam_counter=0
   level_flag=12
   transition_flag=1

   goto set_speed bank3

start_option_72             ; 0C 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 1 1 1 0 0 0 0, Level 6, 50000 Points [boss6 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$05 : pointsMed=$00 : pointsLo=$00
   levelLo=$07
   gamedifficulty=3 : debounce_fire=0 : beam_counter=0
   level_flag=12
   transition_flag=0

   goto set_speed bank3

start_option_73             ; 0D 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 1 1 1 0 0 0 0, Level 7, 59900 Points [fight boss_l8 (boss7_battle) - go to level 8]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=0 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$05 : pointsMed=$99 : pointsLo=$00
   levelLo=$07
   gamedifficulty=3 : debounce_fire=0 : beam_counter=0
   level_flag=14
   transition_flag=1

   goto set_speed bank3

start_option_74             ; 0E 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 1 1 1 1 0 0 0, Level 7, 60000 Points [boss7 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=1 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$06 : pointsMed=$00 : pointsLo=$00
   levelLo=$08
   gamedifficulty=3 : debounce_fire=0 : beam_counter=0
   level_flag=14
   transition_flag=0

   goto set_speed bank3

start_option_75             ; 0F 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 1 1 1 1 0 0 0, Level 8, 69900 Points [fight boss_l9 (boss9_battle) - go to level 9]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=1 : boss8_defeated_flag=0 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$06 : pointsMed=$99 : pointsLo=$00
   levelLo=$08
   gamedifficulty=3 : debounce_fire=0 : beam_counter=0
   level_flag=16
   transition_flag=1

   goto set_speed bank3

start_option_76             ; 10 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 0 0, Level 8, 70000 Points [boss8 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=1 : boss8_defeated_flag=1 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$07 : pointsMed=$00 : pointsLo=$00
   levelLo=$09
   gamedifficulty=3 : debounce_fire=0 : beam_counter=0
   level_flag=16
   transition_flag=0

   goto set_speed bank3

start_option_77             ; 11 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 0 0, Level 9, 79900 Points [fight boss_l10 (boss9_battle) - go to level 10]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=1 : boss8_defeated_flag=1 : boss9_defeated_flag=0 : boss10_defeated_flag=0
   pointsHi=$07 : pointsMed=$99 : pointsLo=$00
   levelLo=$09
   gamedifficulty=3 : debounce_fire=0 : beam_counter=0
   level_flag=18
   transition_flag=1

   goto set_speed bank3

start_option_78             ; 12 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 1 0, Level 9, 80000 Points [boss9 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=1 : boss8_defeated_flag=1 : boss9_defeated_flag=1 : boss10_defeated_flag=0
   pointsHi=$08 : pointsMed=$00 : pointsLo=$00
   levelLo=$10
   gamedifficulty=3 : debounce_fire=0 : beam_counter=0
   level_flag=18
   transition_flag=0

   goto set_speed bank3

start_option_79             ; 13 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 1 0, Level 10, 89900 Points [fight boss_l11 (boss10_battle) - go to level 11]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=1 : boss8_defeated_flag=1 : boss9_defeated_flag=1 : boss10_defeated_flag=0
   pointsHi=$08 : pointsMed=$99 : pointsLo=$00
   levelLo=$10
   gamedifficulty=3 : debounce_fire=0 : beam_counter=0
   level_flag=20
   transition_flag=1

   goto set_speed bank3

start_option_80             ; 14 00 00 00 00 00 00 00 Expert Difficulty, Bosses Defeated 1 1 1 1 1 1 1 1 1 1, Level 10, 90000 Points [boss10 battle complete]
                            ; --------------------------------------------------------------------------------------------
   boss1_defeated_flag=1 : boss2_defeated_flag=1 : boss3_defeated_flag=1 : boss4_defeated_flag=1 : boss5_defeated_flag=1
   boss6_defeated_flag=1 : boss7_defeated_flag=1 : boss8_defeated_flag=1 : boss9_defeated_flag=1 : boss10_defeated_flag=1
   pointsHi=$09 : pointsMed=$00 : pointsLo=$00
   levelLo=$11
   gamedifficulty=3 : debounce_fire=0 : beam_counter=0
   level_flag=20
   transition_flag=0

   goto set_speed bank3

  
 bank 16

sfx_enter_password
   playsfx sfx_enter_password
   return

    data sfx_enter_password
    $10,$10,$00 ; version, priority, frames per chunk
    $1c,$07,$02 ; first chunk of freq,channel,volume
    $02,$07,$06
    $1e,$08,$09
    $11,$08,$09
    $1e,$08,$09
    $11,$07,$06
    $1e,$08,$09
    $11,$07,$06
    $0e,$07,$03
    $06,$07,$02
    $00,$00,$00
end
  
 ;──═◙ Import Graphics for the Password Screen
  ; These are a copy of the same ones used on the title screen.
  incbanner gfx/ex2/drone_title10_pw.png 160A 0 1 2 3
  incbanner gfx/ex2/drone_title_bar_pw.png 160A 0 1 2 3
  incbanner gfx/ex2/drone_title_bar_text_pw.png 160A 0 1 2 3
  incgraphic gfx/ex2/arrow_up.png 160A 0 1 2 3
  incgraphic gfx/ex2/arrow_down.png 160A 0 1 2 3

     ; ###################################### PASSWORD SCREEN LOOP ######################################
password_screen  

    P0C1 = $80 : P0C2 = $84 : P0C3 = $88  ; title/background   C1 - Sky  C2 - Middle Row  C3 - Back Row  |  Background - Front Row    
    P2C1 = $88 : P2C2 = $86 : P2C3 = $84  ; menu
    P3C1 = $98 : P3C2 = $96 : P3C3 = $94  ; menu
    P4C1 = $48 : P4C2 = $46 : P4C3 = $44  ; menu
    P5C1 = $80 : P5C2 = $40 : P5C3 = $36  ; drone patrol title text  C1 - background  c2- letter background   c3-  letter color
    P6C1 = $48 : P6C2 = $46 : P6C3 = $44
    P7C1 = $28 : P7C2 = $26 : P7C3 = $24  ; menu

    ;BACKGRND=$00

    ;──═◙ Set Y Positions for theSet initial Menu Index and Position Variables
    menu_yposition=6

    ;──═◙ Set Y Positions for theSet Initial Menu Colors
    menu_selection_color1=7 
    menu_selection_color2=2
    menu_selection_color3=2

    pwdcolor1 = 2
    pwdcolor2 = 2
    pwdcolor3 = 2
    pwdcolor4 = 2
    pwdcolor5 = 2
    pwdcolor6 = 2
    pwdcolor7 = 2
    pwdcolor8 = 2
    pwdpos1 = 0
    pwdpos2 = 0
    pwdpos3 = 0
    pwdpos4 = 0
    pwdpos5 = 0
    pwdpos6 = 0
    pwdpos7 = 0
    pwdpos8 = 0
    menupos_flag = 0
    password1=0
    password2=0
    password3=0
    password4=0
    password5=0
    password6=0
    password7=0
    password8=0
    start_option=0

    arrow_up_xpos=60
    arrow_down_xpos=60

password_screen_loop

    ;if joy0up && menupos_flag=1 then gosub sfx_enter_password
    ;if joy0down && menupos_flag=1 then gosub sfx_enter_password

    drawwait
    clearscreen  

    plotbanner drone_title_bar_pw 0 0 0
    plotbanner drone_title_bar_text_pw 5 0 8
    plotbanner drone_title_bar_pw 0 0 24
    plotbanner drone_title_bar_pw 0 0 32
    plotbanner drone_title_bar_pw 0 0 40
    plotbanner drone_title_bar_pw 0 0 48
    plotbanner drone_title_bar_pw 0 0 56
    plotbanner drone_title_bar_pw 0 0 64
    plotbanner drone_title_bar_pw 0 0 72
    plotbanner drone_title_bar_pw 0 0 80
    plotbanner drone_title10_pw 0 0 88

    ;──═◙ Debounce Left Joystick
    ;--------------------------
    ; If the fire button is being pressed or the joystick is being pressed in a direction, the vlaue is 5
    ; After the fire button or the joystick direction is released, the value is 6
    ;--------------------------
    ; We want to execute code when the value is 6 (after the button or stick has been released), rather than when it is pressed/pushed.
    ;--------------------------
    if joy0fire then debounce_fire=5
    if !joy0fire && debounce_fire=5 then debounce_fire=6
    if joy0right then debounce_right=5
    if !joy0right && debounce_right=5 then debounce_right=6
    if joy0left then debounce_left=5
    if !joy0left && debounce_left=5 then debounce_left=6
    if joy0up then debounce_up=5
    if !joy0up && debounce_up=5 then debounce_up=6
    if joy0down then debounce_down=5
    if !joy0down && debounce_down=5 then debounce_down=6  
    ;--------------------------

    if menupos_flag=1 then menu_selection_color1=2
    if menupos_flag=0 then menu_selection_color1=7

    ;if menu_yposition=6 then menu_selection_color1=4:menu_selection_color2=2:menu_selection_color3=2
    if menu_yposition=6 && menupos_flag=1 then menu_selection_color1=2:menu_selection_color2=2:menu_selection_color3=2
    if menu_yposition=6 && menupos_flag=0 then menu_selection_color1=7:menu_selection_color2=2:menu_selection_color3=2
    if menu_yposition=8 then menu_selection_color1=2:menu_selection_color2=7:menu_selection_color3=2  ;:pwdcolor1=6:pwdcolor1=6:pwdcolor1=6:pwdcolor1=6:pwdcolor1=6:pwdcolor1=6:pwdcolor1=6:pwdcolor1=6
    if menu_yposition=10 then menu_selection_color1=2:menu_selection_color2=2:menu_selection_color3=7 ;:pwdcolor1=6:pwdcolor1=6:pwdcolor1=6:pwdcolor1=6:pwdcolor1=6:pwdcolor1=6:pwdcolor1=6:pwdcolor1=6

    ;──═◙ Plot Menu Choices on screen
    ; The palette choice for each line is a variable based on the preceding section of code.
    ;--------------------------
 
    plotchars 'password:' menu_selection_color1 20 6
    plotchars 'submit'     menu_selection_color2  68  8   
    plotchars 'return to title screen'     menu_selection_color3 34  10  
    plotchars 'hold fire to fast scroll' 2 30 23

    ;if start_option>0 then plotchars 'valid'     3  48  22 

    ;if menupos_flag=0 then plotchars 'menupos 0'     3  50  1 
    ;if menupos_flag=1 then plotchars 'menupos 1'     3  50  1 

    plotvalue scoredigits pwdcolor1 password1 2 60 6
    plotvalue scoredigits pwdcolor2 password2 2 70 6
    plotvalue scoredigits pwdcolor3 password3 2 80 6
    plotvalue scoredigits pwdcolor4 password4 2 90 6
    plotvalue scoredigits pwdcolor5 password5 2 100 6
    plotvalue scoredigits pwdcolor6 password6 2 110 6
    plotvalue scoredigits pwdcolor7 password7 2 120 6
    plotvalue scoredigits pwdcolor8 password8 2 130 6

    plotsprite arrow_up 7 arrow_up_xpos 44
    plotsprite arrow_down 7 arrow_down_xpos 57

    if menupos_flag=0 then arrow_up_xpos=200:arrow_down_xpos=200:goto skip_arrowpos
    if pwdpos1=1 then arrow_up_xpos=60:arrow_down_xpos=60:
    if pwdpos2=1 then arrow_up_xpos=70:arrow_down_xpos=70
    if pwdpos3=1 then arrow_up_xpos=80:arrow_down_xpos=80
    if pwdpos4=1 then arrow_up_xpos=90:arrow_down_xpos=90
    if pwdpos5=1 then arrow_up_xpos=100:arrow_down_xpos=100
    if pwdpos6=1 then arrow_up_xpos=110:arrow_down_xpos=110
    if pwdpos7=1 then arrow_up_xpos=120:arrow_down_xpos=120
    if pwdpos8=1 then arrow_up_xpos=130:arrow_down_xpos=130
skip_arrowpos

    if menupos_flag=1 then gosub password_logic bank15

    if menupos_flag=1 then goto skip_up_down
    ;──═◙ Move Menu Selection - Joystick Down [Choose Skill, Lives, or Level when pressing down]
    ; If you press the joystick down, it will move down the menu by one.  If you're already at hte bottom, it stays on the bottom line.
    ;--------------------------
    if debounce_down=6 && menu_yposition=6 then gosub menu_sound_pw:debounce_down=0:menu_yposition=8         
    if debounce_down=6 && menu_yposition=8 then menupos_flag=0 :pwdpos1=0:gosub menu_sound_pw:debounce_down=0:menu_yposition=10         
    if debounce_down=6 && menu_yposition=10 then menupos_flag=0 :pwdpos1=0: gosub menu_sound_pw:debounce_down=0:menu_yposition=10        

    ;──═◙ Move Menu Selection - Joystick Up [Choose Skill, Lives, or Level when pressing up]
    ; If you press the joystick up, it will move up the menu by one.  If you're already at the top, it stays on the top line.
    ;--------------------------
    if debounce_up=6 && menu_yposition=6 then gosub menu_sound_pw:debounce_up=0:menu_yposition=6          
    if debounce_up=6 && menu_yposition=8 then menupos_flag=0 :pwdpos1=0:gosub menu_sound_pw:debounce_up=0:menu_yposition=6          
    if debounce_up=6 && menu_yposition=10 then menupos_flag=0 :pwdpos1=0:gosub menu_sound_pw:debounce_up=0:menu_yposition=8             
    ;──═◙ Move left/Right on a Menu Selection [Choose a specific option for each menu item by pushing left or right]
skip_up_down

    ;  If you keep pressing right or left after you've gone through all of the available choices, it will continue to cycle through all of them starting over from the beginning.
    ;--------------------------
    ;Set Skill Level [First Menu Item] Pushing Right on Joystick
    if menu_yposition=6 && debounce_right=6 && menupos_flag=0 then menupos_flag=1:pwdpos1=1:  pwdcolor1=2:pwdcolor1=2:pwdcolor1=2:pwdcolor1=2:pwdcolor1=2:pwdcolor1=2:pwdcolor1=2:menu_selection_color1=7:debounce_right=0  
    if menu_yposition=6 && debounce_right=6 && pwdpos1=1 then gosub menu_sound_pw:pwdpos1=0:pwdpos2=1:pwdpos3=0:pwdpos4=0:pwdpos5=0:pwdpos6=0:pwdpos7=0:pwdpos8=0:debounce_right=0    
    if menu_yposition=6 && debounce_right=6 && pwdpos2=1 then gosub menu_sound_pw:pwdpos1=0:pwdpos2=0:pwdpos3=1:pwdpos4=0:pwdpos5=0:pwdpos6=0:pwdpos7=0:pwdpos8=0:debounce_right=0     
    if menu_yposition=6 && debounce_right=6 && pwdpos3=1 then gosub menu_sound_pw:pwdpos1=0:pwdpos2=0:pwdpos3=0:pwdpos4=1:pwdpos5=0:pwdpos6=0:pwdpos7=0:pwdpos8=0:debounce_right=0  
    if menu_yposition=6 && debounce_right=6 && pwdpos4=1 then gosub menu_sound_pw:pwdpos1=0:pwdpos2=0:pwdpos3=0:pwdpos4=0:pwdpos5=1:pwdpos6=0:pwdpos7=0:pwdpos8=0:debounce_right=0  
    if menu_yposition=6 && debounce_right=6 && pwdpos5=1 then gosub menu_sound_pw:pwdpos1=0:pwdpos2=0:pwdpos3=0:pwdpos4=0:pwdpos5=0:pwdpos6=1:pwdpos7=0:pwdpos8=0:debounce_right=0 
    if menu_yposition=6 && debounce_right=6 && pwdpos6=1 then gosub menu_sound_pw:pwdpos1=0:pwdpos2=0:pwdpos3=0:pwdpos4=0:pwdpos5=0:pwdpos6=0:pwdpos7=1:pwdpos8=0:debounce_right=0 
    if menu_yposition=6 && debounce_right=6 && pwdpos7=1 then gosub menu_sound_pw:pwdpos1=0:pwdpos2=0:pwdpos3=0:pwdpos4=0:pwdpos5=0:pwdpos6=0:pwdpos7=0:pwdpos8=1:debounce_right=0 
    if menu_yposition=6 && debounce_right=6 && pwdpos8=1 then gosub menu_sound_pw:pwdpos1=1:pwdpos2=0:pwdpos3=0:pwdpos4=0:pwdpos5=0:pwdpos6=0:pwdpos7=0:pwdpos8=0:debounce_right=0  
    
    ;Set Skill Level [First Menu Item] Pushing Left on Joystick
    if menu_yposition=6 && debounce_left=6 && menupos_flag=1 && pwdpos1<>1 then goto skip_the_rest_1
    if menu_yposition=6 && debounce_left=6 && menupos_flag=1 then menupos_flag=0:pwdpos1=0:  pwdcolor1=2:pwdcolor1=2:pwdcolor1=2:pwdcolor1=2:pwdcolor1=2:pwdcolor1=2:pwdcolor1=2:menu_selection_color1=3:debounce_left=0 
skip_the_rest_1
    if menu_yposition=6 && debounce_left=6 && pwdpos1=1 then gosub menu_sound_pw:pwdpos1=0:pwdpos2=0:pwdpos3=0:pwdpos4=0:pwdpos5=0:pwdpos6=0:pwdpos7=0:pwdpos8=1:debounce_left=0 
    if menu_yposition=6 && debounce_left=6 && pwdpos2=1 then gosub menu_sound_pw:pwdpos1=1:pwdpos2=0:pwdpos3=0:pwdpos4=0:pwdpos5=0:pwdpos6=0:pwdpos7=0:pwdpos8=0:debounce_left=0 
    if menu_yposition=6 && debounce_left=6 && pwdpos3=1 then gosub menu_sound_pw:pwdpos1=0:pwdpos2=1:pwdpos3=0:pwdpos4=0:pwdpos5=0:pwdpos6=0:pwdpos7=0:pwdpos8=0:debounce_left=0 
    if menu_yposition=6 && debounce_left=6 && pwdpos4=1 then gosub menu_sound_pw:pwdpos1=0:pwdpos2=0:pwdpos3=1:pwdpos4=0:pwdpos5=0:pwdpos6=0:pwdpos7=0:pwdpos8=0:debounce_left=0 
    if menu_yposition=6 && debounce_left=6 && pwdpos5=1 then gosub menu_sound_pw:pwdpos1=0:pwdpos2=0:pwdpos3=0:pwdpos4=1:pwdpos5=0:pwdpos6=0:pwdpos7=0:pwdpos8=0:debounce_left=0 
    if menu_yposition=6 && debounce_left=6 && pwdpos6=1 then gosub menu_sound_pw:pwdpos1=0:pwdpos2=0:pwdpos3=0:pwdpos4=0:pwdpos5=1:pwdpos6=0:pwdpos7=0:pwdpos8=0:debounce_left=0 
    if menu_yposition=6 && debounce_left=6 && pwdpos7=1 then gosub menu_sound_pw:pwdpos1=0:pwdpos2=0:pwdpos3=0:pwdpos4=0:pwdpos5=0:pwdpos6=1:pwdpos7=0:pwdpos8=0:debounce_left=0 
    if menu_yposition=6 && debounce_left=6 && pwdpos8=1 then gosub menu_sound_pw:pwdpos1=0:pwdpos2=0:pwdpos3=0:pwdpos4=0:pwdpos5=0:pwdpos6=0:pwdpos7=1:pwdpos8=0:debounce_left=0 
    ;--------------------------

    ;──═◙ Process menu selections
    ;--------------------------   
    if debounce_fire=6 && menu_yposition=8 then debounce_fire=0:goto check_password bank15
    if debounce_fire=6 && menu_yposition=10 then debounce_fire=0:goto menuscreen bank3
    
    drawscreen
    goto password_screen_loop

menu_sound_pw
   playsfx sfx_dropmedium_pw
   return

 data sfx_dropmedium_pw
    $10,$10,$00 ; version, priority, frames per chunk
    $00,$04,$00 ; first chunk of freq,channel,volume
    $03,$06,$0c
    $0d,$0c,$0f
    $1b,$04,$04
    $06,$0c,$00
    $00,$06,$00
    $07,$06,$00
    $10,$0c,$00
    $0d,$0c,$00
    $10,$0c,$00
    $03,$06,$00
    $10,$0c,$00
    $1b,$04,$00
    $10,$0c,$00
    $10,$0c,$00
    $03,$06,$00
    $00,$00,$00
end

 bank 17 

    incgraphic gfx/ex2/tank1.png 160A 1 0 2 3
    incgraphic gfx/ex2/tank1b.png 160A 1 0 2 3
    incgraphic gfx/ex2/tank1c.png 160A 1 0 2 3
    incgraphic gfx/ex2/tank1d.png 160A 1 0 2 3
    incgraphic gfx/ex2/tank2.png 160A 1 0 2 3
    incgraphic gfx/ex2/tank2b.png 160A 1 0 2 3
    incgraphic gfx/ex2/tank2c.png 160A 1 0 2 3
    incgraphic gfx/ex2/tank2d.png 160A 1 0 2 3
    incgraphic gfx/ex2/tank3.png 160A 1 0 2 3
    incgraphic gfx/ex2/tank3b.png 160A 1 0 2 3
    incgraphic gfx/ex2/tank3c.png 160A 1 0 2 3
    incgraphic gfx/ex2/tank3d.png 160A 1 0 2 3
    newblock
    incgraphic gfx/ex2/text_levelup_top.png
    incgraphic gfx/ex2/text_levelup_bottom.png
    incgraphic gfx/ex2/text_gameover_top.png
    incgraphic gfx/ex2/text_gameover_bottom.png
    incgraphic gfx/ex2/text_getready_top.png
    incgraphic gfx/ex2/text_getready_bottom.png
    incgraphic gfx/ex2/laser_powerup.png 160A 1 0 2 3
    incgraphic gfx/ex2/battery_powerup.png 160A 1 0 2 3
    incgraphic gfx/ex2/radar.png 160A 1 0 2 3
    incgraphic gfx/ex2/radar_b.png 160A 1 0 2 3
    incgraphic gfx/ex2/radar_c.png 160A 1 0 2 3
    incgraphic gfx/ex2/radar_d.png 160A 1 0 2 3
    incgraphic gfx/ex2/missile1.png 160A 1 0 2 3
    incgraphic gfx/ex2/missile1b.png 160A 1 0 2 3
    incgraphic gfx/ex2/missile1c.png 160A 1 0 2 3
    incgraphic gfx/ex2/missile1d.png 160A 1 0 2 3
    incgraphic gfx/ex2/implosion1.png 160A 1 0 2 3
    incgraphic gfx/ex2/implosion1b.png 160A 1 0 2 3
    incgraphic gfx/ex2/implosion1c.png 160A 1 0 2 3
    incgraphic gfx/ex2/implosion1d.png 160A 1 0 2 3
    incgraphic gfx/ex2/crosshair.png 160A 1 0 2 3
    incgraphic gfx/ex2/crosshair2.png 160A 1 0 2 3
    newblock
    incgraphic gfx/ex2/scoredigits.png
    incgraphic gfx/ex2/man8_run_anim1.png 160A 1 0 2 3
    incgraphic gfx/ex2/man8_run_anim2.png 160A 1 0 2 3
    incgraphic gfx/ex2/man8_run_anim3.png 160A 1 0 2 3
    incgraphic gfx/ex2/man8_run_anim4.png 160A 1 0 2 3
    incgraphic gfx/ex2/man8_run_anim5.png 160A 1 0 2 3
    incgraphic gfx/ex2/man8_run_anim6.png 160A 1 0 2 3
    incgraphic gfx/ex2/man8_run_anim7.png 160A 1 0 2 3
    incgraphic gfx/ex2/man8_run_anim8.png 160A 1 0 2 3
    incgraphic gfx/ex2/man8_explode1.png 160A 1 0 2 3
    incgraphic gfx/ex2/man8_explode2.png 160A 1 0 2 3
    incgraphic gfx/ex2/man8_explode3.png 160A 1 0 2 3
    incgraphic gfx/ex2/man8_explode4.png 160A 1 0 2 3
    incgraphic gfx/ex2/man8_explode5.png 160A 1 0 2 3
    incgraphic gfx/ex2/man8_explode6.png 160A 1 0 2 3
    incgraphic gfx/ex2/man8_explode7.png 160A 1 0 2 3
    incgraphic gfx/ex2/man8_explode8.png 160A 1 0 2 3
    incgraphic gfx/ex2/medical_truck_1b.png 160A 1 0 2 3
    incgraphic gfx/ex2/medical_truck_2b.png 160A 1 0 2 3
    incgraphic gfx/ex2/medical_truck_3b.png 160A 1 0 2 3
    incgraphic gfx/ex2/medical_truck_4b.png 160A 1 0 2 3
    incgraphic gfx/ex2/medical_truck_1b_hit.png 160A 1 0 2 3
    incgraphic gfx/ex2/medical_truck_2b_hit.png 160A 1 0 2 3
    incgraphic gfx/ex2/medical_truck_3b_hit.png 160A 1 0 2 3
    incgraphic gfx/ex2/medical_truck_4b_hit.png 160A 1 0 2 3
    incgraphic gfx/ex2/beam.png 160A 1 0 2 3

 inline 7800vox.asm

