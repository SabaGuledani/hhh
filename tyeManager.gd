extends Node2D



class_name TyeManager

@onready var  global = get_node("/root/Global")
@onready var state = get_node("/root/State")
#signal excalibur_ended(ended: bool)
#var excalibur_end: bool = false:
#	get:
#		return excalibur_end
#	set(value):
#		excalibur_end = value
#		emit_signal("excalibur_ended",excalibur_end)
#
#





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
		global.running = 0
		state.excalibur_end = false
		$Path2D/PathFollow2D/natsarqeqia/AnimatedSprite2D.flip_h = true
		await await get_tree().create_timer(4).timeout
		global.excalibur_taken_end = true
		get_tree().change_scene_to_file("res://meoreManager.tscn")
		
