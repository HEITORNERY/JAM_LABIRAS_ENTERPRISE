extends Node2D
class_name Level_3

<<<<<<< HEAD
var left_cars : Array = [80, 200, 300, 400, 500, 600]  # Metade esquerda
var right_cars : Array = [700, 800, 900, 1000, 1100, 1200]  # Metade direita
=======
var cars : Array = [80, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1100, 1200]
>>>>>>> 5411589c9d5c51e7bcb6f96beb6d21ef2f457b73
var car_scene = preload("res://scenes/car.tscn")
var timezinho: float = 180.0  # 3 minutos em segundos

func _ready() -> void:
	$Timer.start(0.5)
<<<<<<< HEAD

=======
	
>>>>>>> 5411589c9d5c51e7bcb6f96beb6d21ef2f457b73
func _on_timer_timeout() -> void:
	spawn_enemy()

func spawn_enemy() -> void:
	var car = car_scene.instantiate()
<<<<<<< HEAD
	var going_up = randi() % 2 == 0  # 50% de chance de spawnar na esquerda (subindo)
	var going_down = not going_up  # Se não for para subir, então é para descer

	if going_up:
		var posicao_x = left_cars[randi() % left_cars.size()]
		car.position = Vector2(posicao_x, 650)  # Nasce embaixo
		car.direction_move = Vector2.UP # Sobe

	if going_down:
		var posicao_x = right_cars[randi() % right_cars.size()]
		car.position = Vector2(posicao_x, -50)  # Nasce em cima
		car.direction_move = Vector2.DOWN  # Desce

=======
	var posicao_x = cars[randi() % cars.size()]
	car.position = Vector2(posicao_x, -50)
	# Substitua $"." pelo nó correto onde os carros devem ser adicionados. Exemplo:
>>>>>>> 5411589c9d5c51e7bcb6f96beb6d21ef2f457b73
	$".".add_child(car)
	$Timer.start(0.5)

func _process(_delta: float) -> void:
	timezinho -= _delta
<<<<<<< HEAD
	$Label.text = "Tempo até a entrega chegar no destino: " + str(int(timezinho)) + " s"
=======
	$Label.text = "Tempo até a entrega chegar no destino: " + str(int(timezinho))
>>>>>>> 5411589c9d5c51e7bcb6f96beb6d21ef2f457b73
	if timezinho <= 0.0:
		get_tree().change_scene_to_file("res://scenes/mensagem_final.tscn")
