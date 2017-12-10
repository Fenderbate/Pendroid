extends Node

var Empty = {"Name":"","Info":"","Function":null}
var Potion = {"Name":"Potion","Info":"megittad a potiont.\nSokkal jobban érzed magad.\n10 életpont visszagyógyítva","Function":Heal()}

var PlayerInv = [Potion,Potion,Empty,Empty,Empty,Empty]
var asd = "Yay asdes!"

func _ready():
	Fuckyou()

func Fuckyou():
	print(asd)