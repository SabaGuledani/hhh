extends Area2D

var zoom_max = Vector2(4.50001, 4.50001)
var zoom_norm = Vector2(2.5, 2.5)
var zoom_speed = Vector2(.3, .3)
var char1_id = 0

@onready var canvas = get_node("/root/bias_mini_game/CanvasLayer")
@onready var character = get_node("/root/bias_mini_game/CharacterBody2D")
@onready var davaleba = get_node("/root/bias_mini_game/CanvasLayer_Davaleba")
@onready var camera = get_node("/root/bias_mini_game/CharacterBody2D/Area2D/Camera2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		print("clicked ch1")
		camera_zoom()
		



func camera_zoom():
		
		if camera.zoom == zoom_norm:
			camera.zoom = zoom_max
			camera.offset.y = -40
			camera.offset.x = 0
			canvas.add_text(character.info)
			davaleba.show_textbox()
			davaleba.show_buttons()
			char1_id = 1
			

		else:
			camera.zoom = zoom_norm
			camera.offset.y = -80
			camera.offset.x = 0
			canvas.hide_textbox()
			davaleba.show_textbox()
			davaleba.buttons_hide()
			char1_id = 0
