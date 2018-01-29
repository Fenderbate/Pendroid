
extends RigidBody2D


func _ready():
	set_fixed_process(true)


func _fixed_process(delta):
	var target = get_global_mouse_pos()
	
	set_pos(Vector2(target.x,get_pos().y))