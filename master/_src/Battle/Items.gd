
extends Node

var parent = null

var itemindex = 0
var pressed = false


#Load the player's items from the Global.gd script

func _init(parent):
	self.parent = parent
	
	self.parent.get_node("InventoryText").show()

func update():
	
	if(Input.is_action_pressed("B")): parent.state=load("res://_src/Battle/Text.gd").new(parent)
	
	var pressdir = Vector2(0,0)
	
	pressdir.y = Input.is_action_pressed("down") - Input.is_action_pressed("up")
	pressdir.x = Input.is_action_pressed("right") - Input.is_action_pressed("left")
	
	#max size of inventory is 10
	if(pressdir.y==-1 and !pressed and itemindex > 1):
		itemindex-=2
		pressed = true
	elif(pressdir.y==1 and !pressed and itemindex < 8):
		itemindex+=2
		pressed = true
	elif(pressdir.x==-1 and !pressed and itemindex > 0):
		itemindex -= 1
		pressed = true
	elif(pressdir.x==1 and !pressed and itemindex < 9):
		itemindex += 1
		pressed = true
	elif(pressdir==Vector2(0,0) and pressed):
		pressed = false
	
	print(itemindex)