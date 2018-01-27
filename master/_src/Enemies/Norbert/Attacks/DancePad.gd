
extends Control

onready var arrow = preload("res://_src/Enemies/Norbert/Attacks/Arrow.tscn")
var lastarow = null
var arrowspeed = 10

var mode = 0 # 0 - classic | 1 - + formation | 2 - x formation

const CLASSIC = [Vector2(-192,-700),Vector2(-64,-700),Vector2(64,-700),Vector2(192,700)]
const PLUS = [Vector2(64,-700),Vector2(700,64),Vector2(-64,700),Vector2(-700,-64)]
const X = [Vector2(-636,-700),Vector2(700,-636),Vector2(636,700),Vector2(-700,636)]

var formation = PLUS

onready var left = get_node("Left")
onready var up = get_node("Up")
onready var down = get_node("Down")
onready var right = get_node("Right")

func _ready():
	left.set_pos(formation[0])
	up.set_pos(formation[1])
	down.set_pos(formation[2])
	right.set_pos(formation[3])
	set_fixed_process(true)
	print("Instance added.")

func _fixed_process(delta):
	pass


func SpawnArrow():
	
	add_child(Arrow(arrowspeed))
	get_node("Timer").start()

func Arrow(parspd):
	var a = arrow.instance()
	a.spd = parspd
	
	randomize()
	var r = round(rand_range(0,3))
	if(r==0):
		a.set_rotd(90)
		a.get_node("Sprite").set_modulate(Color(1,0,0))
		if(formation == CLASSIC): a.dir = 0
		elif(formation == PLUS): a.dir = 0
		elif(formation == X): a.dir = 7
	elif(r==1):
		a.set_rotd(0)
		a.get_node("Sprite").set_modulate(Color(0,0,1))
		if(formation == CLASSIC): a.dir = 0
		elif(formation == PLUS): a.dir = 2
		elif(formation == X): a.dir = 1
	elif(r==2):
		a.set_rotd(180)
		a.get_node("Sprite").set_modulate(Color(0,1,0))
		if(formation == CLASSIC): a.dir = 0
		elif(formation == PLUS): a.dir = 4
		elif(formation == X): a.dir = 3
	elif(r==3):
		a.set_rotd(270)
		a.get_node("Sprite").set_modulate(Color(1,1,0))
		if(formation == CLASSIC): a.dir = 0
		elif(formation == PLUS): a.dir = 6
		elif(formation == X): a.dir = 5
	else: pass
	a.set_pos(get_children()[r].get_pos())
	if(a.get_pos() == lastarow): return Arrow(parspd)
	else: lastarow = a.get_pos()
	
	return a