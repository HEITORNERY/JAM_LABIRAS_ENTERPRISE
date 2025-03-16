extends Node

# armazenar o dinheiro do player
var money_actual : int = 0

# dinheiro para aumentar pro nível 2
var update_2 : int = 15
# dinheiro para aumentar pro nível 3
var update_3 : int = 30
# dinheiro para aumentar pro nível 4
var update_4 : int = 60
 
# função para incrementar o valor do dinheiro
func venda_feita(preco : int) -> void:
	money_actual += preco

# função para decrementar o valor do dinheiro
func gasto(valor : int) -> void:
	money_actual -= valor
