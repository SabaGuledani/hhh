extends Node2D

@onready var speed_natsarqeqia = 0.25
@onready var speed_devi = 0
@onready var anim_natsarqeqia= get_node("Path2D/PathFollow2D/Natsarqeqia/AnimationPlayer")
@onready var anim_devi = get_node("Path2Devi/PathFollow2D/Devi/AnimatedSprite2D")
@onready var natsarqeqia_sprite = get_node("Path2D/PathFollow2D/Natsarqeqia/AnimatedSprite2D")
@onready var explosion = get_node("explosion_video/VideoStreamPlayer")
# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.finished_final.connect(_on_finished_final)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Path2D/PathFollow2D.progress_ratio += delta * speed_natsarqeqia
	$Path2Devi/PathFollow2D.progress_ratio += delta * speed_devi
	natsarqeqia_sprite.flip_h = false
	
	if speed_natsarqeqia == 0:
		anim_natsarqeqia.play("Idle")
#		anim_devi.play("Idle")
	else:
		anim_natsarqeqia.play("Run")
		
#		anim_devi.play("Run")
	if speed_devi == 0:
		anim_devi.play("Idle")
	else:
		anim_devi.play("Run")
		
	if $Path2D/PathFollow2D.progress_ratio == 1:
		natsarqeqia_sprite.flip_h = true
		speed_natsarqeqia = 0
	if $Path2Devi/PathFollow2D.progress_ratio == 0:
		anim_devi.flip_h = true
	elif $Path2Devi/PathFollow2D.progress_ratio == 1:
		speed_devi = 0 
		anim_devi.flip_h = false
	else: 
		anim_devi.flip_h = false
				

func _on_explosion_body_entered(body):
	
	speed_devi = 0.20
	
func _on_finished_final(_b):
	explosion.play()

func _on_final_dialogue_area_body_entered(body):
	DialogueManager.show_example_dialogue_balloon(load("res://Devi_minigame/Devi_Dialogues/Devi_dialogue.dialogue"),"final")
	
