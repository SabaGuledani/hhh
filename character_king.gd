extends CharacterBody2D


#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var info = "xasiaTi: avtoritetuli\n Tavdajerebuli\n Zalauflebaze orientirebuli \n 
ambavisdami mikerZoveba:\n mefe xazs usvams\n Zalauflebisa da kontrolis\n mniSvnelobas. misi ambavi \ngaazviadebs miRwevebs\n da xazs gausvams siZlieris\n mniSvnelobas."

#func _physics_process(delta):
#	velocity.y += gravity * delta
#	move_and_slide()
	
func  _ready():
	get_node("AnimatedSprite2D").play("Idle")
	

