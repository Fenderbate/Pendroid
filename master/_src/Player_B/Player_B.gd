extends KinematicBody2D

var spd = 10
var dir = Vector2(0,0)
var movement = Vector2(0,0)

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	dir.y = Input.is_action_pressed("down") - Input.is_action_pressed("up")
	dir.x = Input.is_action_pressed("right") - Input.is_action_pressed("left")
	dir = dir.normalized()
	movement = Vector2(spd*dir.x,spd*dir.y)
	
	var movement_remainder = move(movement)
	var normal = Vector2(0,0)
	if(is_colliding()): normal = get_collision_normal()# melyik oldalon érinti a falat
	var final_movement = normal.slide(movement_remainder)
	movement = normal.slide(movement)
	move(final_movement)
	