
extends Node

signal map_update

onready var nav = get_node("Nav")
onready var map = get_node("Nav/Map")

onready var player = get_node("Player_W")

func _ready():
	
	#player.nav = nav # átadjuk paraméterként az objektumot ami generálja az utat
	#connect("map_update",player,"update_path")
	
	pass

