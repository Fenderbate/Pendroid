
extends Area2D

var MAX_SPEED = 350
var spd = 350
var nav = null
var path = []
var goal = Vector2()

var campos = Vector2(0,0)

onready var cam = get_parent().get_node("Cam")

func _ready():
	set_fixed_process(true)
	goal = get_pos()
	nav = get_parent().get_node("Nav")
	
	set_process_input(true)

func _input(event):
	
	if (event.type == InputEvent.MOUSE_BUTTON and event.pressed):
		goal = event.pos + cam.get_pos() # megadjuk a játékos objectumnak a célpozíciót
		update_path(goal)
		pass

func _fixed_process(delta):
	if (path.size() > 1):
		
		#if(get_pos().distance_to(path[path.size()-1]) > 200):spd = MAX_SPEED
		#else: spd = MAX_SPEED * get_pos().distance_to(path[path.size()-1]) / 200
		#print(get_pos().distance_to(path[path.size()-1])) 
		
		#print(get_global_transform_with_canvas().o.x)
		if(get_global_transform_with_canvas().o.x < 100):
			#~~campos += Vector2(-496,0)
			cam.set_pos(cam.get_pos() + Vector2(-448,0))
		if(get_global_transform_with_canvas().o.x > 600):
			#~~campos += Vector2(496,0)
			cam.set_pos(cam.get_pos() + Vector2(448,0))
		
		if(get_global_transform_with_canvas().o.y < 100):
			#~~campos += Vector2(0,-1014)
			cam.set_pos(cam.get_pos() + Vector2(0,-1024))
		if(get_global_transform_with_canvas().o.y > 1200):
			#~~campos += Vector2(0,1014)
			cam.set_pos(cam.get_pos() + Vector2(0,1024))
		
		var d = get_pos().distance_to(path[0])
		if(d > 10):
			set_pos(get_pos().linear_interpolate(path[0],(spd*delta)/d))
		else:
			path.remove(0)
			
	else:
		pass
	
func update_path(newgoal):
	path = nav.get_simple_path(get_pos(),newgoal, false)
	if(path.size() == 0):
		print("can't go there.")