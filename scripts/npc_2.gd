extends CharacterBody2D
class_name NPC2

var SPEED = 200.0
var parado_para_receber_pedido : bool
var pedido_1 = load("res://Pixel Food Pack_v1.2/Pixel Food Pack_v1.2/32x32/candy1.png")
var pedido_2 = load("res://Pixel Food Pack_v1.2/Pixel Food Pack_v1.2/32x32/milkshake.png")
var pedido_3 = load("res://Pixel Food Pack_v1.2/Pixel Food Pack_v1.2/32x32/oreo.png")
var pedido_4 = load("res://Pixel Food Pack_v1.2/Pixel Food Pack_v1.2/32x32/pie.png")
var sprite_pedido 
var money_pedido : int

func _physics_process(_delta: float) -> void:
	if parado_para_receber_pedido:
		velocity = Vector2.ZERO
		$AnimatedSprite2D.play("idle")
	else:
		velocity = Vector2.RIGHT * SPEED
		$AnimatedSprite2D.play("run")
	move_and_slide()


func _on_detection_pedido_body_entered(body: Node2D) -> void:
	if body is Player:
		if body.pedido_para_fazer == null:
			parado_para_receber_pedido = true
			body.pedido_para_fazer = sprite_pedido
			$Label.text = "Cadê meu pedido ?"
		elif body.pedido_feito == true and body.pedido_para_fazer == sprite_pedido:
			Global.venda_feita(money_pedido)
			body.pedido_para_fazer = null
			body.pedido_feito = false
			queue_free()

func _ready() -> void:
	$Label.text = "Me atenda !"
	var random_pedido : int = randi() % 4
	match random_pedido:
		0:
			$Sprite2D.texture = pedido_1
			sprite_pedido = pedido_1
			money_pedido = 6
		1:
			$Sprite2D.texture = pedido_2
			sprite_pedido = pedido_2
			money_pedido = 7
		2:
			$Sprite2D.texture = pedido_3
			sprite_pedido = pedido_3
			money_pedido = 8
		3:
			$Sprite2D.texture = pedido_4
			sprite_pedido = pedido_4
			money_pedido = 9
