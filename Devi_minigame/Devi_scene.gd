extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_dialogi_meomrebtan_body_entered(body):
	if body.name == "Natsarqeqia" and Global.meomrebi_encountered == "false":
		DialogueManager.show_example_dialogue_balloon(load("res://Devi_minigame/Devi_Dialogues/Devi_dialogue.dialogue"),"meomrebi_encounter")
		
