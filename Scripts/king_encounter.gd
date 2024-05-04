extends Node


func _ready():
	Global.is_secure = 0


func _process(delta):
	pass


func _on_texture_button_pressed():
	$SpellTextureRect/TextureButton/AudioStreamPlayer.play()
	$CutsceneAnimationPlayer.play("cutscene_2")
	var password = $SpellTextureRect/TextEdit.text
	check_security(password)
	await $CutsceneAnimationPlayer.animation_finished
	Global.king_met = true
	if Global.loaded_from_world == false:
		get_tree().change_scene_to_file("res://Scenes/courier_encounter.tscn")
	else:
		get_tree().change_scene_to_file("res://world.tscn")
	
	


func check_security(password):
	var regex_symbols = RegEx.new()
	var regex_nums = RegEx.new()
	var regex_lowletters = RegEx.new()
	var regex_upletters = RegEx.new()
	
	regex_symbols.compile("[$&+,:;=?@#|'<>.^*()%!-]")
	regex_nums.compile("[0-9]")
	regex_lowletters.compile("[a-z]")
	regex_upletters.compile("[A-Z]")
	
	var res_regex_symbols = regex_symbols.search(password)
	var res_regex_nums = regex_nums.search(password)
	var res_regex_lowletters = regex_lowletters.search(password)
	var res_regex_upletters = regex_upletters.search(password)
	
	if res_regex_symbols and res_regex_nums and res_regex_lowletters and res_regex_upletters and (len(password) >= 8):
		Global.is_secure = 1
