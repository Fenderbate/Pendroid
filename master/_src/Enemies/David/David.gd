
extends "../Base.gd"

# ATTACK ["",-LENGTH-,"attack",-ATTACK INDEX-]
# TEXT [-TEXT-,-LENGTH-,*MOOD*]
# MOOD ["",0.1,-MOOD-]

func _ready():
	speech=[
	["TESTING ATTACK 1",4],
	["",5,"attack",0],
	["TESTING ATTACK 2",4],
	["",11,"attack",1],
	["END OF TESTING",3]
	]

func Attacks():
	if(aindex == -1):
		pass
	if(aindex == 0):
		emit_signal("normal")
		var nb = load("res://_src/Enemies/David/Attacks/Notebook/NoteBook.tscn").instance()
		nb.targetnode = get_parent().get_node("Player_B")
		nb.set_pos(Vector2(0,-nb.target_y-50))
		add_child(nb)
		attacking = false
	elif(aindex == 1):
		var p = load("res://_src/Enemies/David/Attacks/Pencil/Pencil.tscn").instance()
		p.set_pos(Vector2(0,-100))
		p.targetnode = get_parent().get_node("Player_B")
		add_child(p)
		attacking = false
	elif(aindex == 2):
		pass
	


