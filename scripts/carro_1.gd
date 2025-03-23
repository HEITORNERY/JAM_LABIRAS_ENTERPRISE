extends CharacterBody2D
class_name Car

var speed : float = 500.0
var direction_move : Vector2

func _physics_process(delta: float) -> void:
	velocity = speed * direction_move
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body.dead()

func _process(_delta: float) -> void:
	if global_position.x >= 1281:
		queue_free()
