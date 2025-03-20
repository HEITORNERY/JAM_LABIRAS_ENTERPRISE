extends Node

# armazenar o dinheiro do player
var money_actual : int = 0

# dinheiro para aumentar pro nível 2
var update_2 : int = 15
# dinheiro para aumentar pro nível 3
var update_3 : int = 30
# dinheiro para aumentar pro nível 4
var update_4 : int = 60
# dinheiro para avançar para fase 2
var next_fase_1 : int = 100
 
var inventario : Dictionary = {
	"bombom_1" : {"quantidade": 10, "icone" : preload("res://items/bombom_1.png")},
	"bombom_2" : {"quantidade": 0, "icone" : preload("res://items/bombom_2.png")},
	"bombom_3" : {"quantidade": 0, "icone" : preload("res://items/bombom_3.png")},
	"bombom_4" : {"quantidade": 0, "icone" : preload("res://items/bombom_4.png")},
}

var loja : Dictionary = {
	"bombom_1" : {"preço" : 6, "icone" : preload("res://items/bombom_1.png")},
	"bombom_2" : {"preço" : update_2, "icone" : preload("res://items/bombom_2.png")},
	"bombom_3" : {"preço" : update_3, "icone" : preload("res://items/bombom_3.png")},
	"bombom_4" : {"preço" : update_4, "icone" : preload("res://items/bombom_4.png")},
	"proxima_fase" : {"preço" : next_fase_1, "icone" : preload("res://Sci-Fi Game Icons/black.png")}
}

# função para incrementar o valor do dinheiro
func venda_feita(preco : int) -> void:
	money_actual += preco

# função para decrementar o valor do dinheiro
func gasto(valor : int) -> void:
	money_actual -= valor
