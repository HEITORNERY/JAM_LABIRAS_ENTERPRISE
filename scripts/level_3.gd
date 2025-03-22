extends Node2D
class_name Level_3

var cars : Array = [80, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1100, 1200]
var car_scene = preload("res://scenes/car.tscn")
var timezinho: float = 180.0  # 3 minutos em segundos

func _ready() -> void:
	$Timer.start(0.5)
	
func _on_timer_timeout() -> void:
	spawn_enemy()

func spawn_enemy() -> void:
	var car = car_scene.instantiate()
	var posicao_x = cars[randi() % cars.size()]
	car.position = Vector2(posicao_x, -50)
	# Substitua $"." pelo nó correto onde os carros devem ser adicionados. Exemplo:
	$".".add_child(car)
	$Timer.start(0.5)

func _process(_delta: float) -> void:
	timezinho -= _delta
	$Label.text = "Tempo até a entrega chegar no destino: " + str(int(timezinho))
	if timezinho <= 0.0:
		get_tree().change_scene_to_file("res://scenes/mensagem_final.tscn")
