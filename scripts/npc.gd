extends CharacterBody2D
class_name NPC

# velocidade do npc
var SPEED = 30.0

# se o npc vai comprar um bombom
var comprar_bombom : float

# direção pro movimento do npc
var direction : Vector2

# tempo para a venda ocorrer
var tempo_para_venda : float = 1.0

# npc deve parar ao entrar numa compra
var comprando : bool

# npc só pode comprar uma vez
var compra_feita : bool

# o jogador pode vender até 4 bombons
var bombom_1 = load("res://items/bombom_1.png")
var bombom_2 = load("res://items/bombom_2.png")
var bombom_3 = load("res://items/bombom_3.png")
var bombom_4 = load("res://items/bombom_4.png")

# cada bombom tem seu preço
var preco_bombom : int

# cada bombom tem seu nível
var bombom_nivel : int

# hora de ver se esse npc vai comprar o bombom ou não
func _ready() -> void:
	randomize()
	var direcao_destino : int = randi() % 4
	
	# origem do npc
	var origin_npc : Vector2
	
	# destino do npc
	var target_pos : Vector2
	
	# preciso saber o tamanho do mapa
	var map_dimensions = get_viewport().get_visible_rect()
	
	match direcao_destino:
		# se posição de spawn for 0 vai spawnar no topo e vai para a parte debaixo do mapa 
		0:
			origin_npc = Vector2(randf_range(10, map_dimensions.size.x -10), -10)
			target_pos = Vector2(randf_range(0, map_dimensions.size.x), map_dimensions.size.y)
		# se posição de spawn for 1 vai spawnar no direita e vai para a parte esquerda do mapa 
		1:
			origin_npc = Vector2(-10, randf_range(10, map_dimensions.size.y -10))
			target_pos = Vector2(0, randf_range(0,map_dimensions.size.y))
		# se posição de spawn for 2 vai spawnar no esquerda e vai para a parte direita do mapa 
		2:
			origin_npc = Vector2(map_dimensions.size.x + 10, randf_range(10, map_dimensions.size.y - 10))
			target_pos = Vector2(map_dimensions.size.x, randf_range(0, map_dimensions.size.y))
		# se posição de spawn for 3 vai spawnar no fundo e vai para a parte superior do mapa 
		3:
			origin_npc = Vector2(randf_range(10, map_dimensions.size.x -10), map_dimensions.size.y + 10)
			target_pos = Vector2(randf_range(0, map_dimensions.size.x), 0)
			
	
	# vou fazer esse npc saber a direção pro movimento
	direction = (target_pos - origin_npc).normalized()
	
	# probabilidade desse npc comprar um bombom
	comprar_bombom = randf() 
	
	# se o npc pode comprar um bombom, então o doce deve aparecer sobre sua cabeça
	if comprar_bombom < 0.6:
		var bombom_escolhido = randi() % 4
		add_to_group("NPCcomBombom")
		
		match bombom_escolhido:
			0:
				$item.texture = bombom_1
				preco_bombom = 3
				bombom_nivel = 1
			1:
				$item.texture = bombom_2
				preco_bombom = 4
				bombom_nivel = 2
			2:
				$item.texture = bombom_3
				preco_bombom = 5
				bombom_nivel = 3
			3:
				$item.texture = bombom_4
				preco_bombom = 6
				bombom_nivel = 4
	
	# no início o npc não compro nada
	compra_feita = false
	
	$Timer.one_shot = true
	
func _physics_process(_delta: float) -> void:
	if comprando:
		velocity = Vector2.ZERO
	else:
		velocity = direction * SPEED
		if velocity.x > 0:
			$Sprite2D.flip_h = false
			$AnimationPlayer.play("horizontal")
		elif velocity.x < 0:
			$Sprite2D.flip_h = true
			$AnimationPlayer.play("horizontal")
		elif velocity.y < 0:
			$AnimationPlayer.play("up")
		elif velocity.y > 0:
			$AnimationPlayer.play("down")
	move_and_slide()

# npc vai parar e vai esperar acabar o tempo para compra
func interagir_com_player() -> void:
	$AnimationPlayer.play("idle")
	$Timer.start(tempo_para_venda)
	
func _on_timer_timeout() -> void:
	comprando = false
	if comprando == false:
		compra_feita = true
		$item.texture = null
		Global.venda_feita(preco_bombom)
		remove_from_group("NPCcomBombom")
		
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player and comprar_bombom < 0.6 and compra_feita == false:
		if body.nivel >= bombom_nivel:
			comprando = true
			interagir_com_player()
