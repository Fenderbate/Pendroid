
extends Control

var eating = false
var i = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass



func EAT():
	if(!eating):
		get_node("Timer").start()
		eating = true
		get_node("AnimationPlayer").play("Eating")


func CrumbFall():
	if(i >= 20):queue_free()
	else:
		var crumb = load("res://_src/Enemies/Attila/Attacks/Sandwich/Crumb.tscn").instance()
		randomize()
		crumb.set_pos(Vector2(rand_range(-150,150),get_pos().y))
		get_parent().add_child(crumb)
		get_node("Timer").start()
		i+=1
	
