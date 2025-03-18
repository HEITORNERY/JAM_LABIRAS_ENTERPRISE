extends CharacterBody2D
class_name Car

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body.dead()
