
extends Label

var addletter = false
var done = true

var targettext = ""
var text = ""
var i = 0

func SetText(par):
	if(get_text() != par and done):
		targettext = par
		i = 0
		set_text("")
		done = false

func DelayTimeout():
	if(!done):
		if(get_text() != targettext):
			set_text(get_text()+targettext[i])
			i+=1
		if(get_text() == targettext):
			done = true
	get_node("Delay").start()