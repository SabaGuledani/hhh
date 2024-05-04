extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Path2D/PathFollow2D/Natsarqeqia/AnimatedSprite2D.play("move")
	NewspaperState.showQuestionImages.connect(on_question_image_show)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Path2D/PathFollow2D.progress_ratio += delta * NewspaperState.moveSpeed
	if NewspaperState.moveSpeed == 0:
		$Path2D/PathFollow2D/Natsarqeqia/AnimatedSprite2D.animation = "default"
	else:
		$Path2D/PathFollow2D/Natsarqeqia/AnimatedSprite2D.animation = "move"
	if $Path2D/PathFollow2D.progress_ratio == 1:
		if Global.loaded_from_world == false:
			get_tree().change_scene_to_file("res://Menu/MenuSceneManager.tscn")
		else: 
			
			get_tree().change_scene_to_file("res://world.tscn")

func on_question_image_show(questionNumber):
	if questionNumber == 0:
		$ImageContainer.visible = false
	var newTextureStr1 = "res://NewspaperGame/Images/quest_%s_1.png" % questionNumber
	var newTextureStr2 = "res://NewspaperGame/Images/quest_%s_2.png" % questionNumber
	var newTexture1 = load(newTextureStr1)
	var newTexture2 = load(newTextureStr2)
	$ImageContainer/TextureRect.set_texture(newTexture1)
	$ImageContainer/TextureRect2.set_texture(newTexture2)
	$ImageContainer.visible = true
