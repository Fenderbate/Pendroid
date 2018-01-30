
extends "../Base.gd"

var spawnspeed = 0.4
var arrowspeed = 10

signal faster

func _ready():
	
	connect("faster",self,"Faster")
	
	speech=[
	["TESTING ATTACK 1",4],
	["",10,"attack",0],
	["TESTING ATTACK 2",4],
	#["",0.1,"faster"],
	["",10,"attack",1],
	["TESTING ATTACK 3",4],
	["",10,"attack",2],
	["END OF TESTING",3]
	]
	

func Attacks():
	if(aindex == -1):
		pass
	if(aindex == 0):
		var b = load("res://_src/Enemies/Norbert/Attacks/DancePad.tscn").instance()
		b.get_node("Timer").set_wait_time(spawnspeed)
		b.arrowspeed = arrowspeed
		b.formation = b.CLASSIC
		b.set_pos(get_parent().get_pos())
		if(!has_node("DancePad")): add_child(b)
		get_parent().NewSize(7,3)
		attacking = false
	elif(aindex == 1):
		var b = load("res://_src/Enemies/Norbert/Attacks/DancePad.tscn").instance()
		b.get_node("Timer").set_wait_time(spawnspeed)
		b.arrowspeed = arrowspeed
		b.formation = b.PLUS
		b.set_pos(get_parent().get_pos())
		if(!has_node("DancePad")): add_child(b)
		get_parent().NewSize(5,5)
	elif(aindex == 2):
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
	
