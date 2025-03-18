extends PathFollow2D
class_name PathFollowCar2

var speed : float = 500.0
var car_1 : PackedScene = preload("res://scenes/carro_1.tscn")
var car_instance : CharacterBody2D = null

func _ready() -> void:
	$"../Timer".start(0.4)
	car_instance = car_1.instantiate()
	add_child(car_instance)


func _physics_process(_delta: float) -> void:
	progress_ratio += speed * _delta / get_parent().curve.get_baked_length()
	if progress_ratio >= 1.0:
		car_instance.queue_free()

func _on_timer_timeout() -> void:
	car_instance = car_1.instantiate()
	add_child(car_instance)
	$"../Timer".start(0.4)
