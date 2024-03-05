extends Node2D

@export var dialogue_resource = DialogueResource
@export var dialogue_start :String = "start"

@onready var next_btn = get_node("/root/bias_mini_game/CanvasLayer_Davaleba/HBoxContainer/Button")
@onready var prev_btn = get_node("/root/bias_mini_game/CanvasLayer_Davaleba/HBoxContainer/Button2")

var indexi = 0
var davaleba_text_2 = "nadirobisas davinaxe magiuri arseba, romelsac ,rogorc vifiqre, daxmaroba Wirdeboda,\nmivuaxlovdi dasaxmareblad. me ar mifiqria, rom arsebas SeiZleba arasworad gaego \nCemi Canafiqri da magiiT adgilebi gagvicvala."
var davaleba_text_3 = "nadirobisas davinaxe magiuri arseba, romelsac SeiZleba Cventvis raime safrTxe Seeqmna.\n me Sevecade mivaxlovebodi da meCvenebina, rom uSiSrebi da Zlierebi varT.\n manam amas movaxerxebdi man magiiT adgilebi gagvicvala. "
var davaleba_text_1 = "nadirobisas davinaxe magiuri arseba, romelic SeiZleba ar damorCileboda Cven moTxovnebs.\n me Tavdarwmunebit vuaxlovdebodi mas, rodesac moulodnelad magiiT adgilebi gagvicvala."
var davalebebi = [davaleba_text_2, davaleba_text_3, davaleba_text_1]
#2 3 1

var balloon = preload("res://dialog/balloon.tscn").instantiate()
var dialog = preload("res://dialog/bias_dialog.dialogue")
var end_dialog = preload("res://dialog/bias_game_end.dialogue")


func _ready():
	var textbox = get_node("/root/bias_mini_game/CanvasLayer_Davaleba")
	bias_dialog()
	textbox.show_textbox()
	textbox.add_text(davalebebi[indexi])
	textbox.buttons_hide()

func _process(delta):
	var textbox = get_node("/root/bias_mini_game/CanvasLayer_Davaleba")
	textbox.show_textbox()
	if State.bias_ended == true:
		get_tree().change_scene_to_file("res://world.tscn")
	
func plus_indexi():
	var textbox = get_node("/root/bias_mini_game/CanvasLayer_Davaleba")
	if indexi == 2:
		textbox.add_text("yoCaR Sen yvela personaJs Seusabame Sesaferisi teqsti !")
		await get_tree().create_timer(6).timeout
		var camera = get_node("/root/bias_mini_game/CharacterBody2D/Area2D/Camera2D")
		var zoom_norm = Vector2(2.5, 2.5)
		camera.zoom = zoom_norm
		DialogueManager.show_example_dialogue_balloon(end_dialog)
	else :
		indexi +=1
		textbox.add_text(davalebebi[indexi])
		print("mtavar tamashi indexia: ", indexi)
		
func bias_dialog() :
	DialogueManager.show_example_dialogue_balloon(dialog)

