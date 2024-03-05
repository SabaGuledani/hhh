extends CanvasLayer


@onready var margin_container = $MarginContainer
@onready var label = $MarginContainer/MarginContainer/HBoxContainer/Label


# Called when the node enters the scene tree for the first time.
func _ready():
	hide_textbox()# Replace with function body.

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func hide_textbox():
	label.text = ""
	margin_container.hide()
	
func show_textbox():
	margin_container.show()
	
func add_text(next_text):
	label.text = next_text
	show_textbox()
	
func change_size():
	pass
	
	
