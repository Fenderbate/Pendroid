
extends "../Base.gd"

# ATTACK ["",-LENGTH-,"attack",-ATTACK INDEX-]
# TEXT [-TEXT-,-LENGTH-,*MOOD*]
# MOOD ["",0.1,-MOOD-]

func _ready():
	speech=[
	["TESTING ATTACK 1",4],
	["",10,"attack",0],
	["END OF TESTING",3]
#	["Szóval itt bújkálsz!",3,"happy"],
#	["Hmm",2,"normal"],
#	["Egyáltalán nem olyan vagy mint amire számítottam.",4,],
#	["Figyelj én nem akarlak elkapni.",4,"happy"],
#	["Tudom hogy nem vagy gonosz csak unatkozol",3,],
#	["Segítek neked elmenekülni!",3],
#	["Írányítani úgy tudod a karaktered hogy megérinted bárhol a képernyőt...",8,"normal"],
#	["és elkezded húzni az ujjad.",4],
#	["Ugye milyen egyszerű?",3,"happy"],
#	["Na akkor most próbáljunk ki egy támadást is!",5],
#	["Készülj fel, itt jön!",3],
#	["",10,"attack",1],
#	["A többiek is megpróbálnak majd megállítani hasonló támadásokkal.",5],
#	["Úgyhogy jobb ha felkészülsz!",3],
#	["Én most hagylak menni.",4,"normal"],
#	["Csak ne rémítsd halálra a többieket!",5,"happy"],
#	["Sok sikert!",3]
	]

func Attacks():
	if(aindex == -1):
		pass
	if(aindex == 0):
		emit_signal("normal")
		var b = load("res://_src/Enemies/Attila/Attacks/Sandwich/Sandwich.tscn").instance()
		add_child(b)
		get_parent().NewSize(3,3)
		attacking = false
	elif(aindex == 1):
		pass
	elif(aindex == 2):
		pass
	


