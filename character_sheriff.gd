extends CharacterBody2D


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var info = "xasiaTi : \nfrTxili da Zlieri.\n
ambavisdami mikerZoveba:\n Serifis mikerZoveba midrekilia \nwesrigisa da wesebis dacvae. \nmisi ambavi xazs usvams \nsamarTlianobas da wesrigis dacvas."

#func _physics_process(delta):
#	velocity.y += gravity * delta
	
#	move_and_slide()
	
func  _ready():
	#get_node("/root/CharacterBody2D/AnimatedSprite2D").play("Idle")
	$AnimatedSprite2D.play("Idle")


