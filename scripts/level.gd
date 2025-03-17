extends Node2D
class_name  Level

var scene_npc = preload("res://scenes/npc_1.tscn")
var tempo_pra_spawnar_npc : float = 3.0

func _ready() -> void:
	$Timer.start(tempo_pra_spawnar_npc)
	$Timer.one_shot = false

func _on_timer_timeout() -> void:
	var rectangle_spawn = Rect2(Vector2(100, 150), Vector2(600 - 100, 150 - 250))
	var npc_position : Vector2 = Vector2(randi_range(rectangle_spawn.position.x, rectangle_spawn.position.x + rectangle_spawn.size.x), randi_range(rectangle_spawn.position.y, rectangle_spawn.position.y + rectangle_spawn.size.y))
	var npc_instance = scene_npc.instantiate()
	add_child(npc_instance)
	npc_instance.global_position = npc_position
	
	$Timer.start(tempo_pra_spawnar_npc)

func _on_inventory_button_pressed() -> void:
	$HUD/InventoryUI.abrir_inventario()

func _process(_delta: float) -> void:
	$HUD/Label.text = str(Global.money_actual)
