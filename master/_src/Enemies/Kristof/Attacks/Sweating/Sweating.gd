
extends Control

var drop = preload("Drop.tscn")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func DropFall():
	var d = drop.instance()
	#d.set_global_pos(Vector2(get_global_pos().x+rand_range(-200,200),get_pos().y))
	d.set_global_pos(Vector2(rand_range(-150,150),rand_range(-350,-450)))
	get_parent().add_child(d)
	get_node("Timer").start()
