
extends Area2D

export var target = ""
export var index = -1

var thread = Thread.new()

func Enter( area ):
	queue_free()
	if(!Global.zones[index]):
		Global.zones[index] = true
		get_node("/root/TAnimation").Goto(target)
		var scene = PackedScene.new()
		scene.pack(get_tree().get_current_scene())
		ResourceSaver.save("res://_src/Battle/Temp.tscn",scene)