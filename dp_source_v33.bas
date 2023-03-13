    ;──═◙ "Drone Patrol", Steve Engelhardt, 3/12/2023


    ;──═◙ Set 7800Basic Options
    set tv ntsc
    set tallsprite on
    set zoneheight 8
    set zoneprotection on
    set screenheight 192
    set romsize 144k
    set extradlmemory on
    set trackersupport basic
    set plotvalueonscreen on
    set avoxvoice on
    ;set hssupport $1135
    ;set hsdifficultytext 'easy high scores' 'standard high scores' 'advanced high scores' 'expert high scores'
    ;set hsgamename 'drone patrol'
    displaymode 160A

    ;──═◙ Dim Variables
    dim textZoneRAM = $2300
    dim textZoneRAMAdd = $2300+32

    dim scoref=var82                                                               
    dim ValueCheckHi=scoref : dim ValueCheckMd=scoref+1 : dim ValueCheckLo=scoref+2          
    dim scoree=var85                                                               ; For High Score Saving
    dim hsHi=scoree : dim hsMed=scoree+1 : dim hsLo=scoree+2                       ; 
    dim scorea=var88                                                               ; Points - Player Score - Also uses b and c
    dim pointsHi=scorea : dim pointsMed=scorea+1 : dim pointsLo=scorea+2           ; Points - Player Score - Also uses b and c
    dim scoreb=var91                                                               ; Laser Cooldown - Also uses e and f
    dim laserHi=scoreb  : dim laserMed=scoreb+1  : dim laserLo=scoreb+2            ; Laser Cooldown - Also uses e and f
    dim scorec=var94                                                               ; Game Level - also uses h and i
    dim levelHi=scorec  : dim levelMed=scorec+1  : dim levelLo=scorec+2            ; Game Level - also uses h and i
    dim scored=var97                                                               ; Player Health - als use k and l
    dim healthHi=scored : dim healthMed=scored+1 : dim healthLo=scored+2           ; Player Health - als use k and l

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
    dim tank4_speed=w.x
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
    dim man1_xpos = var13
    dim man1_ypos = var14
    dim man2_xpos = var15
    dim man2_ypos = var16
    dim man3_xpos = var17
    dim man3_ypos = var18
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
    dim tank1_xpos = var39
    dim tank1_ypos = var40
    dim tank2_xpos = var41
    dim tank2_ypos = var42
    dim tank3_xpos = var43
    dim tank3_ypos = var44
    dim radar1_xpos = var45
    dim radar1_ypos = var46
    dim missile1_xpos = var47
    dim missile1_ypos = var48
    dim missile2_xpos = var49
    dim missile2_ypos = var50
    dim missile3_xpos = var51
    dim missile3_ypos = var52
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
    dim missile_flag = var51
    dim laser_powerup_flag = var52
    dim player_flag = var53
    dim debounce_up = var54                    
    dim debounce_down = var55                 
    dim debounce_left = var56                  
    dim debounce_right = var57           
    dim debounce_fire = var58                
    dim menu_xposition = var59
    dim menu_yposition = var60
    dim menu_option_skill = var61
    dim menu_option_lives = var62
    dim menu_option_level = var63
    dim menu_selection_color1 = var64
    dim menu_selection_color2 = var65
    dim menu_selection_color3 = var66
    dim menu_selection_color4 = var67
    dim message = var68
    dim notused3 = var69
    dim notused4 = var70
    dim animation_counter = var71
    dim cannon_xpos = var72
    dim cannon_ypos = var73
    dim cannon_fire_xpos = var74
    dim cannon_fire_ypos = var75
    dim temp_xpos = var76
    dim temp_ypos = var77
    dim animate4 = var78 
    dim animate5 = var79 
    dim animate6 = var80
    dim level_flag = var81

    ;──═◙ Import Graphics
    incgraphic gfx/ex2/font2.png 160A 0 1
    incgraphic gfx/ex2/text_score.png 160A 1 0 2 3
    incgraphic gfx/ex2/text_laser.png 160A 1 0 2 3
    incgraphic gfx/ex2/text_level.png 160A 1 0 2 3
    incgraphic gfx/ex2/text_health.png 160A 1 0 2 3
    incgraphic gfx/ex2/text_gameover.png 160A 1 0 2 3
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
    incgraphic gfx/ex2/drone_explode1.png 160A 1 0 2 3
    incgraphic gfx/ex2/drone_explode2.png 160A 1 0 2 3
    incgraphic gfx/ex2/drone_explode3.png 160A 1 0 2 3
    incgraphic gfx/ex2/drone_explode4.png 160A 1 0 2 3
    incgraphic gfx/ex2/bomb_large_up.png 160A 1 0 2 3
    incgraphic gfx/ex2/bomb_small_up.png 160A 1 0 2 3
        

    characterset font2
    alphachars '0123456789abcdefghijklmnopqrstuvwxyz! >`?/.,:-_()[]&AB@*"#'

    gosub aa_logo_display bank8
game_restart
    gosub menuscreen bank3
    gosub Init bank2

    mutesfx tia7)

    ;------------------------------------------MAIN LOOP-----------------------------------------------------------------

MainLoop

    ; ════════════════════════════════════════════════════════════════════════════
    ; Section 1: Game Logic
    ; ════════════════════════════════════════════════════════════════════════════
    
    gosub game_logic bank2

    ;──═◙ Scroll zone
    ; If you're not moving the joystick, don't scroll.  Still scrolls in last direction when you move up or down.
    if !joy0any then goto skip1
    if joy0up && !joy0left && !joy0left && frame_counter=1 then goto skip1
    if joy0down && !joy0left && !joy0left && frame_counter=1 then goto skip1
    for index = 0 to 9
    speed = scrollZoneSpeed[index] : if direction then speed = (speed^$ff)+1
    offsetY = 12+index
    temp1 = ShiftZone(3,offsetY,speed)
    next
skip1
    ;──═◙ Scrolling Text
    if (framecounter&7) > 0 then goto mainLoopSkipUpdateText
    ; Increment Text Zone
    textZoneIndex = textZoneIndex+1 : gosub CopyTextZoneContentToRam bank2
    ; When the text rotates change the direction of the scrolling
    if textZoneIndex = 0 then direction = direction+1 : if direction > 1 then direction = 0
mainLoopSkipUpdateText

    ; ═══════════════════════════════
    ; Section 2: Collision Detection
    ; ═══════════════════════════════

    ;──═◙ Detect Hit with Cannon Fire (Advanced and Expert Modes only)
    asm
 QBOXCOLLISIONCHECK cannon_fire_xpos,cannon_fire_ypos,16,8,drone_xpos,drone_ypos,16,8
end
 if CARRY then dec scored=scored-1:gosub sfx_defense_beam


    ;──═◙ Detect Hit with Laser Powerup/Recharge Sprite
    asm
 QBOXCOLLISIONCHECK laser_powerup_xpos,laser_powerup_ypos,16,8,drone_xpos,drone_ypos,16,8
end
 if CARRY && gamedifficulty=0 then laserLo=$99:gosub sfx_powerup bank2
 if CARRY && gamedifficulty=1 then laserLo=$75:gosub sfx_powerup bank2
 if CARRY && gamedifficulty=2 then laserLo=$50:gosub sfx_powerup bank2
 if CARRY && gamedifficulty=3 then laserLo=$25:gosub sfx_powerup bank2


    ;──═◙ Detect hits with enemy tanks
    if crosshair_x_offset_1=200 then goto skipcoll1 ; Avoid additional scoring after death animation shows up
    if fire_debounce_1<>1 || laserLo=$00 then goto skipcoll1 ; Avoid collisions if you are not pressing fire or if your laser energy level is at zero

    asm
 QBOXCOLLISIONCHECK crosshair_x_offset_1,laser_y_offset_10,16,8,tank1_xpos,tank1_ypos,16,8
end
 if CARRY then tank1_flag=1:animate3=0: gosub sfx_tanks

    asm
 QBOXCOLLISIONCHECK crosshair_x_offset_1,laser_y_offset_10,16,8,tank2_xpos,tank2_ypos,16,8
end
 if CARRY then tank2_flag=1:animate4=0: gosub sfx_tanks
 
    asm
 QBOXCOLLISIONCHECK crosshair_x_offset_1,laser_y_offset_10,16,8,tank3_xpos,tank3_ypos,16,8
end
 if CARRY then tank3_flag=1:animate5=0: gosub sfx_tanks

skipcoll1


    ;──═◙ Detect hits with Soldiers  
    if fire_debounce_1<>1 || laserLo=$00 then goto skipcoll2 ; Avoid collisions if you are not pressing fire or if your laser energy level is at zero

    asm
 QBOXCOLLISIONCHECK crosshair_x_offset_1,laser_y_offset_10,16,8,man1_xpos,man1_ypos,8,8
end
 if CARRY then man1_flag=1:animate6=0:dec scorea=scorea+125

    asm
 QBOXCOLLISIONCHECK crosshair_x_offset_1,laser_y_offset_10,16,8,man2_xpos,man2_ypos,8,8
end
 if CARRY then man2_flag=1:animate6=0:dec scorea=scorea+125
 
    asm
 QBOXCOLLISIONCHECK crosshair_x_offset_1,laser_y_offset_10,16,8,man3_xpos,man3_ypos,8,8
end
 if CARRY then man3_flag=1:animate6=0:dec scorea=scorea+125

skipcoll2




    ;──═◙ Detect hits between the drone and the cruise missiles
    asm
 QBOXCOLLISIONCHECK missile1_xpos,missile1_ypos,16,8,drone_xpos,drone_ypos,16,8
end
 if CARRY then dec scored=scored-1:gosub sfx_missiles

    asm
 QBOXCOLLISIONCHECK missile2_xpos,missile2_ypos,16,8,drone_xpos,drone_ypos,16,8
end
 if CARRY then dec scored=scored-1:gosub sfx_missiles

    asm
 QBOXCOLLISIONCHECK missile3_xpos,missile3_ypos,16,8,drone_xpos,drone_ypos,16,8
end
 if CARRY then dec scored=scored-1:gosub sfx_missiles

    ;──═◙ Detect hits with City Defense Beam 
    if beam_counter<30 && fire_debounce_1=1 then goto DefenseBeamEnd ; Beam is firing, however it's not plotted because the fire button is pressed. Skip collision detection. 
    if beam_counter>29 then goto DefenseBeamEnd  ; Beam is not firing, don't detect collision
    asm
 QBOXCOLLISIONCHECK defensebeam_x_offset_1,defensebeam_y_offset_1,4,8,drone_xpos,drone_ypos,16,8
end
 if CARRY then dec scored=scored-1:gosub sfx_defense_beam:goto DefenseBeamEnd
    asm
 QBOXCOLLISIONCHECK defensebeam_x_offset_1,defensebeam_y_offset_2,4,8,drone_xpos,drone_ypos,16,8
end
 if CARRY then dec scored=scored-1:gosub sfx_defense_beam:goto DefenseBeamEnd
    asm
 QBOXCOLLISIONCHECK defensebeam_x_offset_1,defensebeam_y_offset_3,4,8,drone_xpos,drone_ypos,16,8
end
 if CARRY then dec scored=scored-1:gosub sfx_defense_beam:goto DefenseBeamEnd
    asm
 QBOXCOLLISIONCHECK defensebeam_x_offset_1,defensebeam_y_offset_4,4,8,drone_xpos,drone_ypos,16,8
end
 if CARRY then dec scored=scored-1:gosub sfx_defense_beam:goto DefenseBeamEnd
    asm
 QBOXCOLLISIONCHECK defensebeam_x_offset_1,defensebeam_y_offset_5,4,8,drone_xpos,drone_ypos,16,8
end
 if CARRY then dec scored=scored-1:gosub sfx_defense_beam:goto DefenseBeamEnd
    asm
 QBOXCOLLISIONCHECK defensebeam_x_offset_1,defensebeam_y_offset_6,4,8,drone_xpos,drone_ypos,16,8
end
 if CARRY then dec scored=scored-1:gosub sfx_defense_beam:goto DefenseBeamEnd
    asm
 QBOXCOLLISIONCHECK defensebeam_x_offset_1,defensebeam_y_offset_7,4,8,drone_xpos,drone_ypos,16,8
end
 if CARRY then dec scored=scored-1:gosub sfx_defense_beam:goto DefenseBeamEnd
    asm
 QBOXCOLLISIONCHECK defensebeam_x_offset_1,defensebeam_y_offset_8,4,8,drone_xpos,drone_ypos,16,8
end
 if CARRY then dec scored=scored-1:gosub sfx_defense_beam:goto DefenseBeamEnd
    asm
 QBOXCOLLISIONCHECK defensebeam_x_offset_1,defensebeam_y_offset_9,4,8,drone_xpos,drone_ypos,16,8
end
 if CARRY then dec scored=scored-1:gosub sfx_defense_beam:goto DefenseBeamEnd

DefenseBeamEnd

    ; ═══════════════════════════════════════════════════
    ; Section 3: Display Logic (Plot Sprites and Values)
    ; ═══════════════════════════════════════════════════

    restorescreen
    
    ;──═◙ Plot Crosshair Targeting on the ground
    temp_ypos = drone_ypos+81
    temp_xpos = drone_xpos+6
    if drone_ypos>21 then plotsprite crosshair2 0 temp_xpos temp_ypos ; crosshair only shows up when you're able to shoot, disabled less than y22

    ;──═◙ Subroutine for drawing all on-screen sprites.  It won't fit in bank 1.
    gosub sprite_draw bank2

    ;──═◙ Plot the city defense beam
    ;  Defense beam will not fire if you're firing your laser
    if beam_counter<30 && fire_debounce_1<>1 && animate2=3 then gosub draw_defensebeam bank2:gosub sfx_plainlaser bank2;:goto skiplaserfire

    ;──═◙ Plot the laser when you press the fire button
    if laserLo=$00 && fire_debounce_1=1 then gosub sfx_no_ammo bank2:goto skiplaserfire
    if drone_ypos<22 then goto skiplaserfire ; If you are too high up you can't fire
    if laserLo<>0 && fire_debounce_1=1 && animate2=3 then gosub sfx_pulsecannon bank2:gosub draw_laser bank2
    if fire_debounce_1<>1 then crosshair_x_offset_1=200 
skiplaserfire

    if gamedifficulty>1 then gosub cannon_fire bank2 ; Add cannon for advanced and expert levels

    drawscreen

  goto MainLoop

 ;------------------------------------------END MAIN LOOP-----------------------------------------------------------------


sfx_defense_beam
   playsfx sfx_simplebuzz
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

 bank 2
    ;incgraphic gfx/ex2/text_levelup_top.png  160A 1 0 2 3
    ;incgraphic gfx/ex2/text_levelup_bottom.png   160A 1 0 2 3
    incgraphic gfx/ex2/progress_bar_full.png  160A 1 0 2 3
    incgraphic gfx/ex2/progress_bar_line.png  160A 1 0 2 3

    ;──═◙ On-Screen Display

CopyTextZoneContentToRam

   if message=1 then goto msg_default
   if message=2 then goto msg_laser
   if message=3 then goto msg_health
   if message=4 then goto msg_laser_health
    
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

    ;──═◙ On-Screen Text Data
    alphadata textZoneContent_default font2
    '                                        '
    'destroy enemy tanks!                                                                                          '
    'take out the soldiers!                                                                                        '
    '                                        '
end
    alphadata textZoneContent_laser font2
    '                                        '
    'laser charge is low!                                                                                          '
    'recharge your laser, captain!                                                                                 '
    '                                        '
end
    alphadata textZoneContent_health font2
    '                                        '
    'drone health is low!                                                                                          '
    'fly defensively, captain!                                                                                     '
    '                                        '
end
    alphadata textZoneContent_laser_health font2
    '                                        '
    'laser charge and health are low!                                                                              '
    'be careful out there, captain!                                                                                '
    '                                        '
end

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
    inline blockbank8.asm

game_logic

    ;──═◙ Background Color
    BACKGRND = $00; Top of Screen 

    if healthLo=$00 && healthMed = $01 then goto skiphealthcheck
    ; Game Over
    if healthLo<$01 || healthMed>$01 then healthLo=$00:healthMed=$00:player_flag=1:gosub game_over; if health falls to zero, you are dead - add animation, explosion, game over, etc.
skiphealthcheck

    ;──═◙ Fire Cannon (Bottom of the screen)
    if beam_counter<30 then cannon_fire_ypos=cannon_fire_ypos-4 
    if beam_counter>29 || cannon_fire_ypos<6 then cannon_fire_ypos=163

    ;──═◙ Level Check
    gosub level_check bank8
    ;if pointsHi<$05 then gosub level_check bank8
    ;if pointsHi>=$05 then gosub level_check2 bank8

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
    if frame_counter>2 then frame_counter=0:man1_xpos=man1_xpos+1:man2_xpos=man2_xpos+1:man3_xpos=man3_xpos+1
    if frame_counter=2 then animate1=animate1+1:cannon_xpos=cannon_xpos+1 :cannon_fire_xpos=cannon_fire_xpos+1
    if animate1>3 then animate1=0 : tank1_xpos=tank1_xpos+1: tank2_xpos=tank2_xpos+1: tank3_xpos=tank3_xpos+1;:man1_xpos=man1_xpos+2:man2_xpos=man2_xpos+2:man3_xpos=man3_xpos+2
    animate2=animate2+1
    if animate2>4 then animate2=0
    if animate2=3 then animate3=animate3+1:animate4=animate4+1:animate5=animate5+1  
    if animate3>3 && tank1_flag=1 then tank1_flag=0:dec scorea=scorea+75:tank1_xpos=200:crosshair_x_offset_1=200
    if animate4>3 && tank2_flag=1 then tank2_flag=0:dec scorea=scorea+75:tank2_xpos=200:crosshair_x_offset_1=200
    if animate5>3 && tank3_flag=1 then tank3_flag=0:dec scorea=scorea+75:tank3_xpos=200:crosshair_x_offset_1=200
    if animate3>3 then animate3=0
    if animate4>3 then animate4=0
    if animate5>3 then animate5=0

    animation_counter=animation_counter+1
    if animation_counter>3 then animation_counter=0:animate6=animate6+1
    if animate6>7 && man1_flag=1 then man1_flag=0:man1_xpos=200
    if animate6>7 && man2_flag=1 then man2_flag=0:man2_xpos=200
    if animate6>7 && man3_flag=1 then man3_flag=0:man3_xpos=200
    if animate6>7 then animate6=0
    
    ;──═◙ Tank Speed based on level selection
    tank1_xpos=tank1_xpos+tank1_speed:tank2_xpos=tank2_xpos+tank2_speed:tank3_xpos=tank3_xpos+tank3_speed
    man1_xpos=man1_xpos+man1_speed:man2_xpos=man2_xpos+man2_speed:man3_xpos=man3_xpos+man3_speed            ; Does this work? Fractional XPOS speed for soldiers?
    
    ;──═◙ Set Scrolling text message
    if laserLo>$15 && healthLo>$25 then message=1  ; default message
    if laserLo<$16 && healthLo>$25 then message=2  ; laser level low, health normal
    if laserLo>$15 && healthLo<$26 then message=3  ; laser level normal, health low
    if laserLo<$16 && healthLo<$26 then message=4  ; laser and health are low
        
    ;──═◙ Laser Fire Counter / Status
    if laserLo<1 then laserLo=0
    if fire_debounce_1=1 && frame_counter=2 && laserLo<>0 && drone_ypos>21 then dec laserLo=laserLo-1 ; fire button pressed, frame counter at 2, in firing range below Y22

    ;──═◙ Flip direction of the Helicopter based on facing left or right
    if joy0left then joydir = 1   ; Face Left
    if joy0right then joydir = 2  ; Face Right

    ;──═◙ Move the drone on the screen
    if joy0right then drone_xpos=drone_xpos+1+drone_speed
    if joy0left then drone_xpos=drone_xpos-1-drone_speed
    if joy0up then drone_ypos=drone_ypos-1-drone_speed
    if joy0down then drone_ypos=drone_ypos+1+drone_speed

    ;──═◙ Keep the drone on the screen
    if player_flag=1 || player_flag=2 then goto skipdrone
    if drone_ypos>90 then drone_ypos=90
    if drone_ypos<8 then drone_ypos=8
    if drone_xpos<8 then drone_xpos=8
    if drone_xpos>128 then drone_xpos=128
skipdrone

    ;──═◙ Change direction of the landscape scrolling based on the direction you're moving the drone
    if joy0left then direction = 1
    if joy0right then direction = 0

    ;──═◙ Increase/decrease speed of enemies on the ground based on helicopter movement
    if joy0right then tank1_xpos=tank1_xpos-4:tank2_xpos=tank2_xpos-3:tank3_xpos=tank3_xpos-2:radar1_xpos=radar1_xpos-2:man1_xpos=man1_xpos-4:man2_xpos=man2_xpos-3:man3_xpos=man3_xpos-2
    if joy0left then tank1_xpos=tank1_xpos+4:tank2_xpos=tank2_xpos+3:tank3_xpos=tank3_xpos+2:radar1_xpos=radar1_xpos+2:man1_xpos=man1_xpos+4:man2_xpos=man2_xpos+3:man3_xpos=man3_xpos+2
    if gamedifficulty>2 then radar1_xpos=radar1_xpos+1

    ;──═◙ Move the cruise missiles on the screen
    ;──═◙ if missile is off-screen, reposition Y value
    if missile1_xpos>180 && missile1_xpos<190 then missile1_ypos=missile1_ypos+1
    if missile1_xpos>180 && missile1_xpos<190 then missile2_ypos=missile2_ypos+5
    if missile1_xpos>180 && missile1_xpos<190 then missile3_ypos=missile3_ypos+9

    ;──═◙ if that Y value is below Y90, then reset back to default
    if missile1_ypos>90 then missile1_ypos=rand&64
    if missile2_ypos>90 then missile2_ypos=rand&64
    if missile3_ypos>90 then missile3_ypos=rand&64

    ;──═◙ Always move the missile from right to left
    missile1_xpos=missile1_xpos-1-missile1_speed
    missile2_xpos=missile2_xpos-1-missile2_speed
    missile3_xpos=missile3_xpos-1-missile3_speed

    ;Move laser recharge laser_powerup
    laser_powerup_xpos=laser_powerup_xpos+1
    if beam_counter<30 then laser_powerup_xpos=laser_powerup_xpos+2
    ;if beam_counter>29 && beam_counter<71 then laser_powerup_xpos=laser_powerup_xpos-3
    if beam_counter>70 then laser_powerup_xpos=laser_powerup_xpos-3

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

    ;──═◙ Set Y Positions for the City Defense Beam
    defensebeam_y_offset_1 = radar1_ypos-8
    defensebeam_y_offset_2 = radar1_ypos-16
    defensebeam_y_offset_3 = radar1_ypos-24
    defensebeam_y_offset_4 = radar1_ypos-32
    defensebeam_y_offset_5 = radar1_ypos-40
    defensebeam_y_offset_6 = radar1_ypos-48
    defensebeam_y_offset_7 = radar1_ypos-56
    defensebeam_y_offset_8 = radar1_ypos-64
    defensebeam_y_offset_9 = radar1_ypos-72
    defensebeam_x_offset_1 = radar1_xpos+1

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
game_over_loop

    frame_counter=frame_counter+1
    if frame_counter>2 then frame_counter=0
    if frame_counter=2 then animate1=animate1+1 
    if animate1>3 then animate1=0 

    if joy0fire then debounce_fire=7
    if !joy0fire && debounce_fire=7 then debounce_fire=8
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
    if pointsHi<=$01 && pointsMed<=$49 && pointsMed<=$99 then plotchars 'rank: private' 1 48 8             ; level_1
    ; L2   Specialist    Low:  5,000   High: 09,900
    if pointsHi<=$01 && pointsMed>=$50 && pointsMed<=$99 then plotchars 'rank: specialist' 1 43 8          ; level_2
    ; L3   Corporal      Low: 10,000   High: 19,900 
    if pointsHi>=$01 && pointsHi<$02 && pointsMed<=$99                   then plotchars 'rank: corporal' 1 47 8            ; level_3  
    ; L4   Sergeant      Low: 20,000   High: 29,900  
    if pointsHi>=$02 && pointsHi<$03 && pointsMed<=$99                   then plotchars 'rank: sergeant' 1 47 8            ; level_4 
    ; L5   Sergeant Major    Low: 30,000   High: 39,900  
    if pointsHi>=$03 && pointsHi<$04 && pointsMed<=$99                   then plotchars 'rank: sergeant major' 1 35 8      ; level_5  
    ; L6   Lieutenant    Low: 40,000   High  49,900  
    if pointsHi>=$04 && pointsHi<$05 && pointsMed<=$99                   then plotchars 'rank: lieutenant' 1 43 8          ; level_6 
    ; L7   Captain    Low: 50,000   High  59,900  
    if pointsHi>=$05 && pointsHi<$06 && pointsMed<=$99                   then  plotchars 'rank: captain' 1 48 8            ; level_7 
    ; L8   Major    Low: 60,000   High  69,900  
    if pointsHi>=$06 && pointsHi<$07 && pointsMed<=$99                   then plotchars 'rank: major' 1 53 8               ; level_8 
    ; L9   Lieutenant Colonel    Low: 70,000   High  79,900 
    if pointsHi>=$07 && pointsHi<$08 && pointsMed<=$99                   then plotchars 'rank: lieutenant colonel' 1 27 8  ; level_9  
    ; L10  Colonel    Low: 80,000   High  89,900 
    if pointsHi>=$08 && pointsHi<$09 && pointsMed<=$99                   then plotchars 'rank: colonel' 1 48 8             ; level_10 
    ; L11+ General     Low: 90,000+
    if pointsHi>=$09                                                     then plotchars 'rank: general' 1 48 8             ; level_11+
    plotchars 'press fire to restart' 0  33  10
skip_text_draw

    drawscreen
    goto game_over_loop

level_up
    playsfx sfx_bigboom
    healthMed = $01 : healthLo = $00 ; recharge health on level up
    tank1_xpos=1      :  tank1_ypos=168
    tank2_xpos=36     :  tank2_ypos=136
    tank3_xpos=96     :  tank3_ypos=112
    radar1_xpos=142   :  radar1_ypos=96
    missile1_xpos=181 :  missile1_ypos=25
    missile2_xpos=189 :  missile2_ypos=50
    missile3_xpos=185 :  missile3_ypos=75
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
    if joy0fire then fire_debounce_1=12
    if !joy0fire && fire_debounce_1=12 then fire_debounce_1=13
    if fire_debounce_1=13 then fire_debounce_1=0:beam_counter=0:return

    restorescreen

    ; Plot the Level Up graphic on screen
    plotsprite text_levelup_top 0 34 38
    plotsprite text_levelup_bottom 0 34 46
    if beam_counter<64 then gosub sprite_draw bank2 else gosub status_bar:plotsprite drone1 1 drone_xpos drone_ypos animate1 
  
    temporary=beam_counter+34

    ; Plot recharge progress bar
    plotsprite progress_bar_full 4 32 60 
    plotsprite progress_bar_line 4 temporary 60


    plotchars 'health & laser recharged' 0 29 9
    plotchars 'press fire to continue' 0  33  10

    drawscreen
    goto level_up_loop

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
    if player_flag<>2 then plotsprite      drone1                      1      drone_xpos      drone_ypos      animate1        ; Drone
    if tank3_flag=0 then plotsprite        tank3                       3      tank3_xpos      tank3_ypos      animate3        ; Tank3 Sprite
    if tank3_flag=1 then plotsprite        implosion1                  3      tank3_xpos      tank3_ypos      animate3        ; Tank3 Explosion Animation
    if tank2_flag=0 then plotsprite        tank2                       5      tank2_xpos      tank2_ypos      animate4        ; Tank2 Sprite
    if tank2_flag=1 then plotsprite        implosion1                  3      tank2_xpos      tank2_ypos      animate4        ; Tank2 Explosion Animation
    if tank1_flag=0 then plotsprite        tank1                       6      tank1_xpos      tank1_ypos      animate5        ; Tank1 Sprite
    if tank1_flag=1 then plotsprite        implosion1                  3      tank1_xpos      tank1_ypos      animate5        ; Tank1 Explosion Animation
    plotsprite                             radar                       0      radar1_xpos     radar1_ypos     animate3        ; Missile Defense Sprite
    if gamedifficulty>0 then plotsprite    missile1                    5      missile1_xpos   missile1_ypos   animate1        ; Enemy Missile 1
    if gamedifficulty>0 then plotsprite    missile1                    3      missile2_xpos   missile2_ypos   animate1        ; Enemy Missile 2
    plotsprite                             missile1                    6      missile3_xpos   missile3_ypos   animate1        ; Enemy Missile 3
    if gamedifficulty>1 then plotsprite    radar                       1      cannon_xpos     cannon_ypos     animate3        ; Cannon
    if laserLo=$00 then plotsprite         laser_powerup               4      laser_powerup_xpos   laser_powerup_ypos         ; Laser Powerup 
    
    if man1_flag=0 then plotsprite         man8_run_anim1              4      man1_xpos       man1_ypos       animate6
    if man1_flag=1 then plotsprite         man8_explode1               4      man1_xpos       man1_ypos       animate6
    if man2_flag=0 then plotsprite         man8_run_anim1              4      man2_xpos       man2_ypos       animate6
    if man2_flag=1 then plotsprite         man8_explode1               4      man2_xpos       man2_ypos       animate6
    if man3_flag=0 then plotsprite         man8_run_anim1              4      man3_xpos       man3_ypos       animate6
    if man3_flag=1 then plotsprite         man8_explode1               4      man3_xpos       man3_ypos       animate6

    ;plotsprite                            missile1                    5      missile1_xpos   missile1_ypos   animate1        ; Enemy Missile 1
    ;plotsprite                            missile1                    3      missile2_xpos   missile2_ypos   animate1        ; Enemy Missile 2

status_bar

   ;┌───────────────────────────────────┬────────────────────────┬─────────┬──────────────┬──────────────┬─────────────────┬─────────────────────────────────────────┐       
   ;│ Code                              │   sprite               │ palette │      X       │      Y       │ animation frame │   Notes                                 │
   ;└───────────────────────────────────┴────────────────────────┴─────────┴──────────────┴──────────────┴─────────────────┴─────────────────────────────────────────┘
    plotsprite                             text_score                 0           0              176
    plotsprite                             text_level                 0           53             176  
    plotsprite                             text_laser                 0           88             176
    plotsprite                             text_health                0           124            176

   ;┌──────────┬─────────────────────┬─────────┬───────┬──────────┬─────┬─────┬─────────────────────────┐       
   ;│ Code     │  score graphics     │ palette │ Value │ # Digits │  X  │  Y  │   Notes                 │
   ;└──────────┴─────────────────────┴─────────┴───────┴──────────┴─────┴─────┴─────────────────────────┘    
    plotvalue    scoredigits              3     scorea       6       22    22    ; Score  (23 Bottom Y)
    plotvalue    scoredigits              3     levelLo      2       75    22    ; Level  (23 Bottom Y)
    plotvalue    scoredigits              3     laserLo      2       110   22    ; Laser  (23 Bottom Y)
    plotvalue    scoredigits              3     healthMed    1       149   22    ; Health  (23 Bottom Y)
    plotvalue    scoredigits              3     healthLo     2       153   22    ; Health  (23 Bottom Y)

  return

draw_laser

    
   ;┌───────────────────────────────────┬────────────────────────┬─────────┬──────────────────────┬─────────────────────┬─────────────────┬─────────────────────────────────────────┐       
   ;│ Code                              │   sprite               │ palette │          X           │         Y           │ animation frame │   Notes                                 │
   ;└───────────────────────────────────┴────────────────────────┴─────────┴──────────────────────┴─────────────────────┴─────────────────┴─────────────────────────────────────────┘
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_1
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_2
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_3
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_4
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_5
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_6
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_7
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_8
    plotsprite                              laser                     2       laser_x_offset_1      laser_y_offset_9
    plotsprite                              crosshair                 2       crosshair_x_offset_1  laser_y_offset_10

  return 

draw_defensebeam
    
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

Init

    clearscreen

    ;──═◙ Set Palette Colors
    P0C1 = $F7 : P0C2 = $1C : P0C3 = $0F  ; City Defense Beam              
    P1C1 = $0F : P1C2 = $46 : P1C3 = $08  ; Drone: c1 rotors  c2 body  c3 middle
    P2C1 = $42 : P2C2 = $4A : P2C3 = $0C  ; Laser
    P3C1 = $33 : P3C2 = $34 : P3C3 = $38  ; Top Enemy Vehicle
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
    radar1_xpos=142   :  radar1_ypos=96
    missile1_xpos=181 :  missile1_ypos=25
    missile2_xpos=189 :  missile2_ypos=50
    missile3_xpos=185 :  missile3_ypos=75
    laser_powerup_xpos=45:laser_powerup_ypos=10
    cannon_xpos=72     :  cannon_ypos=168
    cannon_fire_xpos=73:  cannon_fire_ypos=163
    man1_xpos=35      :  man1_ypos=168
    man2_xpos=65      :  man2_ypos=136
    man3_xpos=90      :  man3_ypos=112

    ;──═◙ Set Flags
    tank1_flag=0
    tank2_flag=0
    tank3_flag=0
    man1_flag=0
    man2_flag=0
    man3_flag=0
    player_flag=0
    level_flag=0       ; Flag for displaying the level up text
    message=1
    
    ;──═◙ Top Line Text
    ;plotchars 'test' 0 0 0
 
    ;──═◙ Set Bottom scroll area
    for x = 0 to 3
        offsetX = (x*64)
        plotsprite bottomlayer1 4 offsetX 96
        plotsprite bottomlayer2 7 offsetX 104
        plotsprite bottomlayer3 7 offsetX 120
        if x = 0 || x = 2 then plotsprite bottomlayer41 7 offsetX 144 else plotsprite bottomlayer42 7 offsetX 144
    next 

    ;──═◙ Copy the text zone RAM to the screen
    plotchars textZoneRAM 0 0 23 32 : plotchars textZoneRAMAdd 0 128 23 8
    textZoneIndex = 0 : gosub CopyTextZoneContentToRam

    ;──═◙ Set Initial direction of scrolling
    direction = 0

    ;──═◙ Reset frame counters
    animate1=0

    ;──═◙ Set initial direction of helicopter
    joydir = 2

    ;──═◙ Score Values
    healthHi = $78 : healthMed = $01 : healthLo = $00
    laserHi = $00  : laserMed = $00  
    pointsHi = $00 : pointsMed = $00 : pointsLo = $00
    levelHi = $00  : levelMed = $00  : levelLo = $01

     if gamedifficulty=0 then laserLo=$99
     if gamedifficulty=1 then laserLo=$75
     if gamedifficulty=2 then laserLo=$50
     if gamedifficulty=3 then laserLo=$25

    ;──═◙ Top of Screen Graphic
    plotsprite top_bar_1 7 0 0
    plotsprite top_bar_3 7 32 0
    plotsprite top_bar_1 7 64 0
    plotsprite top_bar_2 7 96 0
    plotsprite top_bar_1 7 128 0

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

    ;──═◙ Set Y Positions for theSet Palette Colors
    P0C1 = $80 : P0C2 = $84 : P0C3 = $88  ; title/background   C1 - Sky  C2 - Middle Row  C3 - Back Row  |  Background - Front Row    
    P2C1 = $88 : P2C2 = $88 : P2C3 = $88  ; menu
    P5C1 = $28 : P5C2 = $28 : P5C3 = $28
    P6C1 = $48 : P6C2 = $48 : P6C3 = $48
    P7C1 = $28 : P7C2 = $28 : P7C3 = $28  ; menu
    BACKGRND=$00

    ;──═◙ Set Y Positions for theSet initial Menu Index and Position Variables
    menu_yposition=6

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
    plotbanner drone_title_bar_text 0 0 8
    plotbanner drone_title_bar 0 0 24
    plotbanner drone_title_bar 0 0 32
    plotbanner drone_title_bar 0 0 40
    plotbanner drone_title_bar 0 0 48
    plotbanner drone_title_bar 0 0 56
    plotbanner drone_title_bar 0 0 64
    plotbanner drone_title_bar 0 0 72
    plotbanner drone_title_bar 0 0 80
    plotbanner drone_title10 0 0 88

    plotchars 'current score' 5  18  23
    plotchars 'high score' 6  94  23
    plotvalue scoredigits 5 scorea 6   32    22    ; Current Score  (23 Bottom Y)
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
    if menu_yposition=6 then menu_selection_color1=7:menu_selection_color2=2: ; 1st Line Highlighted | Other lines alternate color
    if menu_yposition=9 then menu_selection_color1=2:menu_selection_color2=7: ; 2nd Line Highlighted | Other lines alternate color

    ;──═◙ Plot Menu Choices on screen
    ; The palette choice for each line is a variable based on the preceding section of code.
    ;--------------------------
    plotchars 'skill:'     menu_selection_color1  48  6        ; {5=Skill} Menu Selection is based on the Y value of where this is plotted
    plotchars 'start game' menu_selection_color2  56  9        ; {8=Start} Menu Selection is based on the Y value of where this is plotted

    ;
    ;  Menu Text   Text X/Y Location   Menu Choice X/Y Location and Option Text            Variables
    ;  -----------------------------   -------------------------------------------------   --------------------------------------------------
    ;  Skill:      [X:42,Y:5]          [X:72,Y:5]  (Novice, Standard, Expert)              menu_option_skill (1=Novice,2=Standard,3=Expert)
    ;  Lives:      [x:42,Y:6]          [X:72,Y:5]  (One Life, Two Lives, Three Lives)      menu_option_lives (1=One,2=Two,3=Three)
    ;  Level:      [X:42,Y:7]          [X:72,Y:5]  (Level One, Level Two, Level Three)     menu_option_level (1=One,2=Two,3=Three)
    ;  Start Game  [X:42,Y:8]          [X:72,Y:5]  (Single Choice, Fire Button Activates)  N/A
    ;

    ;──═◙ Move Menu Selection - Joystick Down [Choose Skill, Lives, or Level when pressing down]
    ; If you press the joystick down, it will move down the menu by one.  If you're already at hte bottom, it stays on the bottom line.
    ;--------------------------
    if debounce_down=6 && menu_yposition=6 then gosub menu_sound:debounce_down=0:menu_yposition=9         ;If you are on the first line of the menu and push down, move down one to the second
    ;if debounce_down=6 && menu_yposition=6 then gosub menu_sound:debounce_down=0:menu_yposition=7         ;If you are on the second line of the menu and push down, move down to the third
    ;if debounce_down=6 && menu_yposition=7 then gosub menu_sound:debounce_down=0:menu_yposition=8         ;If you are on the third line of the menu and push down, move down to the fourth
    if debounce_down=6 && menu_yposition=9 then gosub menu_sound:debounce_down=0:menu_yposition=9         ;If you are on the fourth line of the menu and push down, stay on that line (you could also scroll back up to the top)

    ;──═◙ Move Menu Selection - Joystick Up [Choose Skill, Lives, or Level when pressing up]
    ; If you press the joystick up, it will move up the menu by one.  If you're already at the top, it stays on the top line.
    ;--------------------------
    if debounce_up=6 && menu_yposition=6 then gosub menu_sound:debounce_up=0:menu_yposition=6             ;If you are on the first line of the menu and push up, stay on the first line.
    ;if debounce_up=6 && menu_yposition=6 then gosub menu_sound:debounce_up=0:menu_yposition=5             ;If you are on the second line of the menu and push up, go up to the first
    ;if debounce_up=6 && menu_yposition=7 then gosub menu_sound:debounce_up=0:menu_yposition=6             ;If you are on the third line of the menu and push up, go up to the second
    if debounce_up=6 && menu_yposition=9 then gosub menu_sound:debounce_up=0:menu_yposition=6             ;If you are on the fourth line of the menu and push up, go up to the third

    ;──═◙ Move left/Right on a Menu Selection [Choose a specific option for each menu item by pushing left or right]
    ;  If you keep pressing right or left after you've gone through all of the available choices, it will continue to cycle through all of them starting over from the beginning.
    ;--------------------------
    ;Set Skill Level [First Menu Item] Pushing Right on Joystick
    if menu_yposition=6 && debounce_right=6 && menu_option_skill=1 then gosub menu_sound:menu_option_skill=2:debounce_right=0     ; YPos=5 {Skill} | Current Skill=1 => Set Skill to 2 and reset debounce
    if menu_yposition=6 && debounce_right=6 && menu_option_skill=2 then gosub menu_sound:menu_option_skill=3:debounce_right=0     ; YPos=5 {Skill} | Current Skill=2 => Set Skill to 3 and reset debounce
    if menu_yposition=6 && debounce_right=6 && menu_option_skill=3 then gosub menu_sound:menu_option_skill=4:debounce_right=0     ; YPos=5 {Skill} | Current Skill=3 => Set Skill to 4 and reset debounce
    if menu_yposition=6 && debounce_right=6 && menu_option_skill=4 then gosub menu_sound:menu_option_skill=1:debounce_right=0     ; YPos=5 {Skill} | JoyRight Pressed & Released | Current Skill=3 => Set Skill to 1 and reset debounce
    ;Set Skill Level [First Menu Item] Pushing Left on Joystick
    if menu_yposition=6 && debounce_left=6 && menu_option_skill=1 then gosub menu_sound:menu_option_skill=4:debounce_left=0       ; YPos=5 {Skill} | Current Skill=1 => Set Skill to 4 and reset debounce
    if menu_yposition=6 && debounce_left=6 && menu_option_skill=2 then gosub menu_sound:menu_option_skill=1:debounce_left=0       ; YPos=5 {Skill} | Current Skill=2 => Set Skill to 1 and reset debounce
    if menu_yposition=6 && debounce_left=6 && menu_option_skill=3 then gosub menu_sound:menu_option_skill=2:debounce_left=0       ; YPos=5 {Skill} | Current Skill=3 => Set Skill to 2 and reset debounce
    if menu_yposition=6 && debounce_left=6 && menu_option_skill=4 then gosub menu_sound:menu_option_skill=3:debounce_left=0       ; YPos=5 {Skill} | Current Skill=4 => Set Skill to 3 and reset debounce
    ;--------------------------

    ;──═◙ Plot Menu Choices based on the current value of the menu option   
    ;--------------------------
    ;Plot Skill Choice Text
    if menu_option_skill = 1 then gamedifficulty=0:plotchars 'easy' 2 72 6
    if menu_option_skill = 2 then gamedifficulty=1:plotchars 'standard' 2 72 6
    if menu_option_skill = 3 then gamedifficulty=2:plotchars 'advanced' 2 72 6
    if menu_option_skill = 4 then gamedifficulty=3:plotchars 'expert' 2 72 6

    ;──═◙ Start the game if you push the button while the Start Game Menu Option is selected
    ;--------------------------   
    if debounce_fire=6 && menu_yposition=9 then clearscreen:debounce_fire=0:beam_counter=0:playsfx sfx_longgongsilver:goto set_speed
    
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
    plotsprite text_getready_top 0 24 40:    plotsprite text_getready_bottom 0 24 48 ; plotchars 'get ready!' 2 58 8

    if menu_option_skill=1 then goto speed_1 ; Easy 
    if menu_option_skill=2 then goto speed_2 ; Standard 
    if menu_option_skill=3 then goto speed_3 ; Advanced
    if menu_option_skill=4 then goto speed_4 ; Expert

speed_1                ;Easy Mode
    tank1_speed=0.0
    tank2_speed=0.0
    tank3_speed=0.0
    tank4_speed=0.0
    man1_speed=0.1
    man2_speed=0.2
    man3_speed=0.3
    missile1_speed=0.0
    missile2_speed=0.0
    missile3_speed=0.0
    drone_speed=0.0
    goto speed_end
speed_2                ;Standard Mode
    tank1_speed=0.2
    tank2_speed=0.3
    tank3_speed=0.4
    tank4_speed=0.5
    man1_speed=0.3
    man2_speed=0.4
    man3_speed=0.5
    missile1_speed=0.2
    missile2_speed=0.4
    missile3_speed=0.2
    drone_speed=0.6
    goto speed_end
speed_3                ;Advanced Mode
    tank1_speed=0.7
    tank2_speed=0.6
    tank3_speed=0.5
    tank4_speed=0.8
    man1_speed=0.5
    man2_speed=0.6
    man3_speed=0.7
    missile1_speed=0.6
    missile2_speed=0.8
    missile3_speed=0.6
    drone_speed=1.0
    goto speed_end
speed_4                ;Expert Mode
    tank1_speed=1.7
    tank2_speed=1.4
    tank3_speed=1.2
    tank4_speed=1.3
    man1_speed=0.7
    man2_speed=0.8
    man3_speed=0.9
    missile1_speed=1.1
    missile2_speed=1.2
    missile3_speed=1.1
    drone_speed=1.3
speed_end
    drawscreen
   beam_counter=beam_counter+1
   if beam_counter>70 then clearscreen
   if beam_counter>88 then drawscreen:return
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

 bank 8
    incbanner gfx/ex2/AA_Logo3.png 160A 0 1 2 3

aa_logo_display
    P0C1=$08 : P0C2=$08 : P0C3=$08
    P4C1=$08 : P4C2=$82 : P4C3=$34 
   drawwait
   clearscreen
    if joy0fire then debounce_fire=2
    if !joy0fire && debounce_fire=2 then debounce_fire=3
    if debounce_fire=3 then debounce_fire=0:player_flag=0:return
   beam_counter=beam_counter+1
   if beam_counter>250 then return
   plotbanner AA_Logo3 4 28 48 
   plotchars 'presents' 0 64 13
   plotchars 'a game by steve engelhardt' 0 28 15
   plotchars '(c) 2023' 0 64 17
   drawscreen
   goto aa_logo_display

level_check

    ; Level up progression based on score.  
    ; After level 10 speeds do not change, but level will still increment.
    ; Change City color for each level advancement
    ; ValueCheckHi=pointsHi:ValueCheckMd=pointsMed:ValueCheckLo=pointsLo:gosub CheckValue
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
    ;pointsHi=$08:pointsMed=$99:pointsLo=$00
    ;Default City Colors:  P4C1 = $02 : P4C2 = $06 : P4C3 = $0A
    
    ;level_flag default is 0
    
    ; L2       Low:  5,000   High: 09,900
    if pointsHi<=$01 && pointsMed>=$50 && pointsMed<=$99 && level_flag=0 then levelLo=$02: P4C1=$12:P4C2=$16:P4C3=$0A: level_flag=1: gosub set_level_2
    if level_flag=1 then gosub level_up bank2:level_flag=2

                        ; For Testing:  if pointsMed>=$51 && level_flag=2 then levelLo=$03:   P4C1=$22:P4C2=$26:P4C3=$08: level_flag=3: gosub set_level_3  ; 01 49 00  
                        ; For Testing:  if level_flag=3 then gosub level_up bank2:level_flag=4
    
    ; L3       Low: 10,000   High: 19,900 
    if pointsHi>=$01 && pointsMed<=$99 && level_flag=2 then levelLo=$03:   P4C1=$22:P4C2=$26:P4C3=$08: level_flag=3: gosub set_level_3  ; 01 49 00  
    if level_flag=3 then gosub level_up bank2:level_flag=4

    ; L4       Low: 20,000   High: 29,900  
    if pointsHi>=$02 && pointsMed<=$99 && level_flag=4 then levelLo=$04:   P4C1=$32:P4C2=$36:P4C3=$0A: level_flag=5: gosub set_level_4 
    if level_flag=5 then gosub level_up bank2:level_flag=6 
    
    ; L5       Low: 30,000   High: 39,900  
    if pointsHi>=$03 && pointsMed<=$99 && level_flag=6 then levelLo=$05:   P4C1=$62:P4C2=$66:P4C3=$08: level_flag=7: gosub set_level_5  
    if level_flag=7 then gosub level_up bank2:level_flag=8
    
    ; L6       Low: 40,000   High  49,900  
    if pointsHi>=$04 && pointsMed<=$99 && level_flag=8 then levelLo=$06:   P4C1=$52:P4C2=$56:P4C3=$0A: level_flag=9: gosub set_level_6 
    if level_flag=9 then gosub level_up bank2:level_flag=10

    ;return

level_check2
    
    ; L7       Low: 50,000   High  59,900  
    if pointsHi>=$05 && pointsMed<=$99 && level_flag<=10 then levelLo=$07:   P4C1=$42:P4C2=$46:P4C3=$08: level_flag=11: gosub set_level_7 
    if level_flag=11 then gosub level_up bank2:level_flag=12 

    ; L8       Low: 60,000   High  69,900  
    if pointsHi>=$06 && pointsMed<=$99 && level_flag=12 then levelLo=$08:   P4C1=$72:P4C2=$76:P4C3=$0A: level_flag=13: gosub set_level_8 
    if level_flag=13 then gosub level_up bank2:level_flag=14
    
    ; L9       Low: 70,000   High  79,900 
    if pointsHi>=$07 && pointsMed<=$99 && level_flag=14 then levelLo=$09:   P4C1=$82:P4C2=$86:P4C3=$08: level_flag=15: gosub set_level_9  
    if level_flag=15 then gosub level_up bank2:level_flag=16
    
    ; L10      Low: 80,000   High  89,900 
    if pointsHi>=$08 && pointsMed<=$99 && level_flag=16 then levelLo=$10:   P4C1=$A2:P4C2=$A6:P4C3=$0A: level_flag=17: gosub set_level_10 
    if level_flag=17 then gosub level_up bank2:level_flag=18
        
    ; L11+      Low: 90,000+
    if pointsHi>=$09 && pointsMed<=$99 && level_flag<=18 then levelLo=$11:   P4C1=$C2:P4C2=$C6:P4C3=$0A: level_flag=19: gosub set_level_11
    if level_flag=19 then gosub level_up bank2:level_flag=20

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
    tank1_speed=0.1
    tank2_speed=0.1
    tank3_speed=0.1
    tank4_speed=0.1
    missile1_speed=0.1
    missile2_speed=0.1
    missile3_speed=0.1
    drone_speed=0.0
    goto speed_enda
speed_2a                ;Standard Mode
    tank1_speed=0.5
    tank2_speed=0.4
    tank3_speed=0.1
    tank4_speed=0.6
    missile1_speed=0.3
    missile2_speed=0.5
    missile3_speed=0.3
    drone_speed=0.6
    goto speed_enda
speed_3a                ;Advanced Mode
    tank1_speed=0.8
    tank2_speed=0.7
    tank3_speed=0.6
    tank4_speed=0.9
    missile1_speed=0.7
    missile2_speed=0.9
    missile3_speed=0.7
    drone_speed=1.0
    goto speed_enda
speed_4a                ;Expert Mode
    tank1_speed=1.8
    tank2_speed=1.5
    tank3_speed=1.3
    tank4_speed=1.4
    missile1_speed=1.2
    missile2_speed=1.3
    missile3_speed=1.4
    drone_speed=1.3
speed_enda
    return

set_level_3
    if menu_option_skill=1 then goto speed_1b ; Easy 
    if menu_option_skill=2 then goto speed_2b ; Standard 
    if menu_option_skill=3 then goto speed_3b ; Advanced
    if menu_option_skill=4 then goto speed_4b ; Expert

speed_1b                ;Easy Mode
    tank1_speed=0.2
    tank2_speed=0.2
    tank3_speed=0.2
    tank4_speed=0.2
    missile1_speed=0.2
    missile2_speed=0.2
    missile3_speed=0.2
    drone_speed=0.0
    goto speed_endb
speed_2b                ;Standard Mode
    tank1_speed=0.6
    tank2_speed=0.5
    tank3_speed=0.2
    tank4_speed=0.7
    missile1_speed=0.4
    missile2_speed=0.5
    missile3_speed=0.4
    drone_speed=0.6
    goto speed_endb
speed_3b                ;Advanced Mode
    tank1_speed=0.9
    tank2_speed=0.8
    tank3_speed=0.7
    tank4_speed=1.0
    missile1_speed=0.8
    missile2_speed=1.0
    missile3_speed=0.8
    drone_speed=1.0
    goto speed_endb
speed_4b                ;Expert Mode
    tank1_speed=1.8
    tank2_speed=1.6
    tank3_speed=1.4
    tank4_speed=1.4
    missile1_speed=1.3
    missile2_speed=1.4
    missile3_speed=1.5
    drone_speed=1.3
speed_endb
    return

set_level_4
    if menu_option_skill=1 then goto speed_1c ; Easy 
    if menu_option_skill=2 then goto speed_2c ; Standard 
    if menu_option_skill=3 then goto speed_3c ; Advanced
    if menu_option_skill=4 then goto speed_4c ; Expert

speed_1c                ;Easy Mode
    tank1_speed=0.3
    tank2_speed=0.3
    tank3_speed=0.3
    tank4_speed=0.3
    missile1_speed=0.3
    missile2_speed=0.3
    missile3_speed=0.3
    drone_speed=0.0
    goto speed_endc
speed_2c                ;Standard Mode
    tank1_speed=0.7
    tank2_speed=0.6
    tank3_speed=0.4
    tank4_speed=0.7
    missile1_speed=0.5
    missile2_speed=0.6
    missile3_speed=0.4
    drone_speed=0.6
    goto speed_endc
speed_3c                ;Advanced Mode
    tank1_speed=0.8
    tank2_speed=0.9
    tank3_speed=0.8
    tank4_speed=0.9
    missile1_speed=0.9
    missile2_speed=1.1
    missile3_speed=0.9
    drone_speed=1.0
    goto speed_endc
speed_4c                ;Expert Mode
    tank1_speed=1.9
    tank2_speed=1.6
    tank3_speed=1.5
    tank4_speed=1.5
    missile1_speed=1.4
    missile2_speed=1.5
    missile3_speed=1.6
    drone_speed=1.3
speed_endc
    return

set_level_5
    if menu_option_skill=1 then goto speed_1d ; Easy 
    if menu_option_skill=2 then goto speed_2d ; Standard 
    if menu_option_skill=3 then goto speed_3d ; Advanced
    if menu_option_skill=4 then goto speed_4d ; Expert

speed_1d                ;Easy Mode
    tank1_speed=0.4
    tank2_speed=0.4
    tank3_speed=0.4
    tank4_speed=0.4
    missile1_speed=0.4
    missile2_speed=0.4
    missile3_speed=0.4
    drone_speed=0.1
    goto speed_endd
speed_2d                ;Standard Mode
    tank1_speed=0.8
    tank2_speed=0.7
    tank3_speed=0.5
    tank4_speed=0.8
    missile1_speed=0.6
    missile2_speed=0.7
    missile3_speed=0.5
    drone_speed=0.8
    goto speed_endd
speed_3d                ;Advanced Mode
    tank1_speed=0.9
    tank2_speed=1.0
    tank3_speed=0.9
    tank4_speed=0.9
    missile1_speed=1.0
    missile2_speed=1.2
    missile3_speed=1.0
    drone_speed=1.0
    goto speed_endd
speed_4d                ;Expert Mode
    tank1_speed=2.0
    tank2_speed=1.7
    tank3_speed=1.6
    tank4_speed=1.6
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
    tank1_speed=0.5
    tank2_speed=0.5
    tank3_speed=0.5
    tank4_speed=0.5
    missile1_speed=0.5
    missile2_speed=0.5
    missile3_speed=0.5
    drone_speed=0.2
    goto speed_ende
speed_2e                ;Standard Mode
    tank1_speed=0.8
    tank2_speed=0.8
    tank3_speed=0.7
    tank4_speed=0.8
    missile1_speed=0.7
    missile2_speed=0.7
    missile3_speed=0.8
    drone_speed=0.8
    goto speed_ende
speed_3e                ;Advanced Mode
    tank1_speed=0.9
    tank2_speed=1.1
    tank3_speed=1.0
    tank4_speed=0.9
    missile1_speed=1.1
    missile2_speed=1.2
    missile3_speed=1.1
    drone_speed=1.0
    goto speed_ende
speed_4e                ;Expert Mode
    tank1_speed=2.0
    tank2_speed=1.8
    tank3_speed=1.7
    tank4_speed=1.7
    missile1_speed=1.6
    missile2_speed=1.7
    missile3_speed=1.8
    drone_speed=1.3
speed_ende
    return

set_level_7
    if menu_option_skill=1 then goto speed_1f ; Easy 
    if menu_option_skill=2 then goto speed_2f ; Standard 
    if menu_option_skill=3 then goto speed_3f ; Advanced
    if menu_option_skill=4 then goto speed_4f ; Expert

speed_1f                ;Easy Mode
    tank1_speed=0.6
    tank2_speed=0.6
    tank3_speed=0.6
    tank4_speed=0.6
    missile1_speed=0.6
    missile2_speed=0.6
    missile3_speed=0.6
    drone_speed=0.3
    goto speed_endf
speed_2f                ;Standard Mode
    tank1_speed=0.8
    tank2_speed=0.8
    tank3_speed=0.7
    tank4_speed=0.8
    missile1_speed=0.7
    missile2_speed=0.7
    missile3_speed=0.8
    drone_speed=0.8
    goto speed_endf
speed_3f                ;Advanced Mode
    tank1_speed=0.9
    tank2_speed=1.1
    tank3_speed=1.0
    tank4_speed=0.9
    missile1_speed=1.1
    missile2_speed=1.2
    missile3_speed=1.1
    drone_speed=1.0
    goto speed_endf
speed_4f                ;Expert Mode
    tank1_speed=2.0
    tank2_speed=1.8
    tank3_speed=1.7
    tank4_speed=1.7
    missile1_speed=1.6
    missile2_speed=1.7
    missile3_speed=1.8
    drone_speed=1.3
speed_endf
    return

set_level_8
    if menu_option_skill=1 then goto speed_1g ; Easy 
    if menu_option_skill=2 then goto speed_2g ; Standard 
    if menu_option_skill=3 then goto speed_3g ; Advanced
    if menu_option_skill=4 then goto speed_4g ; Expert

speed_1g                ;Easy Mode
    tank1_speed=0.7
    tank2_speed=0.7
    tank3_speed=0.7
    tank4_speed=0.7
    missile1_speed=0.7
    missile2_speed=0.7
    missile3_speed=0.7
    drone_speed=0.3
    goto speed_endg
speed_2g                ;Standard Mode
    tank1_speed=1.1
    tank2_speed=1.0
    tank3_speed=0.9
    tank4_speed=0.8
    missile1_speed=0.8
    missile2_speed=0.8
    missile3_speed=0.9
    drone_speed=0.8
    goto speed_endg
speed_3g                ;Advanced Mode
    tank1_speed=1.1
    tank2_speed=1.2
    tank3_speed=1.0
    tank4_speed=0.9
    missile1_speed=1.2
    missile2_speed=1.3
    missile3_speed=1.2
    drone_speed=1.0
    goto speed_endg
speed_4g                ;Expert Mode
    tank1_speed=2.0
    tank2_speed=1.9
    tank3_speed=1.8
    tank4_speed=1.8
    missile1_speed=1.7
    missile2_speed=1.8
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
    tank1_speed=0.8
    tank2_speed=0.7
    tank3_speed=0.8
    tank4_speed=0.7
    missile1_speed=0.8
    missile2_speed=0.7
    missile3_speed=0.8
    drone_speed=0.4
    goto speed_endh
speed_2h                ;Standard Mode
    tank1_speed=1.3
    tank2_speed=1.1
    tank3_speed=1.0
    tank4_speed=0.9
    missile1_speed=1.3
    missile2_speed=1.1
    missile3_speed=1.4
    drone_speed=0.8
    goto speed_endh
speed_3h                ;Advanced Mode
    tank1_speed=1.2
    tank2_speed=1.3
    tank3_speed=1.1
    tank4_speed=1.0
    missile1_speed=1.3
    missile2_speed=1.4
    missile3_speed=1.3
    drone_speed=1.0
    goto speed_endh
speed_4h                ;Expert Mode
    tank1_speed=2.0
    tank2_speed=2.0
    tank3_speed=1.9
    tank4_speed=1.9
    missile1_speed=1.8
    missile2_speed=1.9
    missile3_speed=1.9
    drone_speed=1.3
speed_endh
    return

set_level_10
    if menu_option_skill=1 then goto speed_1i ; Easy 
    if menu_option_skill=2 then goto speed_2i ; Standard 
    if menu_option_skill=3 then goto speed_3i ; Advanced
    if menu_option_skill=4 then goto speed_4i ; Expert

speed_1i                ;Easy Mode
    tank1_speed=0.9
    tank2_speed=0.8
    tank3_speed=0.9
    tank4_speed=0.8
    missile1_speed=0.9
    missile2_speed=0.8
    missile3_speed=0.9
    drone_speed=0.4
    goto speed_endi
speed_2i                ;Standard Mode
    tank1_speed=1.2
    tank2_speed=1.3
    tank3_speed=1.4
    tank4_speed=1.0
    missile1_speed=1.5
    missile2_speed=1.6
    missile3_speed=1.7
    drone_speed=0.8
    goto speed_endi
speed_3i                ;Advanced Mode
    tank1_speed=1.5
    tank2_speed=1.4
    tank3_speed=1.3
    tank4_speed=1.5
    missile1_speed=1.7
    missile2_speed=1.8
    missile3_speed=1.9
    drone_speed=1.0
    goto speed_endi
speed_4i                ;Expert Mode
    tank1_speed=2.0
    tank2_speed=2.1
    tank3_speed=2.0
    tank4_speed=2.1
    missile1_speed=1.9
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
    tank1_speed=0.9
    tank2_speed=0.8
    tank3_speed=1.0
    tank4_speed=0.8
    missile1_speed=1.0
    missile2_speed=1.0
    missile3_speed=1.0
    drone_speed=0.4
    goto speed_endj
speed_2j                ;Standard Mode
    tank1_speed=1.4
    tank2_speed=1.5
    tank3_speed=1.6
    tank4_speed=1.0
    missile1_speed=1.5
    missile2_speed=1.6
    missile3_speed=1.7
    drone_speed=0.8
    goto speed_endj
speed_3j                ;Advanced Mode
    tank1_speed=1.6
    tank2_speed=1.7
    tank3_speed=1.8
    tank4_speed=1.5
    missile1_speed=1.7
    missile2_speed=1.8
    missile3_speed=1.9
    drone_speed=1.0
    goto speed_endj
speed_4j                ;Expert Mode
    tank1_speed=2.4
    tank2_speed=2.3
    tank3_speed=2.2
    tank4_speed=2.1
    missile1_speed=2.2
    missile2_speed=2.7
    missile3_speed=2.8
    drone_speed=1.3
speed_endj
    return


 bank 9 

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
    incgraphic gfx/ex2/beam.png 160A 1 0 2 3

    
    
 inline 7800vox.asm

