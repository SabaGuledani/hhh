extends BaseDialogueTestScene


# Called when the node enters the scene tree for the first time.
func dialog_start():
	var balloon = load("res://dialog/balloon.tscn").instantiate()
	#get_tree().current_scene.add_child(balloon)
	#get_tree().current_scene.call_deferred("add_child", balloon)
	balloon.start(resource, title)
