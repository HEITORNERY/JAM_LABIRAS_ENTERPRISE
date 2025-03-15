extends CharacterBody2D
class_name NPC_2

const SPEED = 100.0
var target : Node2D
var direction : Vector2
var nivel : int = 2

func _physics_process(delta: float) -> void:
	# buscar por npcs que queiram comprar bombons
	if target != null:
		direction = (target.global_position - global_position).normalized()
		$AnimatedSprite2D.play("run")
		velocity = direction * SPEED
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.play("idle")
		velocity = Vector2.ZERO
	move_and_slide()
	
func update_level() -> void:
	if Global.money_actual >= Global.update_3 and nivel == 2:
		Global.gasto(Global.money_actual)
		nivel += 1
	elif Global.money_actual >= Global.update_4 and nivel == 3:
		Global.gasto(Global.money_actual)
		nivel += 1

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("NPCcomBombom"):
		target = body
