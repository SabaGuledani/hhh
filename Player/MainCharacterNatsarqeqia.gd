extends CharacterBody2D


#@export var speed = 150

#@onready var anim = get_node("AnimationPlayer")
#@onready var actionable_finder: Area2D = $actionable
#@onready var  global = get_node("/root/Global")
#func get_input():
#	if Input.is_action_just_pressed("speed_increase"):
#		speed+=100
#	elif Input.is_action_just_pressed("speed_decrease"):
#		speed-=100
#
#	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
#	velocity = input_direction * speed
#	if input_direction[0] < 0  or  State.gamogdebuli == false:
#		get_node("AnimatedSprite2D").flip_h = true
#	elif input_direction[0] > 0:
#		get_node("AnimatedSprite2D").flip_h = false
#
##	if input_direction or global.running == 1:
##		anim.play("Run")
##	else:
##		anim.play("Idle")
#
#func _unhandled_input(_event: InputEvent) -> void:
#	if Input.is_action_just_pressed("ui_accept"):
#		var actionables = actionable_finder.get_overlapping_areas()
#		if actionables.size() > 0:
#			actionables[0].action()
#		#if global.goblinStoryChapter == 2:
#
#		#DialogueManager.show_example_dialogue_balloon(load("res://dialogues/main.dialogue"),"start")
#		return 
func _physics_process(delta):
#	get_input()
	move_and_slide()
#	anim.play("Idle")




