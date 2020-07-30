extends Node2D

onready var sword_animation = $sword_animation
onready var collision = $sprite/sword/sword/attack_area/CollisionShape2D
func _physics_process(delta):
	if Input.is_action_pressed("down") and Input.is_action_pressed("left"):
		sword_animation.play("attackESQUERDA")
	if Input.is_action_pressed("down") and Input.is_action_pressed("right"):
		sword_animation.play("attackDIREITA")
	
	



