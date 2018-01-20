
extends CanvasLayer

var path = ""

func Goto(scn_path):
	path = scn_path
	get_node("AnimationPlayer").play("Fade In")

func ChangeScene():
	if path != "":
		get_tree().change_scene(path)

func Pause():
	get_tree().set_pause(true)
	print("The game is puased.")

func Cont():
	get_tree().set_pause(false)
