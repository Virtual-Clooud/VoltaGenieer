extends Area2D


func _ready():
	pass

func _on_portal_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene("res://scenes/Win.tscn")
