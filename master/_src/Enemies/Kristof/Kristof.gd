
extends "../Base.gd"

var glove = preload("res://_src/Enemies/Kristof/Attacks/Glove/Glove.tscn")
var sweat = preload("res://_src/Enemies/Kristof/Attacks/Sweating/Sweating.tscn")

# ATTACK ["",-LENGTH-,"attack",-ATTACK INDEX-]
# TEXT [-TEXT-,-LENGTH-,*MOOD*]
# MOOD ["",0.1,-MOOD-]

func _ready():
	speech=[
	["TEXTEXTEXTEX TEXTEXTEXTEXTEXTEXTEXTEXTEXTEXT",3],
	["",10,"attack",1],
	["ASDASDADSAD",5]
	]

func Attacks():
	if(aindex == -1):
		pass
	if(aindex == 1):
		var g = glove.instance()
		g.set_global_pos(Vector2(0,-300))
		add_child(g)
		attacking = false
	elif(aindex == 2):
		var s = sweat.instance()
		s.set_global_pos(Vector2(0,-350))
		add_child(s)
		attacking = false
	elif(aindex == 3):
		pass
	
