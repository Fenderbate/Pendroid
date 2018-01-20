extends KinematicBody2D

var spd = 10
var dir = Vector2(0,0)
var movement = Vector2(0,0)
var move_to = Vector2(0,0)
var moveback = Vector2(0,0)

var center = null
var target = null


var health = 3
var invincible = false

onready var box = get_parent()
func _ready():
	set_fixed_process(true)
	set_process_input(true)


func _input(event):
	
	if(event.type == InputEvent.SCREEN_TOUCH and !event.is_echo() and event.is_pressed()):
		center=event.pos
		
	elif(event.type == InputEvent.SCREEN_TOUCH and !event.is_echo() and !event.is_pressed()):
		center=null
		target = null
		moveback = get_parent().get_node("Box").get_pos() - get_pos()
	
	if(event.type==InputEvent.SCREEN_DRAG and center!=null):
		move_to=Vector2(round(event.pos.x-center.x),round(event.pos.y-center.y))
		move_to += get_parent().get_node("Box").get_pos()




func _fixed_process(delta):
	#dir.y = Input.is_action_pressed("down") - Input.is_action_pressed("up")
	#dir.x = Input.is_action_pressed("right") - Input.is_action_pressed("left")
	#dir = dir.normalized()
	#movement = Vector2(spd*dir.x,spd*dir.y)
	
	#print(str("BOX-",box.step*box.width,"\nDIS-",abs((get_pos() - box.get_pos()).x)))
	
	
	
	if(move_to != movement and (abs((get_pos() - box.get_node("Box").get_pos()).x) < (box.step*box.width) and abs((get_pos() - box.get_node("Box").get_pos()).y) < (box.step*box.height))):
		
		if(move_to.x < movement.x): movement.x-=abs(move_to.x - movement.x)#spd
		elif(move_to.x > movement.x): movement.x+=abs(move_to.x - movement.x)#spd
		
		if(move_to.y < movement.y): movement.y-=abs(move_to.y - movement.y)#spd
		elif(move_to.y > movement.y): movement.y+=abs(move_to.y - movement.y)#spd
		
		#pass
		
		var movement_remainder = move_to(movement)
		var normal = Vector2(0,0)
		if(is_colliding()): normal = get_collision_normal()# melyik oldalon érinti a falat
		var final_movement = normal.slide(movement_remainder)
		#movement = normal.slide(movement)
		move(final_movement)
	
	if(center == null and target == null and (get_pos() - get_parent().get_node("Box").get_pos()).length() > 10):
		
		
		#set_pos(get_pos()+(moveback/10))
		moveback = get_parent().get_node("Box").get_pos() - get_pos()
		set_pos(get_pos()+Vector2(10*moveback.normalized().x,10*moveback.normalized().y))
		
		pass

func Hurt(dmg):
	if(health > 0 and !invincible):
		health -= dmg
		invincible = true
		get_node("Timer").start()
		get_node("Sprite").set_modulate(Color(1,0,0,1))
	if(health <= 0):
		print("PLAYER DEATH NOT IMPLEMENTED YET!")
		# print game over message
		# retry -> reload fight
		#		-> reload map to checkpoint and RESET THE FIGHT INDEX
		pass

func BackToNormal():
	invincible = false
	get_node("Sprite").set_modulate(Color(1,1,1,1))
