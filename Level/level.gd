extends Node 

# Variaveis para guardar informacoes
var player_score = 0
var life = 3
var game_started = false # Controla se o jogo ja comecou

func _ready():
	# Deixa o contador invisivel ate o jogo começar
	$Countdown.visible = false
	# Deixa a pontuacao invisivel ate o jogo comecar -> menos coisas na tela
	$Points.visible = false
	# Faz a bola parar enquanto o jogo nao começa
	get_tree().call_group('BallGroup', 'stop_ball')
	# Mensagem para pressionar espaço
	$Press_Start.text = 'Pressione ESPAÇO para começar!'

func start_game_timer():
	# Faz a bola parar
	get_tree().call_group('BallGroup','stop_ball')
	# Define a posicao de inicio da bola no meio da tela
	$Ball.position = Vector2(960, 540)
	# Inicia o timer e quando ele termina chama '_on_right_body_entered'
	$CountdownTimer.start()
	# Mostra o timer
	$Countdown.visible = true

# Funcao e chamada quando a bola colide com o limite esquerdo da tela
func _on_left_body_entered(body: Node2D) -> void:
	# Chama a funcao 'ball_outofbounds'
	ball_outofbounds()

# Mesma coisa so que para a direita
func _on_right_body_entered(body: Node2D) -> void:
	ball_outofbounds()

func _process(delta):
	# Verifica se o jogo ainda nao começou e se o espaço foi pressionado
	if not game_started and Input.is_action_just_pressed('space'):
		# Apertando espaco o jogo comeca
		game_started = true
		# Tira o texto de apertar o espaco da tela
		$Press_Start.visible = false
		start_game_timer()
	
	# Texto mostrando a vida
	$Life.text = 'Vidas restantes: ' + str(life)
	# Texto do timer
	$Countdown.text = str(int($CountdownTimer.time_left))
	# Texto de pontuacao
	$Points.text = str($Ball.collision_counter)
	# Se a variavel life chegar em 0 manda pra tela de game over
	if life == 0:
		Global.player_points = $Ball.collision_counter
		get_tree().change_scene_to_file("res://GameOverPrototype/game_over_prototype.tscn")

func _on_countdown_timer_timeout() -> void:
	get_tree().call_group('BallGroup','restart_ball')
	# Tira o timer da tela quando o tempo termina
	$Countdown.visible = false
	# Deixa a pontuacao visivel
	$Points.visible = true

func ball_outofbounds():
	# Reseta posicao da bola para o centro da tela
	$Ball.position = Vector2(960, 540)
	# Chama o grupo 'BallGroup' e chama o metodo 'stop_ball'
	get_tree().call_group('BallGroup','stop_ball')
	# Inicia o timer que chama a funcao '_on_countdown_timer_timeout'
	$CountdownTimer.start()
	# Deixa o timer visivel novamente
	$Countdown.visible = true
	# Reduz uma vida
	life -= 1
