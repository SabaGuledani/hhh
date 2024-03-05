extends Node2D


class_name meoreManager
@onready var  global = get_node("/root/Global")
@onready var state = get_node("/root/State")
@onready var tree_root = get_tree().get_root()
@onready var player = tree_root.get_child( tree_root.get_child_count()-1 ).get_node("Node2D/Natsarqeqia")
@onready var sprite = tree_root.get_child( tree_root.get_child_count()-1 ).get_node("Node2D/Natsarqeqia/AnimatedSprite2D")

signal goblinstart_ended(ended: bool)
var goblinstart_end: bool = false:
	get:
		return goblinstart_end
	set(value):
		goblinstart_end = value
		global.goblinStoryChapter +=1
		emit_signal("goblinstart_ended",goblinstart_end)
		
func _ready():
	if global.excalibur_taken_end == true:
		sprite.flip_h = true
		player.position = Vector2(345,90)
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/main.dialogue"), "exposeGobbo")
	else:
		player.position = Vector2(160,84)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if state.goblin_scene_final == true:
		get_tree().change_scene_to_file("res://world.tscn")



	
		
	
