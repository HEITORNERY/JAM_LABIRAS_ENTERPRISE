extends Control
class_name CelularMessage

@export var message_label : String = "Apareceu a oportunidade da sua vida! Você tem que entregar uma encomenda de mil doces em 3 minutos no restaurante Delícia! Falhe e perca tudo! Não aceite e perca pros seus concorrentes! E aí ? O que vai fazer ?"
@export var delay_text : float = 0.1

func _ready() -> void:
	$Panel/AceitarButton.visible = false
	$Panel/RecusarButton.visible = false
	$Panel/Label.text = ""
	iniciar_mensagem()

func iniciar_mensagem() -> void:
	for letter in message_label:
		$Panel/Label.text += letter
		await get_tree().create_timer(delay_text).timeout
		$Panel/AceitarButton.visible = true
		$Panel/RecusarButton.visible = true
	
