extends Node2D

func _ready() -> void:
	$AnimationPlayer.play("Explode")

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	queue_free()
