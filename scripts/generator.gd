extends StaticBody2D

onready var sprite = $Sprite
var cont = 0 #quantas vezes o jogador bateu no gerador
var on = preload("res://sprites/Gerador.png")
	
func _on_area_entered(area):
	if area.is_in_group("gun"):
		cont += 1
		if cont == 3:
			$area/CollisionShape2D.set_deferred("disabled", false) #habilitar a colisão da área que vai aumentar a taxa de spawn dos inimigos
			sprite.set_texture(on)
