extends Control

@onready var mode_btn_control = $ModeChoose
@onready var start_control = $Start
@onready var miniGameChooseMenu = $MiniGameChooseMenu

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	$TileMap/Natsarqeqia/AnimatedSprite2D.flip_h = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_start_button_pressed():
	mode_btn_control.visible = true
	start_control.visible = false
	


func _on_story_mode_button_pressed():
	get_tree().change_scene_to_file("res://world.tscn")


func _on_choose_game_button_pressed():
	mode_btn_control.visible = false
	miniGameChooseMenu.visible = true


func _on_tyis_feria_button_pressed():
	get_tree().change_scene_to_file("res://feria.tscn")


func _on_iluziis_gamovlena_button_pressed():
	get_tree().change_scene_to_file("res://NewspaperGame/newspaperGame.tscn")


func _on_gnomi_button_pressed():
	get_tree().change_scene_to_file("res://GnomeGame/gnome_encounter.tscn")


func _on_dakarguli_mefe_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/king_encounter.tscn")
