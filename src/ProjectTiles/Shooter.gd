extends Area2D

export var speed : = 700.0

var explotion_scene : PackedScene = preload("res://src/UI/Explosion/Explosion.tscn")

func _process(delta: float) -> void:
	apply_move(delta)

func apply_move(delta: float) -> void:
	position -= transform.y * speed * delta
	
func destroy_laser() -> void:
	queue_free()


func _on_VisibilityNotifier2D_screen_exited() -> void:
	destroy_laser()


func _on_Shooter_body_entered(body: Node) -> void:
	body.queue_free()
	destroy_laser()
	PlayerData.score += 10
	
	get_tree().call_group("gamestate", "damage_enemy",$ExplotionPosition.global_position)
