extends CharacterBody2D

const SPEED := 800.0

# Codigo quase identico ao script de 'player.gd'
# A unica diferenca seriam os inputs 'down2' -> setinha pra baixo
# e 'up2' -> setinha pra cima

func getYDir() -> float:
	return Input.get_action_strength("down2") - Input.get_action_strength("up2")

func _physics_process(delta: float) -> void:
	var dir :Vector2=Vector2(0, getYDir())
	velocity = dir * SPEED
	move_and_slide()
