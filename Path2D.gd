extends Path2D



@export var tye_Manager: TyeManager
@onready var state = get_node("/root/State")
@onready var  global = get_node("/root/Global")
var inc = 0.0  # Ensure 'inc' is a float
var speed = 50  # Ensure 'speed' is a float

@onready var tree_root = get_tree().get_root()
@onready var anim = tree_root.get_child( tree_root.get_child_count()-1 ).get_node("Path2D/PathFollow2D/natsarqeqia/AnimationPlayer")

#@onready var anim = get_node("AnimationPlayer")
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_process(delta):
	if state.excalibur_end == true:
		global.running = 1
		inc += delta * speed
		$PathFollow2D.progress = inc
	
	
func _process(delta):
	pass
	
		
#	tye_Manager.connect("excalibur_ended", _on_excalibur_ended)
	


#func _on_excalibur_ended(delta):
#	inc += delta * speed
#	$PathFollow2D.progress = inc
