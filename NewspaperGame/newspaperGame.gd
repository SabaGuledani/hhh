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
	var newTextureStr1 = "res://NewspaperGame/Images/quest_%s_1.jpg" % questionNumber
	var newTextureStr2 = "res://NewspaperGame/Images/quest_%s_2.jpg" % questionNumber
	var newTexture1 = load(newTextureStr1)
	var newTexture2 = load(newTextureStr2)
	$ImageContainer/TextureRect.set_texture(newTexture1)
	$ImageContainer/TextureRect2.set_texture(newTexture2)
	$ImageContainer.visible = true
