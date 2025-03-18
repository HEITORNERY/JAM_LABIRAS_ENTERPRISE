extends Control
class_name InventoryUI

@export var player : Player

func _ready() -> void:
	# abrir inventario 
	fechar_inventario()
	atualizar_inventario()
	atualizar_loja()

func atualizar_inventario() -> void:
	# inciar o preenchimento do inventario
	$Panel/TabContainer/Inventario/ItemListInventario.clear()
	for item in Global.inventario:
		var item_inventario = Global.inventario[item]
		var quantidade = item_inventario.quantidade
		var imagem = item_inventario.icone
		var item_texto = "%s (%d)" % ["quantidade", quantidade]
		$Panel/TabContainer/Inventario/ItemListInventario.add_item(item_texto, imagem)
		
func atualizar_loja() -> void:
	# inciar o preenchimento da loja
	$Panel/TabContainer/Loja/ItemListLoja.clear()
	for item in Global.loja:
		var item_loja = Global.loja[item]
		var preco = item_loja.preço
		var imagem = item_loja.icone
		var item_texto = "%s (%d)" % ["preço", preco]
		$Panel/TabContainer/Loja/ItemListLoja.add_item(item_texto, imagem)

func abrir_inventario() -> void:
	show()

func fechar_inventario() -> void:
	hide()

func _on_quit_button_pressed() -> void:
	fechar_inventario()

func comprar_item(index_item : String) -> void:
	if index_item in Global.loja:
		var item_disponivel = Global.loja[index_item]
		if Global.money_actual >= item_disponivel.preço:
			Global.gasto(item_disponivel.preço)
			Global.inventario[index_item].quantidade += 1
			atualizar_inventario()
			atualizar_loja()

func _on_item_list_loja_item_selected(index: int) -> void:
	if index == 0:
		comprar_item("bombom_1")
	elif index == 1:
		comprar_item("bombom_2")
		player.update_level()
	elif index == 2:
		comprar_item("bombom_3")
		player.update_level()
	elif index == 3:
		comprar_item("bombom_4")
		player.update_level()

func _process(delta: float) -> void:
	atualizar_inventario()
