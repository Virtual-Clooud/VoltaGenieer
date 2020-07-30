extends Node2D

onready var line = $line
onready var timer = $Timer

#var cat = preload("res://scenes/AIenemies.tscn") #carregar os inimigos
var slime = preload("res://scenes/slime.tscn")
var xLoc

onready var total_time = 3.5 #tempo para subtrair
onready var rest_time = 1 #tempo que vai ser subtraido

func _ready():
	randomize() #seed aleatória

func _when_timeout():
	xLoc = rand_range(line.get_point_position(0).x, line.get_point_position(1).x)
	
#	var enemy1 = cat.instance()
	var enemy2 = slime.instance()
	add_child(enemy2) #spawnar o slime
#	enemy1.position = Vector2(xLoc, 0)
	enemy2.position = Vector2(xLoc, 0)


func _on_generator_activated(area): # para cada gerador que for ativado, diminuir o tempo de spawn dos inimigos
	if area.is_in_group("gun"):
		timer.set_wait_time(total_time - rest_time)
		print(timer.get_wait_time())
		rest_time += 1
	
	if timer.get_wait_time() == 0.5: #fazer com que a saída se ative quando todos os geradores forem ativados
		$portal/CollisionShape2D.set_deferred("disabled", false)
