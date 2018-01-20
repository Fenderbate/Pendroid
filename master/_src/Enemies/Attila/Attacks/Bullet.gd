
extends Area2D

var target = null
var SPEED = 10

func _ready():
	if(get_parent()).has_node("Player_B"):target = (get_parent().get_node("Player_B").get_pos() - get_pos()).normalized()
	set_fixed_process(true)

func _fixed_process(delta): set_pos(get_pos() + Vector2(target.x*SPEED,target.y*SPEED))
	
	
	

func Collision( body ):
	if(body.is_in_group("Player")): print("Player hit!")


func LeaveScreen():
	queue_free()
