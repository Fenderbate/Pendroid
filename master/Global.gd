extends Node

var zones=[
false,
false,
false,
false
]

var yieldpause = false

var playerInv = [
ITEMS.Empty,#0
ITEMS.Empty,#1
ITEMS.Empty,#2
ITEMS.Empty,#3
ITEMS.Bread,#4
ITEMS.Empty,#5
ITEMS.Empty,#6
ITEMS.Empty,#7
ITEMS.Knife,#8
ITEMS.Empty,#9
ITEMS.Empty,#10
ITEMS.Empty #11
]
var playerhealth = 20

#--------------------------- TODO ---------------------------------------
# - Implement Enemy
#   - Write "Flavour Text" from enemy (description on the player's turn)
#   - Implement ACT option
#   - Implement SPARE option

#enumeration of the items ->  "KEY":["NAME","ACTION","DESCRIPTION","ACTION_VALUE","ACTION_TEXT"]
const ITEMS = {
"Empty":["Üres","","",-1,""],
"Bread":["Kenyér","heal","Egy darab kenyér. YUMM!",1,"*Megetted a kenyeret."],
"Knife":["Kés","set_damage","Egy kés. Jó fegyvernek.",1,"*Kézbe vetted a kést."],
"Used":["Used","nothing","A used item. Probably doesn't do anything.",-1,""]

}

func _ready():
	pass

func Heal(amount):
	#sound.play("Heal")
	playerhealth += amount
	#print("Healed for ", amount, " points.\ncurrent health: ",playerhealth)

func AddItem(item):
	for i in range(12):
		if(playerInv[i]==ITEMS.Empty):
			playerInv[i]=item
			return
