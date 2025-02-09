extends Control


func _ready() -> void:
	pass # Replace with function body.



func _process(delta: float) -> void:
	pass
#Faz com que os butoes de novo jogo começe o jogo na cena level
func _on_novo_jogo_pressed() -> void:
	get_tree().change_scene_to_file("res://Level/level.tscn")
#Faz com que saia do jogo
func _on_sair_pressed() -> void:
	get_tree().quit()
