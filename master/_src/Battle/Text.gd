
extends Node

signal newsize

var parent = null
var pressed = false

func _init(parent):
	
	#Store the enemy's text and description text on it
	#Store the enemy's text index on the enemy
	#Store the description index on the enemy
	
	self.parent = parent
	connect("newsize",parent,"NewSize")
	self.parent.box.set_pos(parent.TEXTPOS)
	self.parent.newwidth = 10
	self.parent.newheight = 3
	self.parent.get_node("ScreenButtons").show()
	self.parent.get_node("InventoryText").hide()
	
	if(self.parent.has_node("Player_B")):
		self.parent.player = self.parent.get_node("Player_B")
		self.parent.remove_child(parent.get_node("Player_B"))

func update():
	
	
	var dir = Input.is_action_pressed("right") - Input.is_action_pressed("left")
	
	if(dir == 1 and !pressed and parent.get_node("ScreenButtons").get_frame() < 3):
		parent.get_node("ScreenButtons").set_frame(parent.get_node("ScreenButtons").get_frame()+1)
		pressed = true
	elif(dir == -1 and !pressed and parent.get_node("ScreenButtons").get_frame() > 0):
		parent.get_node("ScreenButtons").set_frame(parent.get_node("ScreenButtons").get_frame()-1)
		pressed = true
	elif(dir == 0 and pressed): pressed = false
	
	if(Input.is_action_pressed("A") and parent.get_node("ScreenButtons").get_frame() == 0 ): parent.state=load("res://_src/Battle/Fight.gd").new(parent)
	if(Input.is_action_pressed("A") and parent.get_node("ScreenButtons").get_frame() == 2 ): parent.state=load("res://_src/Battle/Items.gd").new(parent)





