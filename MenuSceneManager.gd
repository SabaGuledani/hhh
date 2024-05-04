extends Node2D

#const SceneTwo = preload("res://Menu/GameChoose.tscn")
#const SceneWorld = preload("res://world.tscn")
var scenes = ["dummy"]
var scenePreload = preload("res://Menu/GameChoose.tscn")

func _ready():
	Global.loaded_from_world = true
	Global.courier_met = false
	Global.king_met = false
	Global.feria_met = false
	Global.gnome_met = false
func _process(delta):
	pass
	
		



func _on_transition_screen_transitioned():
	print(scenes)
	if scenes[-1] == "story":
		
		scenePreload = preload("res://world.tscn")
	else:
		Global.loaded_from_world = false
		if scenes[-1] == "tba":
			scenePreload = preload("res://feria.tscn")
		elif scenes[-1] == "gnome":
			scenePreload = preload("res://GnomeGame/gnome_encounter.tscn")
		elif scenes[-1] == "newspaper":
			scenePreload = preload("res://NewspaperGame/newspaperGame.tscn")
		elif scenes[-1] == "king":
			scenePreload = preload("res://Scenes/king_encounter.tscn")
		else:
			scenePreload = preload("res://world.tscn")
		
	$Scenes.get_child(0).queue_free()
	$Scenes.add_child(scenePreload.instantiate())
	


func _on_menu_scene_game_pressed(game):
	print(game)
	scenes[-1] = game
	print(scenes)
	$TransitionScreen.transition("gamestart")
