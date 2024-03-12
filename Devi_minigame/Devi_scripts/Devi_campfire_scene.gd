extends Node2D

@onready var speed = 0
@onready var anim = get_node("Path2D/PathFollow2D/Natsarqeqia/AnimationPlayer")
@onready var anim_devi = get_node("Path2D/PathFollow2D/Devi/AnimatedSprite2D")
@onready var natsarqeqia_sprite = get_node("Path2D/PathFollow2D/Natsarqeqia/AnimatedSprite2D")
@onready var explosion = get_node("explosion_video/VideoStreamPlayer")

# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.finish_campfire_dialogue.connect(_on_finished_campfire_dialogue)


	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Path2D/PathFollow2D.progress_ratio += delta * speed
	if speed == 0:
		anim.play("Idle")
		anim_devi.play("Idle")
		natsarqeqia_sprite.flip_h = false
	else:
		natsarqeqia_sprite.flip_h = true
		anim.play("Run")
		anim_devi.play("Run")
		

		
	if $Path2D/PathFollow2D.progress_ratio == 1:
		get_tree().change_scene_to_file("res://Devi_minigame/Devi_scenes/sherigeba.tscn")


func _on_finished_campfire_dialogue(_b):
	speed = 0.30
	
	


func _on_area_2d_body_entered(body):
	if body.name == "Natsarqeqia":
		DialogueManager.show_example_dialogue_balloon(load("res://Devi_minigame/Devi_Dialogues/Devi_dialogue.dialogue"),"devi_campfire")
		
