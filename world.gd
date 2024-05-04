extends TileMap


@onready var  global = get_node("/root/Global")
@onready var  state = get_node("/root/State")
@onready var speed_value = 0.0165
@onready var speed = 0.014
@onready var anim = get_node("NatsarqeqiaPath/PathFollow2D/Natsarqeqia/AnimationPlayer")
@onready var natsarqeqia = get_node("NatsarqeqiaPath/PathFollow2D/Natsarqeqia/AnimatedSprite2D")
@onready var hero = get_node("VillageCharacters/Hero/AnimatedSprite2D")
# Called when the node enters the scene tree for the first time.
func _ready():
	hero.flip_h = true
	load_state()
	
	Signals.finish_brother_dialogue.connect(_on_finished_brother_dialogue)
	Signals.finish_woodlady.connect(_on_finished_woodlady)
#	Signals.finish_newspaper.connect(_on_finished_newspaper)
#	Signals.finish_gnome.connect(_on_finished_gnome)
#	Signals.finish_lady_of_the_lake.connect(_on_finished_lady_of_the_lake)
#	Signals.finish_king_encounter.connect(_on_finished_king_encounter)
	
	
	
	
func save_state():
	var state = {}
#	var player = get_node("Natsarqeqia")
	var path = get_node("NatsarqeqiaPath/PathFollow2D")
#	state["player_position"] = player.position
	state["path_progress"] = path.progress
	return state
	
func load_state():
	if typeof(global.state) == TYPE_DICTIONARY:
#		var player = get_node("Natsarqeqia")
		var path = get_node("NatsarqeqiaPath/PathFollow2D")
		path.progress = global.state["path_progress"]
#		player.position = global.state["player_position"]
		


func _process(delta):
	$NatsarqeqiaPath/PathFollow2D.progress_ratio += delta * speed
	
	if speed == 0:
		anim.play("Idle")
	else:
		anim.play("Run")
	if $NatsarqeqiaPath/PathFollow2D.progress_ratio == 1:
		get_tree().quit()


func _on_gnome_area_body_entered(body):
	
	if body.name == "Natsarqeqia" and Global.gnome_met != true:
		
		var state = save_state()
		global.state = state
		Global.gnome_met = true
		get_tree().change_scene_to_file("res://GnomeGame/gnome_encounter.tscn")
		
		




func _on_courrier_encounter_body_entered(body):
	if body.name == "Natsarqeqia" and global.courier_met == false:
		var state = save_state()
		get_tree().change_scene_to_file("res://Scenes/courier_encounter.tscn")
		global.state = state
		
		


func _on_king_encouter_body_entered(body):
	if body.name == "Natsarqeqia" and global.king_met == false:
		var state = save_state()
		Global.king_met = true
		get_tree().change_scene_to_file("res://Scenes/king_encounter.tscn")
		global.state = state
		


func _on_feria_encounter_body_entered(body):
	if body.name == "Natsarqeqia" and global.feria_met == false:
		var state = save_state()
		global.state = state
		global.feria_met = true
		get_tree().change_scene_to_file("res://feria.tscn")
		


func _on_lady_callable_body_entered(body):
	if body.name == "Natsarqeqia":
		speed = 0.0
		DialogueManager.show_dialogue_balloon(load("res://dialogues/main.dialogue"),"Woodlady")




func _on_dzmastan_dialogi_body_entered(body):
	speed = 0.0
	natsarqeqia.flip_h = true
	DialogueManager.show_example_dialogue_balloon(load("res://dialogues/main.dialogue"),"BrotherDialogue")
	
	
func _on_finished_brother_dialogue():
	natsarqeqia.flip_h = false
	speed = speed_value

func _on_finished_woodlady():
	speed = speed_value+0.005


func _on_turn_left_body_entered(body):
	natsarqeqia.flip_h = true


func _on_turn_right_body_entered(body):
	natsarqeqia.flip_h = false


func _on_newspaper_start_body_entered(body):
	if body.name == "Natsarqeqia" and Global.newsguy_met == false:
		var state = save_state()
		global.state = state
		Global.newsguy_met = true
		get_tree().change_scene_to_file("res://NewspaperGame/newspaperGame.tscn")
