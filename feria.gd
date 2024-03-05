extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():

	DialogueManager.show_dialogue_balloon(load("res://dialogues/lady_of_lake_dialogue.dialogue"), "start") # Replace with function body.
	return


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if State.feria_ended == true:
		get_tree().change_scene_to_file("res://world.tscn")


