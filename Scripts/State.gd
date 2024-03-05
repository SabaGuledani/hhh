extends Node



@onready var  global = get_node("/root/Global")
@onready var goblin_scene_final = false
var feria_ended = false
var gamogdebuli = false
var bias_ended = false
signal excalibur_ended(ended: bool)
var excalibur_end: bool = false:
	get:
		return excalibur_end
	set(value):
		excalibur_end = value
		emit_signal("excalibur_ended",excalibur_end)


signal goblinstart_ended


var goblinstart_end: bool = false:
	get:
		return goblinstart_end
	set(value):
		goblinstart_end = value
		goblinstart_ended.emit()
		
var meorescena_node = "res://meore.tscn"

func _on_goblinstart_ended():
	global.goblinStoryChapter+=1
	
	
