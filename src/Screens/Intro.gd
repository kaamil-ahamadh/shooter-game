extends Node

func _ready() -> void:
	$AnimationPlayer.play("FadeIn")
	yield(get_tree().create_timer(6), "timeout")
	$AnimationPlayer.play("FadeOut")
	yield(get_tree().create_timer(3), "timeout")
	get_tree().change_scene("res://src/Screens/MainScreen.tscn")

