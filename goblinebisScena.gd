extends Node2D

@onready var  global = get_node("/root/Global")
@onready var state = get_node("/root/State")

# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.connect("dialogue_ended", _on_goblinstart_ended)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_goblinstart_ended():
	global.goblinStoryChapter+=1

func _on_start_first_dialogue_body_entered(body):
	if body.name == "Natsarqeqia" and global.goblinStoryChapter == 1:
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/main.dialogue"),"goblinStart")
		print(DialogueManager.dialogue_ended)
