extends CharacterBody2D
class_name Carro

const SPEED = 500.0
var sprites : Array = ["res://characters/carro_azul.png", "res://characters/limusine.png"]
<<<<<<< HEAD
var direction_move : Vector2
=======
>>>>>>> 5411589c9d5c51e7bcb6f96beb6d21ef2f457b73

func _ready() -> void:
	var index = sprites[randi() % sprites.size()]
	$Sprite2D.texture = load(index)

func _physics_process(_delta: float) -> void:
<<<<<<< HEAD
	velocity = direction_move * SPEED
=======
	velocity = Vector2.DOWN * SPEED
>>>>>>> 5411589c9d5c51e7bcb6f96beb6d21ef2f457b73
	move_and_slide()
	if position.y >= 800:
		queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		get_tree().reload_current_scene()
