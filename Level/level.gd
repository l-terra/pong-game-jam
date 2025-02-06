extends Node 

# Variaveis para guardas informacoes que serao usadas no futuro
# Ainda nao trabalhado
var player_score = 0
var life = 3

# Funcao e chamada quando a bola colide com o limite esquerdo da tela
func _on_left_body_entered(body: Node2D) -> void:
	# Reseta posicao da bola para o centro da tela
	$Ball.position = Vector2(960, 540)
	# Reduz uma vida
	# Nao funciona ainda
	life -= 1

# Mesma coisa so que para a direita
func _on_right_body_entered(body: Node2D) -> void:
	$Ball.position = Vector2(960, 540)
	life -= 1
