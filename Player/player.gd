extends CharacterBody2D

const SPEED := 800.0

@onready var animation := $AnimatedSprite2D as AnimatedSprite2D

# Funcao que retorna a direcao vertical com base nas teclas pressionadas
func getYDir() -> float:
	return Input.get_action_strength("down") - Input.get_action_strength("up")

func _physics_process(delta: float) -> void:
	# Cria um vetor de direcao com base na entrada do jogador somente no eixo y
	var dir :Vector2=Vector2(0, getYDir())
	# Define a velocidade multiplicando a direcao pela constante SPEED
	velocity = dir * SPEED
	# Move o personagem de acordo com a velocidade calculada
	move_and_slide()
	
	# Quando esta parado -> toca animacao 'idle'
	# Quando nao esta parado -> toca animacao 'walking'
	if dir == Vector2.ZERO:
		animation.play("idle")
	else:
		animation.play("walking")
	
	
