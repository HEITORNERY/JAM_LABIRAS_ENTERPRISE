extends CharacterBody2D
class_name Carro

const SPEED = 500.0
var sprites : Array = ["res://characters/carro_azul.png", "res://characters/limusine.png"]
var direction_move : Vector2

func _ready() -> void:
	var index = sprites[randi() % sprites.size()]
	$Sprite2D.texture = load(index)

func _physics_process(_delta: float) -> void:
	velocity = direction_move * SPEED
	move_and_slide()
	if position.y >= 800:
		queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		get_tree().reload_current_scene()
