
extends Node

var parent = null
var timer = Timer.new()

func _init(parent):
	
	# possibly instance the enemy here aswell
	# and ask it's parameters for the fight..?
	
	self.parent = parent
	
	self.parent.box.set_pos(parent.FIGHTPOS)
	self.parent.newwidth = 6
	self.parent.newheight = 6
	self.parent.get_node("ScreenButtons").hide()
	
	#set the player's pos @ fight start--------------------------
	self.parent.player.set_pos(parent.get_node("Box").get_pos())
	#------------------------------------------------------------
	if(!self.parent.has_node("Player_B")): self.parent.add_child(parent.player)
	
	
	#set the length of the fight
	timer.set_wait_time(5)
	#---------------------------
	timer.connect("timeout",self,"Timeout")
	timer.set_name("FightTime")
	self.parent.add_child(timer)
	timer.start()

func update():
	pass

func Timeout():
	parent.get_node("FightTime").queue_free()
	parent.state = load("res://_src/Battle/Text.gd").new(parent)