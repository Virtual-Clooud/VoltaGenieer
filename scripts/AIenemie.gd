extends KinematicBody2D

onready var Player = get_parent().get_node("player") #pegar dados do jogador

var speed = 400
var velocity = Vector2()
var gravity = 10

var react_time = 200
var dir = 0
var next_dir = 0
var next_dir_time = 0
var jump_force = 300

var next_jump_time = -1
func _physics_process(delta):
	if Player.position.x < position.x and next_dir != -1:
		next_dir = -1
		next_dir_time = OS.get_ticks_msec() + react_time
	elif Player.position.x > position.x and next_dir != 1:
		next_dir = 1
		next_dir_time = OS.get_ticks_msec() + react_time
	elif Player.position.x == position.x and next_dir != 0	:
		next_dir = 0
		next_dir_time = OS.get_ticks_msec() + react_time
		
	if OS.get_ticks_msec() > next_dir_time:
		dir = next_dir
	if OS.get_ticks_msec() > next_jump_time and next_jump_time != -1 and is_on_floor():
		if Player.position.y < position.y - 65:
			velocity.y = -speed
		next_jump_time = -1
		
	if Player.position.y < position.y - 65 and next_jump_time == -1:
		next_jump_time = OS.get_ticks_msec() + react_time
	
	velocity.x = dir * speed
	velocity.y = 10
	velocity = move_and_slide(velocity, Vector2(0, -1))
