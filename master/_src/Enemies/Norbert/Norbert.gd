
extends "../Base.gd"

# ATTACK ["",-LENGTH-,"attack",-ATTACK INDEX-]
# TEXT [-TEXT-,-LENGTH-,*MOOD*]
# MOOD ["",0.1,-MOOD-]

func _ready():
	speech=[
	["Te vagy az?",3,"angry"],
	["Hogy juttoál túl Attilán?",2],
	["",20,"attack",1],
	["Erre kikerüli mindet...",5]
	]

func Attacks():
	if(aindex == -1):
		pass
	if(aindex == 1):
		var b = load("res://_src/Enemies/Norbert/Attacks/DancePad.tscn").instance()
		#b.get_node("Timer").set_wait_time(0.25)
		#b.arrowspeed = 10
		b.set_pos(get_parent().get_pos())
		add_child(b)
		get_parent().NewSize(7,3)
		attacking = false
	elif(aindex == 2):
		pass
	elif(aindex == 3):
		pass
	
