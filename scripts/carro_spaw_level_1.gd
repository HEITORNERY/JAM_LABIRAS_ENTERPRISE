extends Marker2D
class_name CarroSpawnarLevel1

var car_scene = preload("res://scenes/carro_1.tscn")

func _ready() -> void:
	var car = car_scene.instantiate()
	car.direction_move = Vector2.RIGHT 
	$".".add_child(car)
	$Timer.start(1)
	
func _on_timer_timeout() -> void:
	var car = car_scene.instantiate()
	car.direction_move = Vector2.RIGHT
	$".".add_child(car)
	$Timer.start(1)
