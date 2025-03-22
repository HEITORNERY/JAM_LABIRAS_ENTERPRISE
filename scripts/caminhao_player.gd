extends CharacterBody2D
class_name Player_2

var SPEED : float = 100.0
var joystick_can : bool = false
var nivel : int = 1 # o nível serve para saber se o player pode vender esse bombom ou não
var dash_speed : float = 800.0
var dash_timer : float = 0.1
var is_dashing : bool = false
var dash_duration : float
var dash_direction : Vector2
var dash_load : float = 2.0
var preprarar_dash : float
var vector_joystick : Vector2

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
			input_vector.y += 1 
		if input_vector != Vector2.ZERO:
			velocity = input_vector.normalized() * SPEED
		else:
			velocity = Vector2.ZERO
	
	# recarregar dash
	if preprarar_dash > 0.0:
		preprarar_dash -= _delta
	
	# verificar se está na hora do dash
	if Input.is_action_just_pressed("dash") and is_dashing == false and preprarar_dash <= 0.0:
		is_dashing = true
		if input_vector != Vector2.ZERO:
			dash_direction = input_vector
		dash_duration = dash_timer
		velocity = dash_direction.normalized() * dash_speed
	
	if is_dashing:
		dash_duration -= _delta
		velocity = dash_direction.normalized() * dash_speed
		if dash_duration <= 0:
			is_dashing = false
			preprarar_dash = dash_load
			if input_vector != Vector2.ZERO:
				velocity = input_vector.normalized() * SPEED
			else:
				velocity = Vector2.ZERO
				
	move_and_slide()

func _on_virtual_joystick_analogic_change(move: Vector2) -> void:
	vector_joystick = move
	velocity = move * SPEED

func _on_touch_screen_button_pressed() -> void:
	if is_dashing == false and preprarar_dash <= 0.0:
		is_dashing = true
		if vector_joystick != Vector2.ZERO:
			dash_direction = vector_joystick
		dash_duration = dash_timer
		velocity = dash_direction.normalized() * dash_speed
