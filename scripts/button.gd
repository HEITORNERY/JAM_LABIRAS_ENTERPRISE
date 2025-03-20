extends Button

func _ready() -> void:
	# Conecta o botão ao método _on_pressed quando for clicado
	connect("pressed", Callable(self, "_on_pressed"))

func _on_pressed() -> void:
	# Altera a cena para a cena 1 (substitua o caminho pelo correto)
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")
