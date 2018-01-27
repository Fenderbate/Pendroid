
extends "../Base.gd"

var spawnspeed = 0.4
var arrowspeed = 10

signal faster

func _ready():
	
	connect("faster",self,"Faster")
	
	speech=[
	["Te vagy az?",3,"angry"],
	["Hogy juttoál túl Attilán?",2],
	["",10,"attack",3],
	["Erre kikerüli mindet...",5],
	["",0.1,"faster"],
	["",10,"attack",2]
	]
	

func Attacks():
	if(aindex == -1):
		pass
	if(aindex == 1):
		var b = load("res://_src/Enemies/Norbert/Attacks/DancePad.tscn").instance()
		b.get_node("Timer").set_wait_time(spawnspeed)
		b.arrowspeed = arrowspeed
		b.formation = b.CLASSIC
		b.set_pos(get_parent().get_pos())
		if(!has_node("DancePad")): add_child(b)
		get_parent().NewSize(7,3)
		attacking = false
	elif(aindex == 2):
		var b = load("res://_src/Enemies/Norbert/Attacks/DancePad.tscn").instance()
		b.get_node("Timer").set_wait_time(spawnspeed)
		b.arrowspeed = arrowspeed
		b.formation = b.PLUS
		b.set_pos(get_parent().get_pos())
		if(!has_node("DancePad")): add_child(b)
		get_parent().NewSize(5,5)
	elif(aindex == 3):
		var b = load("res://_src/Enemies/Norbert/Attacks/DancePad.tscn").instance()
		b.get_node("Timer").set_wait_time(spawnspeed)
		b.arrowspeed = arrowspeed
		b.formation = b.X
		b.set_pos(get_parent().get_pos())
		if(!has_node("DancePad")): add_child(b)
		get_parent().NewSize(5,5)
	

func Faster():
	pass
	#spawnspeed -= 0.05
	#arrowspeed += 5
	
