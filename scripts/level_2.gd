extends Node2D
class_name Level2

var npc_2 : PackedScene = preload("res://scenes/npc_2.tscn")

func _ready() -> void:
	var npc_1 = npc_2.instantiate()
	var npc2 = npc_2.instantiate()
	var npc_3 = npc_2.instantiate()
	var npc_4 = npc_2.instantiate()
	$Marker2D.add_child(npc_1)
	$Marker2D2.add_child(npc2)
	$Marker2D3.add_child(npc_3)
	$Marker2D4.add_child(npc_4)
	
func _on_timer_timeout() -> void:
	$Forno/Label.text = "Feito"
	
func _process(_delta: float) -> void:
	$HUD/Label.text = str(Global.money_actual)
	if $Marker2D.get_child_count() == 0:
		var npc_1 = npc_2.instantiate()
		$Marker2D.add_child(npc_1)
	if $Marker2D2.get_child_count() == 0:
		var npc2 = npc_2.instantiate()
		$Marker2D2.add_child(npc2)
	if $Marker2D3.get_child_count() == 0:
		var npc_3 = npc_2.instantiate()
		$Marker2D3.add_child(npc_3)
	if $Marker2D4.get_child_count() == 0:
		var npc_4 = npc_2.instantiate()
		$Marker2D4.add_child(npc_4)

func _on_forno_body_entered(body: Node2D) -> void:
	if body is Player and body.pedido_para_fazer != null and $Forno/Label.text == "":
		$Forno/Sprite2D.texture = body.pedido_para_fazer
		$Forno/Label.text = "Cozinhando"
		$Forno/Timer.start(1.0)
	elif body is Player and $Forno/Label.text == "Feito":
		$Forno/Label.text = ""
		$Forno/Sprite2D.texture = null
		body.pedido_feito = true
