
extends KinematicBody2D

onready var player = get_parent().get_parent().get_node("Player_B")

var spd = 10
var dist = 0
var rot_spd = 3
var max_dist = 600

var dashes = 0
var max_dashes = 4

var move = false

func _ready():
	set_fixed_process(true)


func _fixed_process(delta):
	if(move):
		move_local_y(spd,false)
		dist += spd
		if(dist >= max_dist and dashes < max_dashes):
			if(max_dashes == 2000): queue_free()
			get_node("Timer").start()
			move = false
			dist = 0
			dashes+=1
			
		if(dashes >= max_dashes): max_dist = 2000
	else:
		
		var ang = get_angle_to(player.get_global_pos())
		rotate(ang*delta*rot_spd)
		if(get_node("Timer").get_time_left() <= 0):get_node("Timer").start()

func LookTime():
	move = true


func Hit( body ):
	if(body.is_in_group("Player")):
		body.Hurt(1)
