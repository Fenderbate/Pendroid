
extends RigidBody2D

var spd = 10

var distance = 0

var dir = 0

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if(distance > 1000):
		if(!get_node("AnimationPlayer").is_playing()): get_node("AnimationPlayer").play("Vanish")
	else:
		if(dir == 0): set_pos(get_pos()+Vector2(0,spd))
		elif(dir == 1): set_pos(get_pos()+Vector2(-spd,spd))
		elif(dir == 2): set_pos(get_pos()+Vector2(-spd,0))
		elif(dir == 3): set_pos(get_pos()+Vector2(-spd,-spd))
		elif(dir == 4): set_pos(get_pos()+Vector2(0,-spd))
		elif(dir == 5): set_pos(get_pos()+Vector2(spd,-spd))
		elif(dir == 6): set_pos(get_pos()+Vector2(spd,0))
		elif(dir == 7): set_pos(get_pos()+Vector2(spd,spd))
		distance += spd

func Hit( body ):
	if(body.is_in_group("Player")):
		body.Hurt(1)
		queue_free()

func AnimFinished():
	queue_free()
