extends KinematicBody2D

onready var sprite = $sprite
var speed = 500
var velocity = Vector2()
var gravity = 10
var touch_floor = false
func run():
	if touch_floor == true:
		sprite.play("run")
		if is_on_wall():
			speed = speed * -1
		velocity.x = speed
		if velocity.x < 0:
			sprite.set_flip_h(false)
		else:
			sprite.set_flip_h(true)
func _physics_process(delta):
	if is_on_floor():
		touch_floor = true
	else:
		sprite.play("idle")
	run()
	
	velocity.y += gravity
	velocity = move_and_slide(velocity, Vector2(0, -1))


func _on_attack_entered(area):
	if area.is_in_group("gun"):
		queue_free()
