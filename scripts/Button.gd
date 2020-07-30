extends Button



func _physics_process(delta):
	$AnimationPlayer.play("hover")
func _on_Button_pressed():
	get_tree().change_scene("res://scenes/World.tscn")
	
