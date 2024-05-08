extends Node



func _ready():
	$SpellTextureRect/TextEdit.context_menu_enabled = false
	if Global.is_secure == 1:
		$CutsceneAnimationPlayer.play("cutscene_alternative")
		await $CutsceneAnimationPlayer.animation_finished
		Global.courier_met = true
		$TransitionScreen.transition('gameEnd')
		await $TransitionScreen/AnimationPlayer.animation_finished
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://Menu/MenuSceneManager.tscn")
		
		
	else:
		$CutsceneAnimationPlayer.play("cutscene_1")



func _process(delta):
	pass


func _on_texture_button_pressed():
	$SpellTextureRect/TextureButton/AudioStreamPlayer.play()
	
	var password = $SpellTextureRect/TextEdit.text
	var returned = check_security(password)
	
	if returned:
		$TipsTextureRect/TipsRichTextLabel.text = returned
		$TipsTextureRect/TipsAnimationPlayer.play("RESET")
		$TipsTextureRect/TipsAnimationPlayer.play("fade")
	else: 
		$TipsTextureRect/TipsAnimationPlayer.play_backwards("fade")
		$CutsceneAnimationPlayer.play("cutscene_2")
		await $CutsceneAnimationPlayer.animation_finished
		$TransitionScreen.transition('gameEnd')
		await $TransitionScreen/AnimationPlayer.animation_finished
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://Menu/MenuSceneManager.tscn")
		


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
	
	if !(len(password) >= 8):
		return "fraza zedmetad moklea, sigrdze unda iyos 8 an meti"
	elif !res_regex_lowletters:
		return "frazaSi ar gaqvs patara asoebi, unda iyos erTi mainc"
	elif !res_regex_upletters:
		return "frazaSi ar gaqvs didi asoebi, unda iyos erTi mainc"
	elif !res_regex_nums:
		return "frazaSi ar gaqvs cifrebi, unda iyos erTi mainc"
	elif !res_regex_symbols:
		return "frazaSi ar gaqvs simboloebi, unda iyos erTi mainc"
	else: return false



