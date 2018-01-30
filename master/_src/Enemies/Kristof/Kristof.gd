
extends "../Base.gd"

var glove = preload("res://_src/Enemies/Kristof/Attacks/Glove/Glove.tscn")
var sweat = preload("res://_src/Enemies/Kristof/Attacks/Sweating/Sweating.tscn")

# ATTACK ["",-LENGTH-,"attack",-ATTACK INDEX-]
# TEXT [-TEXT-,-LENGTH-,*MOOD*]
# MOOD ["",0.1,-MOOD-]

func _ready():
	speech=[
	["TESTING ATTACK 1",4],
	["",10,"attack",0],
	["TESTING ATTACK 2",4],
	["",5,"attack",1],
	["END OF TESTING",3]
	]

func Attacks():
	if(aindex == -1):
		pass
	if(aindex == 0):
		var g = glove.instance()
		g.set_global_pos(Vector2(0,-300))
		add_child(g)
		attacking = false
	elif(aindex == 1):
		var s = sweat.instance()
		s.set_global_pos(Vector2(0,-350))
		add_child(s)
		attacking = false
	elif(aindex == 2):
		pass
	
