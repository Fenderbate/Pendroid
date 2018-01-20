
extends Control

onready var arrow = preload("res://_src/Enemies/Norbert/Attacks/Arrow.tscn")
var lastarow = null
var arrowspeed = 10

func _ready():
	set_fixed_process(true)
	

func _fixed_process(delta):
	pass


func SpawnArrow():
	
	add_child(Arrow(arrowspeed))
	get_node("Timer").start()

func Arrow(parspd):
	var a = arrow.instance()
	a.spd = parspd
	randomize()
	var r = round(rand_range(0,3))
	if(r==0):
		a.set_rotd(90)
		a.get_node("Sprite").set_modulate(Color(1,0,0))
	elif(r==1):
		a.set_rotd(0)
		a.get_node("Sprite").set_modulate(Color(0,0,1))
	elif(r==2):
		a.set_rotd(180)
		a.get_node("Sprite").set_modulate(Color(0,1,0))
	elif(r==3):
		a.set_rotd(270)
		a.get_node("Sprite").set_modulate(Color(1,1,0))
	else: pass
	a.set_pos(get_children()[r].get_pos())
	if(a.get_pos() == lastarow): return Arrow(parspd)
	else: lastarow = a.get_pos()
	
	return a