
extends "../Base.gd"

# ATTACK ["",-LENGTH-,"attack",-ATTACK INDEX-]
# TEXT [-TEXT-,-LENGTH-,*MOOD*]
# MOOD ["",0.1,-MOOD-]

func _ready():
	speech=[
	["Hé az az én szendvicsem!",3,"angry"],
	["Ó te vagy az.",2,"normal"],
	["Nem számítottam rád ilyen korán!",4,"happy"],
	["Na mindegy ha már itt vagy essünk neki!",4],
	["Én Attila vagyok.",3,"normal"],
	["Én fogom neked megmutatni az alapokat.",3],
	["Először is a mozgás!",3],
	["Írányítani úgy tudod a karaktered hogy megérinted bárhol a képernyőt...",8,"normal"],
	["és elkezded húzni az ujjad.",4],
	["Ugye milyen egyszerű?",3,"happy"],
	["Na akkor most próbáljunk ki egy támadást is!",5],
	["Készülj fel, itt jön!",3],
	["",10,"attack",1],
	["A többiek is meg fognak próbálni megállítani hasonló támadásokkal.",5],
	["Úgyhogy jobb ha felkészülsz!",3],
	["Én most hagylak menni.",4,"normal"],
	["De a többieknek ne mondd el légyszi.",5,"happy"],
	["Sok sikert!",3]
	]

func Attacks():
	if(aindex == -1):
		pass
	if(aindex == 1):
		emit_signal("normal")
		var b = load("res://_src/Enemies/Attila/Attacks/Sandwich/Sandwich.tscn").instance()
		add_child(b)
		get_parent().NewSize(3,3)
		attacking = false
	elif(aindex == 2):
		pass
	elif(aindex == 3):
		pass
	


