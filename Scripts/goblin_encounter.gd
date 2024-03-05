extends Node

@export_file("*.json") var dialogue_file

var json_dict = []
var question_num = 0
var points = 0


func _ready():
	var file_contents = FileAccess.open(dialogue_file, FileAccess.READ).get_as_text()
	json_dict = JSON.parse_string(file_contents)
	$ChoiceButtonA/Choice.text = "a:"
	$ChoiceButtonB/Choice.text = "b:"
	$ChoiceButtonC/Choice.text = "g:"
	$ChoiceButtonD/Choice.text = "d:"
	button_text_handler()


	$ExclamationSprite.play("default")
	await $ExclamationSprite.animation_finished
	$MusicPlayer.play() 


	$TextBox.visible = true
	$TextboxAnimationPlayer.play("fade_in_textbox")
	await $TextboxAnimationPlayer.animation_finished
	await get_tree().create_timer(3.50).timeout
	
	$ExclamationSprite.play_backwards("default")
	await $ExclamationSprite.animation_finished
	buttons_disabled(false)
	$ExclamationSprite.visible = false
	$TextBox/TextureRect/Text.text = json_dict[question_num]["text"]
	button_text_handler()


func _process(_delta):
	pass


func answer_handler(answer):
	if json_dict[question_num]["answer"] == answer:
		$CorrectPlayer.play()
		points += 1
		$CorrectAnswerLabel.text = "sworia!"
		$CorrectAnswerLabel.set("theme_override_colors/font_color", Color(0, 255, 0))
		$AnswerAnimationPlayer.play("RESET")
		$AnswerAnimationPlayer.play("flash")
	else: 
		$IncorrectPlayer.play()
		$CorrectAnswerLabel.text = "arasworia!"
		$CorrectAnswerLabel.set("theme_override_colors/font_color", Color(255, 0, 0))
		$AnswerAnimationPlayer.play("RESET")
		$AnswerAnimationPlayer.play("flash")
		buttons_disabled(true)
		$TextBox/TextureRect/Text.text = json_dict[question_num]["desc"]
		$NextButton.disabled = false
		$NextButtonAnimationPlayer.play("fade")
		return
	question_num += 1
	if question_num == len(json_dict):
		finish_handler()
		return
	$TextBox/TextureRect/Text.text = json_dict[question_num]["text"]
	button_text_handler()


func finish_handler():
	$TextBox/TextureRect/Text.text = "Sen aiRe " + str(points) + " qula!"
	if !$ChoiceButtonA.disabled:
		buttons_disabled(true)
	await get_tree().create_timer(5.0).timeout
	get_tree().change_scene_to_file("res://world.tscn")


func buttons_disabled(value):
	if value:
		$ButtonsAnimationPlayer.play_backwards("fade")
		await $ButtonsAnimationPlayer.animation_finished
	else: 
		$ButtonsAnimationPlayer.play("fade")
		await $ButtonsAnimationPlayer.animation_finished
	$ChoiceButtonA.disabled = value
	$ChoiceButtonB.disabled = value
	$ChoiceButtonC.disabled = value
	$ChoiceButtonD.disabled = value


func button_text_handler():
	$ChoiceButtonA/Answer.text = json_dict[question_num]["a"]
	$ChoiceButtonB/Answer.text = json_dict[question_num]["b"]
	$ChoiceButtonC/Answer.text = json_dict[question_num]["g"]
	$ChoiceButtonD/Answer.text = json_dict[question_num]["d"]


func _on_choice_button_a_pressed():
	answer_handler("a")


func _on_choice_button_b_pressed():
	answer_handler("b")


func _on_choice_button_c_pressed():
	answer_handler("g")


func _on_choice_button_d_pressed():
	answer_handler("d")


func _on_next_button_pressed():
	$IncorrectPlayer.play()
	$NextButton.disabled = true
	$NextButtonAnimationPlayer.play_backwards("fade")
	await $NextButtonAnimationPlayer.animation_finished
	question_num += 1
	if question_num == len(json_dict):
		finish_handler()
		return
	$TextBox/TextureRect/Text.text = json_dict[question_num]["text"]
	buttons_disabled(false)
	button_text_handler()

