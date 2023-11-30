extends CharacterBody2D


@export var speed = 70

@onready var anim = get_node("AnimationPlayer")

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	if input_direction[0] < 0 :
		get_node("AnimatedSprite2D").flip_h = true
	elif input_direction[0] > 0:
		get_node("AnimatedSprite2D").flip_h = false
		
	if input_direction:
		anim.play("Run")
	else:
		anim.play("Idle")
	

func _physics_process(delta):
	get_input()
	move_and_slide()
