extends Node2D

@onready var speed = 0.20
@onready var speed_meomrebi = 0
@onready var anim_natsarqeqia= get_node("Path2D/PathFollow2D/Natsarqeqia/AnimationPlayer")
@onready var anim_devi = get_node("Path2D/PathFollow2D/Devi/AnimatedSprite2D")
@onready var natsarqeqia_sprite = get_node("Path2D/PathFollow2D/Natsarqeqia/AnimatedSprite2D")

#meomrebis animated spraitebi
@onready var meomari_sprite = get_node("Path2DMeomrebi/PathFollow2D/Meomari/AnimatedSprite2D")
@onready var meomari1_sprite = get_node("Path2DMeomrebi/PathFollow2D/Meomari1/AnimatedSprite2D")
@onready var meomari2_sprite = get_node("Path2DMeomrebi/PathFollow2D/Meomari2/AnimatedSprite2D")
@onready var meomari3_sprite = get_node("Path2DMeomrebi/PathFollow2D/Meomari3/AnimatedSprite2D")
@onready var meomari4_sprite = get_node("Path2DMeomrebi/PathFollow2D/Meomari4/AnimatedSprite2D")
@onready var meomari5_sprite = get_node("Path2DMeomrebi/PathFollow2D/Meomari5/AnimatedSprite2D")
@onready var meomari6_sprite = get_node("Path2DMeomrebi/PathFollow2D/Meomari6/AnimatedSprite2D")
@onready var meomari7_sprite = get_node("Path2DMeomrebi/PathFollow2D/Meomari7/AnimatedSprite2D")
@onready var meomrebi = [meomari_sprite,meomari1_sprite,meomari2_sprite,meomari3_sprite,meomari4_sprite,meomari5_sprite,meomari6_sprite,meomari7_sprite,]
# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.finish_sherigeba.connect(_on_finished_sherigeba)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	$Path2D/PathFollow2D.progress_ratio += delta * speed
	$Path2DMeomrebi/PathFollow2D.progress_ratio += delta * speed_meomrebi
	natsarqeqia_sprite.flip_h = true
	if speed == 0:
		anim_natsarqeqia.play("Idle")
		anim_devi.play("Idle")
	else:
		anim_natsarqeqia.play("Run")
		anim_devi.play("Run")
	if speed_meomrebi != 0:
		meomrebi_run(meomrebi)
	else: 
		meomrebi_idle(meomrebi)
	if $Path2D/PathFollow2D.progress_ratio > 0.5 and speed_meomrebi == 0:
		speed = 0
	


func _on_finished_sherigeba(_b):
	speed_meomrebi = 0.30
	speed = 0.25
#	get_tree().change_scene_to_file("res://sufra.tscn")#shesacvlelia


func _on_dialog_start_body_entered(body):
	if body.name == "Natsarqeqia": 
		DialogueManager.show_example_dialogue_balloon(load("res://Devi_minigame/Devi_Dialogues/Devi_dialogue.dialogue"),"meomrebtan_dabruneba")

func meomrebi_run(meomrebi):
	for meomari in meomrebi:
		meomari.play("Run")
func meomrebi_idle(meomrebi):
	for meomari in meomrebi:
		meomari.play("default")


func _on_scene_finish_area_body_entered(body):
	if body.name == "Meomari":
		get_tree().change_scene_to_file("res://Devi_minigame/Devi_scenes/sufra.tscn")
