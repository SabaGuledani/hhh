extends CharacterBody2D



var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var info = "xasiaTi:\n ketili da TanamgrZnobi\n 
ambavisdami mikerZoveba:\nqalbatoni xazs usvams ambis\n romantikul da pozitiur aspeqtebs.\nSeiZleba gaaWarbos ambis emociuri\n mxare da fokusirdes movlenis\n silamazeebze."

#func _physics_process(delta):
#	velocity.y += gravity * delta
#	move_and_slide()
	
func  _ready():
	#get_node("/root/CharacterBody2D/AnimatedSprite2D").play("Idle")
	$CollisionShape2D/AnimatedSprite2D.play("Idle")


func _on_area_2d_input_event(viewport, event, shape_idx):
	pass # Replace with function body.
