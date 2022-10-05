extends KinematicBody2D

export var speed : = 250.0
var motion = Vector2.ZERO
var velocity = Vector2.ZERO

func _physics_process(delta: float) -> void:
	
	motion.y = 1
	velocity = motion * speed * delta

	# If Collision Detected
	var collision = move_and_collide(velocity)
	if collision:
		on_collision(collision.collider)
		

func on_collision(collider : KinematicBody2D) -> void:
	if collider.name == "Player":
		queue_free()
		collider.damage_player()


func destroy_enemy() -> void:
	queue_free()

func _on_VisibilityNotifier2D_screen_exited() -> void:
	destroy_enemy()


func _on_Enemy_body_entered(body: Node) -> void:
	queue_free()
