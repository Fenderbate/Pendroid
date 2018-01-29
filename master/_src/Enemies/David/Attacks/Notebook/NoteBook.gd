
extends RigidBody2D

var following = true

var anim_playing = false

var targetnode = null

var target_y = 500

var hit = false

func _ready():
	set_fixed_process(true)


func _fixed_process(delta):
	
	if(following):
		#var target = get_global_mouse_pos()
		var target = targetnode.get_global_pos() - Vector2(360,0)
		set_pos(Vector2(get_pos().x+((target.x - get_pos().x)/20),get_pos().y))
	else:
		if(!anim_playing):
			get_node("Tween").interpolate_property(self,"transform/pos",get_pos(),get_pos()+Vector2(0,target_y),1,2,0,0)
			get_node("Tween").start()
			anim_playing = true

func AttackNow():
	following = false


func Hit( body ):
	if(body.is_in_group("Player") and !hit):
		body.Hurt(1)
		hit = true
