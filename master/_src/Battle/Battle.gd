
extends Control

var step = 32
var width = 5
var height = 5
var newwidth = 5
var newheight = 5

var widthdiff = 0.5
var heightdiff = 0.5

onready var box = get_node("Box")
onready var BTop = box.get_node("Top")
onready var BDown = box.get_node("Down")
onready var BLeft = box.get_node("Left")
onready var BRight = box.get_node("Right")
onready var mask = box.get_node("Mask")
onready var health = box.get_node("Health")

onready var player = get_node("Player_B")

const STARTPOS = Vector2(360,640)
const BASESIZE = Vector2(5,5)


func _ready():
	set_fixed_process(true)
	set_process_input(true)
	box.set_pos(STARTPOS)
	
func _fixed_process(delta):
	update()
	health.set_text(str("HP ",player.health))

func _draw():
	
	SetBox(width,height)
	
func SetBox(pwidth, pheight):
	
	#write dynamic resizing here if desired!
	
	if(width != newwidth and width < newwidth): width += widthdiff
	elif(width != newwidth and width > newwidth): width -= widthdiff
	
	if(height != newheight and height < newheight): height += heightdiff
	elif(height != newheight and height > newheight): height -= heightdiff
	
	
	BTop.get_shape().set_a(Vector2(-step*pwidth,-step*pheight))
	BTop.get_shape().set_b(Vector2(step*pwidth,-step*pheight))
	
	BLeft.get_shape().set_a(Vector2(step*pwidth,-((step*pheight)+3)))
	BLeft.get_shape().set_b(Vector2(step*pwidth,((step*pheight)+3)))
	
	BDown.get_shape().set_a(Vector2(step*pwidth,step*pheight))
	BDown.get_shape().set_b(Vector2(-step*pwidth,step*pheight))
	
	BRight.get_shape().set_a(Vector2(-step*pwidth,((step*pheight)+2)))
	BRight.get_shape().set_b(Vector2(-step*pwidth,-((step*pheight)+3)))
	
	mask.set_scale(Vector2(64*width,64*height))
	
	health.set_pos(Vector2(-health.get_size().x/2,BDown.get_shape().get_a().y+10))
	
	draw_line(box.get_global_pos()+BTop.get_shape().get_a(),box.get_global_pos()+BTop.get_shape().get_b(),Color(1,1,1,1),5)
	draw_line(box.get_global_pos()+BLeft.get_shape().get_a(),box.get_global_pos()+BLeft.get_shape().get_b(),Color(1,1,1,1),5)
	draw_line(box.get_global_pos()+BDown.get_shape().get_a(),box.get_global_pos()+BDown.get_shape().get_b(),Color(1,1,1,1),5)
	draw_line(box.get_global_pos()+BRight.get_shape().get_a(),box.get_global_pos()+BRight.get_shape().get_b(),Color(1,1,1,1),5)
	
	get_node("Box/BG").set_scale(Vector2(64*width,64*height))

	
func NewSize(w,h):
	newwidth = w
	newheight = h

