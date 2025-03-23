extends Control
class_name MessageFinal

@export var message_label : String = "Parabéns! Você chegou até o fim! Não desistiu e agora Carlos é o maior confeiteiro da região! Carlos agradece!"
@export var delay_text : float = 0.1

func _ready() -> void:
	$Panel/Button.visible = false
	$Panel/Label.text = ""
	iniciar_mensagem()

func iniciar_mensagem() -> void:
	for letter in message_label:
		$Panel/Label.text += letter
		await get_tree().create_timer(delay_text).timeout
	$Panel/Button.visible = true
	
func _on_button_pressed() -> void:
	Global.money_actual = 0
	get_tree().change_scene_to_file("res://scenes/home.tscn")
	Global.inventario["bombom_1"].quantidade = 10
