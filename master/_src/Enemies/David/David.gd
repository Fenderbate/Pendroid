
extends "../Base.gd"

# ATTACK ["",-LENGTH-,"attack",-ATTACK INDEX-]
# TEXT [-TEXT-,-LENGTH-,*MOOD*]
# MOOD ["",0.1,-MOOD-]

func _ready():
	speech=[
	["Hé az az én szendvicsem!",3,"angry"],
	["",10,"attack",1],
	["A többiek is meg fognak próbálni megállítani hasonló támadásokkal.",5],
	]

func Attacks():
	if(aindex == -1):
		pass
	if(aindex == 1):
		emit_signal("normal")
		#get_parent().NewSize(3,3)
		attacking = false
	elif(aindex == 2):
		pass
	elif(aindex == 3):
		pass
	


