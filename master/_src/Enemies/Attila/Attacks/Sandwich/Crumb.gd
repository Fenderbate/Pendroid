
extends RigidBody2D

func _ready():
	randomize()
	get_node("Sprite").set_frame(round(rand_range(0,3.4)))
	set_applied_torque(rand_range(-2000,2000))
	set_rotd(rand_range(0,360))


func OutOfScreen():
	queue_free()


func Hit( body ):
	if(body.is_in_group("Player")):
		body.Hurt(1)
		queue_free()
