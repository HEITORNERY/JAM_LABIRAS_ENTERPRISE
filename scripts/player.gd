extends CharacterBody2D
class_name Player

const SPEED = 100.0
var direction : Vector2
var joystick_can : bool = false
var nivel : int = 1 # o nível serve para saber se o player pode vender esse bombom ou não

func _ready() -> void:
	if OS.get_name() == "Android" or OS.get_name() == "iOS":
		$HUD.visible = true
		joystick_can = true
	else:
		$HUD.queue_free()
		joystick_can = false

func _physics_process(_delta: float) -> void:
	var input_vector : Vector2 = Vector2.ZERO
	if not joystick_can:
		if Input.is_action_pressed("ui_right"):
			input_vector.x += 1
		if Input.is_action_pressed("ui_left"):
			input_vector.x -= 1
		if Input.is_action_pressed("ui_up"):
			input_vector.y -= 1
		if Input.is_action_pressed("ui_down"):
			input_vector.y = 1 
		if input_vector != Vector2.ZERO:
			velocity = input_vector.normalized() * SPEED
			if input_vector.x > 0:
				$AnimatedSprite2D.flip_h = false
			elif input_vector.x < 0:
				$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("run")
		else:
			velocity = Vector2.ZERO
			$AnimatedSprite2D.play("idle")
	move_and_slide()

func _on_virtual_joystick_analogic_change(move: Vector2) -> void:
	velocity = move * SPEED
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("run")
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("idle")

func update_level() -> void:
	if Global.money_actual >= Global.update_2 and nivel == 1:
		Global.gasto(Global.money_actual)
		nivel += 1
	elif Global.money_actual >= Global.update_3 and nivel == 2:
		Global.gasto(Global.money_actual)
		nivel += 1
	elif Global.money_actual >= Global.update_4 and nivel == 3:
		Global.gasto(Global.money_actual)
		nivel += 1
