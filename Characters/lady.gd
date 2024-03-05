extends CharacterBody2D

func _physics_process(delta):
	get_node("AnimatedSprite2D").flip_h = true
