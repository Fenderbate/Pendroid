
extends Node

signal newsize


func _init(parent):
	connect("newsize",parent,"NewSize")
	parent.box.set_pos(parent.TEXTPOS)
	parent.newwidth = 10
	parent.newheight = 5

func update(parent):
	
	RandomSize(parent)
	pass

func RandomSize(parent):
	if(Input.is_action_pressed("ui_right") and parent.get_node("Timer").get_time_left() == 0):
		emit_signal("newsize",round(rand_range(3,10)),round(rand_range(3,10)))
		#parent.newwidth = round(rand_range(3,10))
		#parent.newheight = round(rand_range(3,10))
		#parent.get_node("Timer").start()
		parent.state=load("res://_src/Battle/Fight.gd").new(parent)
	pass

