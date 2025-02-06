extends CharacterBody2D

const SPEED := 15.0

func _ready():
	velocity = Vector2(-SPEED, 0)
	randomize()
	velocity.x = [1,-1][randi() % 2]
	velocity.y = [-0.8, 0.8][randi() % 2]

var collision_counter = 0
func _physics_process(delta):
	var collision := move_and_collide(velocity * SPEED)
	if collision:
		collision_counter += 1
		var normal := collision.get_normal()
		velocity = velocity.bounce(normal)
