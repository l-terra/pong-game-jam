extends CharacterBody2D

const SPEED := 800.0

func getYDir() -> float:
	return Input.get_action_strength("down2") - Input.get_action_strength("up2")

func _physics_process(delta: float) -> void:
	var dir :Vector2=Vector2(0, getYDir())
	velocity = dir * SPEED
	move_and_slide()
