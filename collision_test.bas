    
    ; Collision Test
    ;──═◙ Set 7800Basic Options
    set tv ntsc
    set tallsprite on
    set zoneheight 8
    set zoneprotection on
    set screenheight 192
    set romsize 48k
    set extradlmemory on
    set trackersupport basic
    set plotvalueonscreen on
    set avoxvoice on
    displaymode 160A

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

    dim death_counter = var19
    dim animate3 = var20
    dim animate1 = var21
    dim animate2 = var22
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
    dim battery_xpos = var68
    dim battery_ypos = var69
    dim battery_flag = var70
    dim battery_counter = var71
    dim cannon_xpos = var72
    dim cannon_ypos = var73
    dim cannon_fire_xpos = var74
    dim cannon_fire_ypos = var75
    dim temp_xpos = var76
    dim temp_ypos = var77
    dim animate4 = var78 
    dim animate5 = var79 
    dim level_flag = var80 
    dim unused4 = var81

    incgraphic gfx/ex2/test_drone1.png 160A 1 0 2 3
    incgraphic gfx/ex2/test_drone2.png 160A 1 0 2 3
    incgraphic gfx/ex2/test_drone3.png 160A 1 0 2 3
    incgraphic gfx/ex2/test_drone4.png 160A 1 0 2 3
    incgraphic gfx/ex2/drone_explode1.png 160A 1 0 2 3
    incgraphic gfx/ex2/drone_explode2.png 160A 1 0 2 3
    incgraphic gfx/ex2/drone_explode3.png 160A 1 0 2 3
    incgraphic gfx/ex2/drone_explode4.png 160A 1 0 2 3
    incgraphic gfx/ex2/test_tank1.png 160A 1 0 2 3
    incgraphic gfx/ex2/test_tank1b.png 160A 1 0 2 3
    incgraphic gfx/ex2/test_tank1c.png 160A 1 0 2 3
    incgraphic gfx/ex2/test_tank1d.png 160A 1 0 2 3
    incgraphic gfx/ex2/test_tank2.png 160A 1 0 2 3
    incgraphic gfx/ex2/test_tank2b.png 160A 1 0 2 3
    incgraphic gfx/ex2/test_tank2c.png 160A 1 0 2 3
    incgraphic gfx/ex2/test_tank2d.png 160A 1 0 2 3
    incgraphic gfx/ex2/test_tank3.png 160A 1 0 2 3
    incgraphic gfx/ex2/test_tank3b.png 160A 1 0 2 3
    incgraphic gfx/ex2/test_tank3c.png 160A 1 0 2 3
    incgraphic gfx/ex2/test_tank3d.png 160A 1 0 2 3
    incgraphic gfx/ex2/laser_powerup.png 160A 1 0 2 3
    incgraphic gfx/ex2/battery_powerup.png 160A 1 0 2 3
    incgraphic gfx/ex2/radar.png 160A 1 0 2 3
    incgraphic gfx/ex2/radar_b.png 160A 1 0 2 3
    incgraphic gfx/ex2/radar_c.png 160A 1 0 2 3
    incgraphic gfx/ex2/radar_d.png 160A 1 0 2 3
    incgraphic gfx/ex2/test_missile1.png 160A 1 0 2 3
    incgraphic gfx/ex2/test_missile1b.png 160A 1 0 2 3
    incgraphic gfx/ex2/test_missile1c.png 160A 1 0 2 3
    incgraphic gfx/ex2/test_missile1d.png 160A 1 0 2 3
    incgraphic gfx/ex2/crosshair.png 160A 1 0 2 3
    incgraphic gfx/ex2/crosshair2.png 160A 1 0 2 3
    incgraphic gfx/ex2/laser.png 160A 1 0 2 3
    newblock
    incgraphic gfx/ex2/beam.png 160A 1 0 2 3

Main
    ;──═◙ Set Palette Colors
    P0C1 = $F7 : P0C2 = $1C : P0C3 = $0F  ; City Defense Beam              
    P1C1 = $0F : P1C2 = $46 : P1C3 = $08  ; Drone: c1 rotors  c2 body  c3 middle
    P2C1 = $42 : P2C2 = $4A : P2C3 = $0C  ; Laser
    P3C1 = $33 : P3C2 = $34 : P3C3 = $38  ; Top Enemy Vehicle
    P4C1 = $02 : P4C2 = $06 : P4C3 = $0A  ; Top Line of Scrolling Background  |  C1:shadow  C2:bldg color  C3:window color
    P5C1 = $82 : P5C2 = $84 : P5C3 = $88  ; Middle Enemy Vehicle & Missile
    P6C1 = $42 : P6C2 = $44 : P6C3 = $46  ; Bottom Enemy Vehicle & Laser
    P7C1 = $02 : P7C2 = $04 : P7C3 = $06  ; Bottom three rows (City Colors)

    ;──═◙ Set Initial Location of sprites
    ; <X POSITION>    |   <Y POSITION>
    drone_xpos=70     :  drone_ypos=22
    tank1_xpos=20     :  tank1_ypos=168
    tank2_xpos=42     :  tank2_ypos=136
    tank3_xpos=64     :  tank3_ypos=112
    radar1_xpos=142   :  radar1_ypos=96
    missile1_xpos=25  :  missile1_ypos=25
    missile2_xpos=45  :  missile2_ypos=45
    missile3_xpos=65  :  missile3_ypos=65
    laser_powerup_xpos=78:laser_powerup_ypos=10
    battery_xpos=10   :  battery_ypos=0
    cannon_xpos=72     :  cannon_ypos=140
    cannon_fire_xpos=73:  cannon_fire_ypos=135

MainLoop
    drawwait
    clearscreen

    BACKGRND=$00
    ;──═◙ Increment frame and animation counters
    beam_counter=beam_counter+1
    if beam_counter>100 then beam_counter=1
    frame_counter=frame_counter+1
    if frame_counter>2 then frame_counter=0
    if frame_counter=2 then animate1=animate1+1
    if animate1>3 then animate1=0 
    animate2=animate2+1
    if animate2>4 then animate2=0
    if animate2=3 then animate3=animate3+1:animate4=animate4+1:animate5=animate5+1
    if animate3>3 then animate3=0
    if animate4>3 then animate4=0
    if animate5>3 then animate5=0

    ;──═◙ Debounce Fire Buttons
    if joy0fire then fire_debounce_1=1
    if !joy0fire && fire_debounce_1=1 then fire_debounce_1=2

    plotsprite   test_drone1        1        drone_xpos         drone_ypos          animate1        ; Drone
    plotsprite   test_tank3         3        tank3_xpos         tank3_ypos          animate3        ; Tank3 Sprite
    plotsprite   test_tank2         5        tank2_xpos         tank2_ypos          animate4        ; Tank2 Sprite
    plotsprite   test_tank1         6        tank1_xpos         tank1_ypos          animate5        ; Tank1 Sprite
    plotsprite   radar              0        radar1_xpos        radar1_ypos         animate3        ; Missile Defense Sprite
    plotsprite   test_missile1      5        missile1_xpos      missile1_ypos       animate1        ; Enemy Missile 1
    plotsprite   test_missile1      3        missile2_xpos      missile2_ypos       animate1        ; Enemy Missile 2
    plotsprite   test_missile1      6        missile3_xpos      missile3_ypos       animate1        ; Enemy Missile 3
    plotsprite   radar              1        cannon_xpos        cannon_ypos         animate3        ; Cannon
    plotsprite   laser_powerup      4        laser_powerup_xpos laser_powerup_ypos                  ; Laser Powerup 
    plotsprite   laser         beam_counter  cannon_fire_xpos   cannon_fire_ypos                    ; Cannon fire sprite
    ;plotsprite   battery_powerup    1        battery_xpos       battery_ypos                        ; Drone

    ;──═◙ Move the drone on the screen
    if joy0right then drone_xpos=drone_xpos+1
    if joy0left then drone_xpos=drone_xpos-1
    if joy0up then drone_ypos=drone_ypos-1
    if joy0down then drone_ypos=drone_ypos+1

    ;──═◙ Detect Hit with Cannon (Advanced and Expert Modes only)
    if cannon_fire_xpos>drone_xpos && cannon_fire_xpos<(drone_xpos+16) && cannon_fire_ypos>drone_ypos && cannon_fire_ypos<(drone_ypos+8) then BACKGRND=$44

    ;──═◙ Detect Hit with Laser Powerup/Recharge Sprite
    if laser_powerup_xpos>drone_xpos && laser_powerup_xpos<(drone_xpos+16) && laser_powerup_ypos>drone_ypos && laser_powerup_ypos<(drone_ypos+8) then BACKGRND=$54

    ;──═◙ Detect hits with enemy tanks
    if crosshair_x_offset_1>tank1_xpos && crosshair_x_offset_1<(tank1_xpos+20) && laser_y_offset_10>tank1_ypos && laser_y_offset_10<(tank1_ypos+12) then BACKGRND=$82
    if crosshair_x_offset_1>tank2_xpos && crosshair_x_offset_1<(tank2_xpos+20) && laser_y_offset_10>tank2_ypos && laser_y_offset_10<(tank2_ypos+12) then BACKGRND=$86
    if crosshair_x_offset_1>tank3_xpos && crosshair_x_offset_1<(tank3_xpos+20) && laser_y_offset_10>tank3_ypos && laser_y_offset_10<(tank3_ypos+12) then BACKGRND=$8A



    ;if bulletx>enemyx && bulletx<(enemyx+16) && bullety>enemyy &&  bullety<(enemyy+16) then ..
    ;if missileX >= DroneX && missileX <= DroneX+16   AND    missileY >= DroneY && missileY <= DroneY+8
    ;──═◙ Detect hits with cruise missiles
    ; Test1
    if missile1_xpos>=drone_xpos && missile1_xpos<=(drone_xpos+16) && missile1_ypos>=drone_ypos && missile1_ypos<=(drone_ypos+8) then BACKGRND=$F2
    ; Test2
    if drone_xpos >=missile1_xpos && drone_xpos <=(missile1_xpos+16) && drone_ypos>=missile1_ypos && drone_ypos<=(missile1_ypos+8) then BACKGRND=$F2

    ;if missile2_xpos>drone_xpos && missile2_xpos<(drone_xpos+16) && missile2_ypos>drone_ypos && missile2_ypos<(drone_ypos+8) then BACKGRND=$F6
    ;if missile3_xpos>drone_xpos && missile3_xpos<(drone_xpos+16) && missile3_ypos>drone_ypos && missile3_ypos<(drone_ypos+8) then BACKGRND=$FA




    ;──═◙ Detect hits with City Defense Beam 
    if defensebeam_x_offset_1>drone_xpos && defensebeam_x_offset_1<(drone_xpos+16) && defensebeam_y_offset_1>drone_ypos && defensebeam_y_offset_1<(drone_ypos+8) then BACKGRND=$62
    if defensebeam_x_offset_1>drone_xpos && defensebeam_x_offset_1<(drone_xpos+16) && defensebeam_y_offset_2>drone_ypos && defensebeam_y_offset_2<(drone_ypos+8) then BACKGRND=$64
    if defensebeam_x_offset_1>drone_xpos && defensebeam_x_offset_1<(drone_xpos+16) && defensebeam_y_offset_3>drone_ypos && defensebeam_y_offset_3<(drone_ypos+8) then BACKGRND=$68
    if defensebeam_x_offset_1>drone_xpos && defensebeam_x_offset_1<(drone_xpos+16) && defensebeam_y_offset_4>drone_ypos && defensebeam_y_offset_4<(drone_ypos+8) then BACKGRND=$6A
    if defensebeam_x_offset_1>drone_xpos && defensebeam_x_offset_1<(drone_xpos+16) && defensebeam_y_offset_5>drone_ypos && defensebeam_y_offset_5<(drone_ypos+8) then BACKGRND=$6B
    if defensebeam_x_offset_1>drone_xpos && defensebeam_x_offset_1<(drone_xpos+16) && defensebeam_y_offset_6>drone_ypos && defensebeam_y_offset_6<(drone_ypos+8) then BACKGRND=$6C
    if defensebeam_x_offset_1>drone_xpos && defensebeam_x_offset_1<(drone_xpos+16) && defensebeam_y_offset_7>drone_ypos && defensebeam_y_offset_7<(drone_ypos+8) then BACKGRND=$6D
    if defensebeam_x_offset_1>drone_xpos && defensebeam_x_offset_1<(drone_xpos+16) && defensebeam_y_offset_8>drone_ypos && defensebeam_y_offset_8<(drone_ypos+8) then BACKGRND=$6E
    if defensebeam_x_offset_1>drone_xpos && defensebeam_x_offset_1<(drone_xpos+16) && defensebeam_y_offset_9>drone_ypos && defensebeam_y_offset_9<(drone_ypos+8) then BACKGRND=$6F

    ;──═◙ Plot the city defense beam
    gosub draw_defensebeam

    ;──═◙ Plot the drone laser beam when you press the fire button
    if fire_debounce_1=1 then gosub draw_laser 

    drawscreen
    goto MainLoop


draw_laser

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


  ;if missileX >= DroneX && missileX <= DroneX+16   AND    missileY >= DroneY && missileY <= DroneY+8