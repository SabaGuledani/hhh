extends Node2D


class_name tyeManager

@onready var  global = get_node("/root/Global")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	return


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	



func _on_area_2d_body_entered(body):
	if body.name == "natsarqeqia" and global.excalibur_taken == false:
		DialogueManager.show_dialogue_balloon(load("res://dialogue/main.dialogue"), "takingExcalibur")
		global.excalibur_taken = true


func _on_area_2d_2_body_entered(body):
	if body.name == "natsarqeqia" and global.excalibur_taken == true:
		DialogueManager.show_dialogue_balloon(load("res://dialogue/main.dialogue"), "take")
		
