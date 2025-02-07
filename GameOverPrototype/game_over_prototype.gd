extends Control

func _on_restart_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Level/level.tscn")

func _on_back_to_title_screen_button_pressed() -> void:
	get_tree().quit()

func _process(delta: float) -> void:
	$VBoxContainer/Player_Points.text = 'Sua pontuação foi: ' + str(Global.player_points) + ' pontos'
