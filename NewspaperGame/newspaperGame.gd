extends Node2D

var speed = 0.35

# Called when the node enters the scene tree for the first time.
func _ready():
	$Path2D/PathFollow2D/Natsarqeqia/AnimatedSprite2D.play("move")
	NewspaperState.showQuestionImages.connect(on_question_image_show)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ($Path2D/PathFollow2D.progress_ratio != 1):
		$Path2D/PathFollow2D.progress_ratio += delta * speed
	else:
		$Path2D/PathFollow2D/Natsarqeqia/AnimatedSprite2D.animation = "default"


func on_question_image_show(questionNumber):
	print("signal_emitted" + str(questionNumber))
