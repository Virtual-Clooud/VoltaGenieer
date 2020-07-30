extends StaticBody2D


func _ready():
	pass






func _on_Area2D_area_entered(area):
		if area.is_in_group("sword"):
			queue_free()
			print("man")
