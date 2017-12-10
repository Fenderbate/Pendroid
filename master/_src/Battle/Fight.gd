
extends Node

var parent = null
var timer = Timer.new()

func _init(parent):
	
	parent.box.set_pos(parent.FIGHTPOS)
	parent.newwidth = 6
	parent.newheight = 6
	
	self.parent = parent
	
	timer.set_wait_time(5)
	timer.connect("timeout",self,"Timeout")
	timer.set_name("FightTime")
	parent.add_child(timer)
	timer.start()
	
	print("initiated fight")

func update(parent):
	print(timer.get_time_left())

func Timeout():
	parent.state = load("res://_src/Battle/Text.gd").new(parent)