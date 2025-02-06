extends CharacterBody2D

# Constante que define a velocidade do objeto
const SPEED := 15.0

func _ready():
	# Inicia o trajeto da bola jogando em uma direcao aleatoria
	velocity = Vector2(-SPEED, 0)
	randomize()
	velocity.x = [1,-1][randi() % 2]
	velocity.y = [-0.8, 0.8][randi() % 2]

# Contador para rastrear o numero de colisoes ocorridas 
# Vai ser melhor implementado depois
var collision_counter = 0
func _physics_process(delta):
	# Move o objeto e verifica se houve colisão
	var collision := move_and_collide(velocity * SPEED)
	if collision:
		collision_counter += 1
		# Obtem a normal da superficie com a qual colidiu
		var normal := collision.get_normal()
		# Calcula o novo vetor de velocidade, fazendo o objeto "quicar" na superfice
		velocity = velocity.bounce(normal)
