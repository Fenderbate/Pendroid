
extends Control

var drawing = true

var pencilpoint = Vector2(0,0)

var pencil = null

var number = null

func _ready():
	var linechild = CollisionShape2D.new()
	linechild.set_shape(SegmentShape2D.new())
	linechild.set_name("CollisionShape2D")
	linechild.get_shape().set_b(Vector2(0,0))
	linechild.set_trigger(true)
	get_node("Area2D").add_child(linechild)
	set_fixed_process(true)


func _fixed_process(delta):
	get_node("Area2D").get_node("CollisionShape2D").get_shape().set_b(pencilpoint)
	update()

func _draw():
	draw_line(Vector2(0,0),pencilpoint,Color(1,1,1,1),4)


func Hit( body ):
	if(body.is_in_group("Player")):
		body.Hurt(1)
