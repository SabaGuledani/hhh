extends Node2D

@onready var speed = 0.25
@onready var anim = get_node("Path2D/PathFollow2D/Natsarqeqia/AnimationPlayer")


# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.meomrebi_encountered.connect(_on_meomrebi_encountered)
	Signals.devi_sign_noticed.connect(_on_devi_sign_noticed)
	Signals.devi_encountered.connect(_on_devi_encountered)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Path2D/PathFollow2D.progress_ratio += delta * speed
	if speed == 0:
		anim.play("Idle")
	else:
		anim.play("Run")
	if $Path2D/PathFollow2D.progress_ratio == 1:
		get_tree().quit()



func _on_dialogi_meomrebtan_body_entered(body):
	if body.name == "Natsarqeqia":
		speed = 0
		DialogueManager.show_example_dialogue_balloon(load("res://Devi_minigame/Devi_Dialogues/Devi_dialogue.dialogue"),"meomrebi_encounter")
		


func _on_dialogi_devtan_body_entered(body):
	if body.name == "Natsarqeqia":
		DialogueManager.show_example_dialogue_balloon(load("res://Devi_minigame/Devi_Dialogues/Devi_dialogue.dialogue"),"devi_encounter")
		
		
func _on_meomrebi_encountered(_b):
	speed = 0.25
	
func _on_devi_sign_noticed(_b):
	speed = 0.15
func _on_devi_encountered(_b):
	get_tree().change_scene_to_file("res://Devi_minigame/Devi_scenes/Devi_campfire_scene.tscn")

func _on_devi_table_body_entered(body):
	if body.name == "Natsarqeqia":
		speed = 0
		DialogueManager.show_example_dialogue_balloon(load("res://Devi_minigame/Devi_Dialogues/Devi_dialogue.dialogue"),"meomrebi_encounter")
