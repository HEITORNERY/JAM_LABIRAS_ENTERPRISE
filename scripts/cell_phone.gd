extends Sprite2D

func _ready() -> void:
	$".".visible = false

func _process(_delta: float) -> void:
	if Global.money_actual >= Global.next_fase_1:
		$".".visible = true
		$AnimationPlayer.play("tocando")

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/mensagem.tscn")
