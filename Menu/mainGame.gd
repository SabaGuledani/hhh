extends Control

@onready var mode_btn_control = $ModeChoose
@onready var start_control = $Start
@onready var miniGameChooseMenu = $MiniGameChooseMenu
@onready var backButton = $BackButton

signal gamePressed(gameName)
# Called when the node enters the scene tree for the first time.
func _ready():
	backButton.visible = false
	$TileMap/Natsarqeqia/AnimatedSprite2D.flip_h = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if start_control.visible == true:
		backButton.visible = false



func _on_start_button_pressed():
	backButton.visible = true 
	mode_btn_control.visible = true
	start_control.visible = false
	


func _on_story_mode_button_pressed():
#	get_tree().change_scene_to_file("res://world.tscn")
	gamePressed.emit("story")

func _on_choose_game_button_pressed():
	mode_btn_control.visible = false
	miniGameChooseMenu.visible = true


func _on_tyis_feria_button_pressed():
#	get_tree().change_scene_to_file("res://feria.tscn")
	gamePressed.emit("tba")

func _on_iluziis_gamovlena_button_pressed():
#	get_tree().change_scene_to_file("res://NewspaperGame/newspaperGame.tscn")
	gamePressed.emit("newspaper")

func _on_gnomi_button_pressed():
#	get_tree().change_scene_to_file("res://GnomeGame/gnome_encounter.tscn")
	gamePressed.emit("gnome")

func _on_dakarguli_mefe_button_pressed():
#	get_tree().change_scene_to_file("res://Scenes/king_encounter.tscn")
	gamePressed.emit("king")


func _on_button_pressed():
	if mode_btn_control.visible == true:
		mode_btn_control.visible = false
		start_control.visible = true
	elif miniGameChooseMenu.visible == true:
		miniGameChooseMenu.visible = false
		mode_btn_control.visible = true





