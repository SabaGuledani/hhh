extends CharacterBody2D


@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

var entered = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	entered += 1
	if (entered == 2):
		DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
