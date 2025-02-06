extends Node 

var player_score = 0
var life = 3

func _on_left_body_entered(body: Node2D) -> void:
	$Ball.position = Vector2(640, 360)
	life -= 1

func _on_right_body_entered(body: Node2D) -> void:
	$Ball.position = Vector2(640, 360)
	life -= 1
