
extends KinematicBody2D

onready var line = preload("res://_src/Enemies/David/Attacks/Pencil/Line.tscn")

var speed = 400
var target = Vector2(0,0)
var dashes = 5
var distance = 7000
var MAX_DISTANCE = 7000

var attacking = false
var addline = false

var l = null

var targetnode = null

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if(!attacking):
		#target = (get_global_mouse_pos() - get_global_pos()).normalized()
		target = (targetnode.get_pos() - get_global_pos()).normalized()
		print(target)
	else:
		if(addline):
			l = line.instance()
			l.set_global_pos(get_pos())
			get_parent().add_child(l)
			addline = false
		set_pos(get_pos()+Vector2((speed*target.x)*delta,(speed*target.y)*delta))
		l.pencilpoint = get_global_pos() - l.get_global_pos()
		distance -= abs(l.get_pos().distance_to(get_pos()))
		if(distance<0):
			attacking = false
			addline = false
			get_node("Timer").start()
			distance = MAX_DISTANCE
		


func Attack():
	attacking = true
	addline = true
