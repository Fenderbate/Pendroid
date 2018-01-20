
extends RigidBody2D

var spd = 10

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if(get_pos().y > 200):
		if(!get_node("AnimationPlayer").is_playing()): get_node("AnimationPlayer").play("Vanish")
	else: set_pos(get_pos()+Vector2(0,spd))

func Hit( body ):
	if(body.is_in_group("Player")):
		body.Hurt(1)
		queue_free()

func AnimFinished():
	queue_free()
