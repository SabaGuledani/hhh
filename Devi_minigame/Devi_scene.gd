extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_changePath(pathID, char):
	var newPath: Path2D = get_node("Path_" + String(pathID))
	var newOffset = newPath.curve.get_closest_offset(char.global_position-newPath.global_position)
	char.get_parent().remove_child(char)
	newPath.add_child(char)
	char.offset = newOffset 


func _on_dialogi_meomrebtan_body_entered(body):
	if body.name == "Natsarqeqia" and Global.meomrebi_encountered == "false":
		DialogueManager.show_example_dialogue_balloon(load("res://Devi_minigame/Devi_Dialogues/Devi_dialogue.dialogue"),"meomrebi_encounter")
		Global.meomrebi_encountered = true
		


func _on_dialogi_devtan_body_entered(body):
	if body.name == "Natsarqeqia" and Global.devi_encountered == "false":
		DialogueManager.show_example_dialogue_balloon(load("res://Devi_minigame/Devi_Dialogues/Devi_dialogue.dialogue"),"devi_encounter")
		Global.devi_encountered = true
		
