
extends Control

signal normal
signal happy
signal angry
signal sad

signal attack
signal jumpindex

onready var timer = get_node("Timer")

var tindex = 0
var timeout = false

var aindex = 0
var attacking = false

# ATTACK ["",-LENGTH-,"attack",-ATTACK INDEX-]
# TEXT [-TEXT-,-LENGTH-,*MOOD*]
# MOOD ["",0.1,-MOOD-]
var speech=[
#["Heló!",2],
#["Bocs hogy félbeszakítom a tortáról szőtt álmaidat.",5],
#["De most fontosabb dolgod van!",3,"happy"],
#["Tesztelni kell a játékot!",3],
#["Úgyogy lássunk is neki!",3],
#["Írányítani úgy tudod a karaktered hogy megérinted bárhol a képernyőt...",8,"normal"],
#["és elkezded húzni az ujjad.",4],
#["Ugye milyen egyszerű?",3,"happy"],
#["Na akkor most próbáljunk ki egy támadást is!",5],
#["Készülj fel, itt jön!",3],
#["",0.01,"normal"],
#["",5,"attack",-1],
#["Ennyi volt a tesztfázis!",3,"happy"],
#["Köszi hogy teszteltél!",3],
#["Ja és nincs süti.",2,"normal"]
]

func _ready():
	set_fixed_process(true)
	timer.set_wait_time(3)
	connect("normal",self,"Normal")
	connect("happy",self,"Happy")
	connect("angry",self,"Angry")
	connect("sad",self,"Sad")
	
	connect("attack",self,"Attack")
	connect("jumpindex",self,"JumpIndex")

func _fixed_process(delta):
	get_node("Label").set_text(str(timer.get_time_left()))
	
	if(!timeout): Act()
	
	if(attacking): Attacks()
	pass


func Act():
	
	if(tindex < speech.size()):
		timer.set_wait_time(speech[tindex][1])
		timer.start()
		
		if(speech[tindex][0] != ""): get_parent().get_node("InfoText").SetText(speech[tindex][0])
		if(speech[tindex].size()>2):
			if(speech[tindex][2]=="attack"): emit_signal(speech[tindex][2],speech[tindex][3])
			else: emit_signal(speech[tindex][2])
	else: get_node("/root/TAnimation").Goto("res://_src/Battle/Temp.tscn")
	
	timeout = true

func Attacks():
	if(aindex == -1):
		var b = load("res://_src/Enemies/Attila/Attacks/Bullet.tscn").instance()
		randomize()
		b.set_pos(Vector2(round(rand_range(-1,1))*(get_parent().get_node("Box").get_pos().x+100),round(rand_range(-1,1))*(get_parent().get_node("Box").get_pos().y+100)))
		get_parent().add_child(b)
		attacking = false
	if(aindex == 1):
		pass
	elif(aindex == 2):
		pass
	elif(aindex == 3):
		pass

func Timeout():
	tindex+=1
	timeout = false
	attacking = false
	for c in get_children(): if(c.is_in_group("Attack")):c.queue_free()
	#get_parent().get_node("Player_B").set_pos(Vector2(360,640))
	#get_parent().get_node("Player_B")
	print("write proper ,method for returning to the middle in Base.gd line 95")
	get_parent().NewSize(get_parent().BASESIZE.x,get_parent().BASESIZE.y)

func Normal():
	get_node("Sprite").set_texture(load("res://_src/Enemies/Attila/_normal.png"))

func Happy():
	get_node("Sprite").set_texture(load("res://_src/Enemies/Attila/_happy.png"))

func Angry():
	get_node("Sprite").set_texture(load("res://_src/Enemies/Attila/_angry.png"))

func Sad():
	get_node("Sprite").set_texture(load("res://_src/Enemies/Attila/_sad.png"))



func Attack(atckindex):
	attacking = true
	aindex = atckindex

func JumpIndex(parIndex):
	tindex = parIndex