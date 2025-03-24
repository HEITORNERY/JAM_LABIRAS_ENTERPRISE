extends Marker2D
class_name CarroSpawnarLevel2

var car_scene = preload("res://scenes/car.tscn")

func _ready() -> void:
	var car = car_scene.instantiate()
	car.direction_move = Vector2.UP 
	$".".add_child(car)
	$Timer.start(1)
	
func _on_timer_timeout() -> void:
	var car = car_scene.instantiate()
	car.direction_move = Vector2.UP 
	$".".add_child(car)
	$Timer.start(1)
