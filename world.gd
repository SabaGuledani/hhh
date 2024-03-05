extends TileMap
#komentari

@onready var  global = get_node("/root/Global")
@onready var  state = get_node("/root/State")
# Called when the node enters the scene tree for the first time.
func _ready():
	load_state()
	if state.goblin_scene_final == true:
		var player = get_node("Natsarqeqia")
		player.position = Vector2(2335,-143)
		state.goblin_scene_final  = false
	if State.gamogdebuli == false:
		DialogueManager.show_example_dialogue_balloon(load("res://dialogues/main.dialogue"),"gamestart")

func load_state():
	if typeof(global.state) == TYPE_DICTIONARY:
		var player = get_node("Natsarqeqia")
		player.position = global.state["player_position"]


func _process(delta):
	pass


func save_state():
	var state = {}
	var player = get_node("Natsarqeqia")
	state["player_position"] = player.position
	return state


func _on_gnome_area_body_entered(body):
	
	if body.name == "Natsarqeqia" and global.i < 1:
		var state = save_state()
		get_tree().change_scene_to_file("res://Scenes/gnome_encounter.tscn")
		global.i+=1
		global.state = state


func _on_area_2d_body_entered(body):
	if body.name == "Natsarqeqia" and global.goblins_met == false:
		var state = save_state()
		get_tree().change_scene_to_file("res://meoreManager.tscn")
		global.state = state
		global.goblins_met = true


func _on_courrier_encounter_body_entered(body):
	if body.name == "Natsarqeqia" and global.courier_met == false:
		var state = save_state()
		get_tree().change_scene_to_file("res://Scenes/courier_encounter.tscn")
		global.state = state
		
		


func _on_king_encouter_body_entered(body):
	if body.name == "Natsarqeqia" and global.king_met == false:
		var state = save_state()
		get_tree().change_scene_to_file("res://Scenes/king_encounter.tscn")
		global.state = state
		


func _on_feria_encounter_body_entered(body):
	if body.name == "Natsarqeqia" and global.feria_met == false:
		var state = save_state()
		global.state = state
		global.feria_met = true
		get_tree().change_scene_to_file("res://feria.tscn")
		


func _on_lady_callable_body_entered(body):
	if body.name == "Natsarqeqia" and global.lady_met == false:
		global.lady_met = true
		DialogueManager.show_dialogue_balloon(load("res://dialogues/main.dialogue"),"start")


func _on_bias_game_start_body_entered(body):
	if body.name == "Natsarqeqia" and global.bias_met == false:
		var state = save_state()
		global.state = state
		global.bias_met = true
		get_tree().change_scene_to_file("res://bias_mini_game.tscn")
