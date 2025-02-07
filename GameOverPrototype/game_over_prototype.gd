extends Control

func _on_restart_button_pressed() -> void:
	# Botao de reiniciar -> leva novamente para a tela de jogo
	get_tree().change_scene_to_file("res://Level/level.tscn")

func _on_back_to_title_screen_button_pressed() -> void:
	# Botao de voltar para a tela inicial -> atualmente quita do jogo
	# Corrigir
	get_tree().quit()

func _process(delta: float) -> void:
	# Mostra a pontuacao do jogador armazenada na variavel global 'player_points'
	$VBoxContainer/Player_Points.text = 'Sua pontuação foi: ' + str(Global.player_points) + ' pontos'
