extends Area2D



func _on_death_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene("res://Lost.tscn")
