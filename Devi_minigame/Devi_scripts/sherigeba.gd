extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.finish_sherigeba.connect(_on_finished_sherigeba)
	DialogueManager.show_example_dialogue_balloon(load("res://Devi_minigame/Devi_Dialogues/Devi_dialogue.dialogue"),"meomrebtan_dabruneba")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_finished_sherigeba(_b):
	get_tree().change_scene_to_file("res://GameChoose.tscn")#shesacvlelia
