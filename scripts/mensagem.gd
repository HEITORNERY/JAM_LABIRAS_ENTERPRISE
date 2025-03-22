extends Control
class_name CelularMessage

@export var message_label : String = "Você entregou a encomenda com suceeso! Graças a você, agora Carlos é o maior empresário e confeiteiro da região! Você foi muito bem!"
@export var delay_text : float = 0.1

func _ready() -> void:
	$Panel/Button.visible = false
	$Panel/Label.text = ""
	iniciar_mensagem()

func iniciar_mensagem() -> void:
	for letter in message_label:
		$Panel/Label.text += letter
		await get_tree().create_timer(delay_text).timeout
<<<<<<< HEAD
	$Panel/AceitarButton.visible = true
	$Panel/RecusarButton.visible = true
	
func _on_aceitar_button_pressed() -> void:
	Global.gasto(Global.money_actual)
	get_tree().change_scene_to_file("res://scenes/level_3.tscn")

func _on_recusar_button_pressed() -> void:
	Global.gasto(Global.money_actual)
	get_tree().change_scene_to_file("res://scenes/level_3.tscn")
=======
	$Panel/Button.visible = true

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")
>>>>>>> 5411589c9d5c51e7bcb6f96beb6d21ef2f457b73
