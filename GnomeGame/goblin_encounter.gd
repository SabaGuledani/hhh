extends Node

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

func _ready():
	GnomeState.gameDone.connect(finish_handler)
	
	DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)

func _process(_delta):
	pass

func finish_handler():
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://world.tscn")
