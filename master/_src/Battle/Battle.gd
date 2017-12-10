
extends Control

var step = 32
var width = 5
var height = 5
var newwidth = 3
var newheight = 3

var widthdiff = 0.5
var heightdiff = 0.5

onready var box = get_node("Box")
onready var BTop = box.get_node("Top")
onready var BDown = box.get_node("Down")
onready var BLeft = box.get_node("Left")
onready var BRight = box.get_node("Right")
onready var mask = box.get_node("Mask")

const FIGHTPOS = Vector2(640,400)
const TEXTPOS = Vector2(640,450)

var state = null

func _ready():
	set_fixed_process(true)
	box.set_pos(TEXTPOS)
	
	state = load("res://_src/Battle/Text.gd").new(self)

func _fixed_process(delta):
	update()
	state.update(self)

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
	
	BLeft.get_shape().set_a(Vector2(step*pwidth,-((step*pheight)+2)))
	BLeft.get_shape().set_b(Vector2(step*pwidth,((step*pheight)+3)))
	
	BDown.get_shape().set_a(Vector2(step*pwidth,step*pheight))
	BDown.get_shape().set_b(Vector2(-step*pwidth,step*pheight))
	
	BRight.get_shape().set_a(Vector2(-step*pwidth,((step*pheight)+3)))
	BRight.get_shape().set_b(Vector2(-step*pwidth,-((step*pheight)+2)))
	
	mask.set_scale(Vector2(64*width,64*height))
	
	draw_line(box.get_global_pos()+BTop.get_shape().get_a(),box.get_global_pos()+BTop.get_shape().get_b(),Color(1,1,1,1),5)
	draw_line(box.get_global_pos()+BLeft.get_shape().get_a(),box.get_global_pos()+BLeft.get_shape().get_b(),Color(1,1,1,1),5)
	draw_line(box.get_global_pos()+BDown.get_shape().get_a(),box.get_global_pos()+BDown.get_shape().get_b(),Color(1,1,1,1),5)
	draw_line(box.get_global_pos()+BRight.get_shape().get_a(),box.get_global_pos()+BRight.get_shape().get_b(),Color(1,1,1,1),5)
	
func Timeout():
	randomize()
	#newwidth = round(rand_range(3,10))
	#newheight = round(rand_range(3,10))
	
func NewSize(w,h):
	newwidth = w
	newheight = h




