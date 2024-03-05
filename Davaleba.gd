extends CanvasLayer

@onready var margin_container = $MarginContainer
@onready var label = $MarginContainer/MarginContainer/Label
@onready var Buttons_Container = $HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	hide_textbox()
	add_text("")
	buttons_hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func hide_textbox():
	label.text = ""
	margin_container.hide()
	Buttons_Container.hide()
	
	
func show_textbox():
	margin_container.show()
	
func show_buttons():
	Buttons_Container.show()
	
func add_text(next_text):
	label.text = next_text
	show_textbox()
	Buttons_Container.show()
	
func buttons_hide():
	Buttons_Container.hide()


func _on_button_pressed():
	var camera = get_node("/root/bias_mini_game/CharacterBody2D/Area2D/Camera2D")
	var char_1 = get_node('/root/bias_mini_game/CharacterBody2D/Area2D')
	var char_2 = get_node('/root/bias_mini_game/CharacterBody2D2/Area2D')
	var char_3 = get_node('/root/bias_mini_game/CharacterBody2D3/Area2D')
	if camera.offset.x == 0:
		camera.zoom = Vector2(2.5, 2.5)
		char_3.camera_zoom()
		char_1.char1_id = 0
		char_2.char2_id = 0
		print("gadasvla mesameze")
		
	elif camera.offset.x == -150 :
		camera.zoom = Vector2(2.5, 2.5)
		char_1.camera_zoom()
		char_2.char2_id = 0
		char_3.char3_id = 0
	elif  camera.offset.x == 150:
		pass
		
		


func _on_button_2_pressed():
	var camera = get_node("/root/bias_mini_game/CharacterBody2D/Area2D/Camera2D")
	var char_1 = get_node('/root/bias_mini_game/CharacterBody2D/Area2D')
	var char_2 = get_node('/root/bias_mini_game/CharacterBody2D2/Area2D')
	var char_3 = get_node('/root/bias_mini_game/CharacterBody2D3/Area2D')
	if camera.offset.x == 0:
		camera.zoom = Vector2(2.5, 2.5)
		char_2.camera_zoom()
		char_1.char1_id = 0
	elif camera.offset.x == 150:
		camera.zoom = Vector2(2.5,2.5)
		char_1.camera_zoom()
		char_2.char2_id = 0
		char_3.char3_id = 0
	elif camera.offset.x == -150 :
		pass
	


func _on_button_3_pressed():
	var char2_id = get_node('/root/bias_mini_game/CharacterBody2D2/Area2D').char2_id
	var char1_id = get_node('/root/bias_mini_game/CharacterBody2D/Area2D').char1_id
	var char3_id = get_node('/root/bias_mini_game/CharacterBody2D3/Area2D').char3_id
	var bias_obj = get_node("/root/bias_mini_game")

	
	var mefe_axsna = "moniSnuli personaJi ki aris avtoritetuli da Tavdajerebuli\n"
	var tetri_raindi_axsna = "moniSnuli personaJi ki aris ketili da mgrZnobiare\n"
	var shavi_raindi_axsna = "moniSnuli personaJi ki aris frTxili da Zlieri.\n"
	
	var mefe_minishneba = "\nsiuJeti xazs usvams Zalauflebasa da avtoritets, Tvisebebs, romelic\nasocirebulia personaJTan, romelic avtoritetuli da Tavdajerebulia."
	var tetri_raindi_minishneba = "\nsiujeti xazs usvams siketesa da movlenis empaTikuri TvaliT danaxvas"
	var shavi_raindi_minishneba = "\nsiujeti xazs usvams personaJis sifrTxilesa da siZlieres"
	
	
	if char1_id == 1:
		
		if bias_obj.indexi == 0:
			add_text(tetri_raindi_minishneba+"\n"+mefe_axsna)
			await get_tree().create_timer(7).timeout
			add_text(bias_obj.davalebebi[bias_obj.indexi])
		elif bias_obj.indexi == 1:
			add_text(shavi_raindi_minishneba+"\n"+mefe_axsna)
			await get_tree().create_timer(7).timeout
			add_text(bias_obj.davalebebi[bias_obj.indexi])
		elif bias_obj.indexi == 2:
			add_text("Tqven sworad moniSneT pasuxi, es mefis sityvebia")
			bias_obj.plus_indexi()
			await get_tree().create_timer(4).timeout
			add_text(bias_obj.davalebebi[bias_obj.indexi])
			
	if char2_id == 1:
		
		if bias_obj.indexi == 0:
			add_text("Tqven swori pasuxi moniSneT pasuxi, es TeTri raindis sityvebia")
			await get_tree().create_timer(4).timeout
			bias_obj.plus_indexi()
			add_text(bias_obj.davalebebi[bias_obj.indexi])
		elif bias_obj.indexi == 1:
			add_text(shavi_raindi_minishneba+"\n"+tetri_raindi_axsna)
			await get_tree().create_timer(7).timeout
			add_text(bias_obj.davalebebi[bias_obj.indexi])
		elif bias_obj.indexi == 2:
			add_text(mefe_minishneba+"\n"+tetri_raindi_axsna)
			await get_tree().create_timer(7).timeout
			add_text(bias_obj.davalebebi[bias_obj.indexi])
			
	if char3_id == 1:
		if bias_obj.indexi == 0:
			add_text(tetri_raindi_minishneba+"\n"+shavi_raindi_axsna)
			await get_tree().create_timer(7).timeout
			add_text(bias_obj.davalebebi[bias_obj.indexi])
		elif bias_obj.indexi == 1:
			add_text("Tqven swori pasuxi moniSneT pasuxi, es Savi rainis sityvebia")
			await get_tree().create_timer(4).timeout
			bias_obj.plus_indexi()
			add_text(bias_obj.davalebebi[bias_obj.indexi])
		elif bias_obj.indexi == 2:
			add_text(mefe_minishneba+"\n"+shavi_raindi_axsna)
			await get_tree().create_timer(7).timeout
			add_text(bias_obj.davalebebi[bias_obj.indexi])
			
			
	
	
