extends CanvasLayer

func _ready() -> void:
	# A cena se inicia invisivel ate o usuario apertar 'esc'
	visible = false

func _unhandled_input(event: InputEvent) -> void:
	# 'ui_cancel' -> esc do telclado
	if event.is_action_pressed("ui_cancel"):
		# Se apertar 'esc' a tela de pause aparece
		visible = true
		get_tree().paused = true

func _process(delta: float) -> void:
	# Funcao responsavel por fazer com que o tempo restante do timer va para a label -> texto
	$Countdown.text = str(int($Timer.time_left))

func _on_resume_button_pressed() -> void:
	# Se o botao de voltar ao jogo for apertado deixa so o timer na tela:
	# para a bola e inicia o tempo
	$overlay.visible = false
	$ColorRect.visible = false
	$menu_holder.visible = false
	$Countdown.visible = true
	# Desliga o timer de quando a bola sai dos limites da tela -> Tava tendo
	# conflito dos timers juntos
	$"../Countdown".visible = false
	$"../CountdownTimer".stop()
	get_tree().call_group('BallGroup','stop_ball')
	$Timer.start()

func _on_quit_button_pressed() -> void:
	# Corrigir -> tem que voltar para a tela de inicio
	# No momento o botao de voltar a tela inicial sai do jogo
	get_tree().quit()

func _on_timer_timeout() -> void:
	# Quando o timer acaba, tira toda a cena da tela e despausa o jogo
	get_tree().call_group('BallGroup','put_back_in_motion')
	get_tree().paused = false
	visible = false
	$overlay.visible = true
	$ColorRect.visible = true
	$menu_holder.visible = true
	$Countdown.visible = false
