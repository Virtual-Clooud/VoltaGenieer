extends KinematicBody2D

var speed = 650
var velocity = Vector2()
var gravity = 10
var jump_force = 700
onready var sprite = $sprite

func _on_Area2D_area_entered(area):
	if area.is_in_group("enemie"):
		get_tree().change_scene("res://scenes/Lost.tscn")

func _physics_process(delta):
	if Input.is_action_pressed("left"):
		velocity.x = lerp(velocity.x, -speed, 0.7)
		sprite.play("run")
		sprite.set_flip_h(true)
		
	elif Input.is_action_pressed("right"):
		velocity.x = lerp(velocity.x, speed, 0.7)
		sprite.play("run")
		sprite.set_flip_h(false)
	else:
		velocity.x = lerp(velocity.x, 0, 0.7)
		sprite.play("idle")
		
	if Input.is_action_pressed("up") and is_on_floor():
		velocity.y = -jump_force
		$AnimationPlayer.play("jump")
	else:
		velocity.y += gravity
		
	velocity = move_and_slide(velocity, Vector2(0, -1))


