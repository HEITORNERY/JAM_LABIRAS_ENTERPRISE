extends Node2D
class_name  Level

var scene_npc = preload("res://scenes/npc_1.tscn")
var tempo_pra_spawnar_npc : float = 3.0
var map_dimensions

func _ready() -> void:
	map_dimensions = get_viewport().get_visible_rect()
	$Timer.start(tempo_pra_spawnar_npc)
	$Timer.one_shot = false

func _on_timer_timeout() -> void:
	var npc_position = Vector2(randf_range(10, map_dimensions.size.x -10), randf_range(10, map_dimensions.size.y -10))
	var npc_instance = scene_npc.instantiate()
	add_child(npc_instance)
	npc_instance.global_position = npc_position
	$Timer.start(tempo_pra_spawnar_npc)

func _process(_delta: float) -> void:
	$Update_Level_Player/AnimationPlayer.play("pisca")
	$HUD/Label.text = str(Global.money_actual)
	if $Player.nivel == 1:
		$Update_Level_Player/Label.text = "Evoluir
	Preço = " + str(Global.update_2)
	elif $Player.nivel == 2:
		$Update_Level_Player/Label.text = "Evoluir
	Preço = " + str(Global.update_3)
	elif $Player.nivel == 3:
		$Update_Level_Player/Label.text = "Evoluir
	Preço = " + str(Global.update_4)

func _on_update_level_player_body_entered(body: Node2D) -> void:
	if body is Player:
		$Player.update_level()
