extends Node


# Player Health
var hp : = 300.0

func damage_player() -> void:
	hp -= 100
	
	$HP.set_hp_value(hp)
	
	if hp <= 0:
		$Player.explode_player()
		$Explotion_SFX.play()
		
		yield(get_tree().create_timer(0.8),"timeout")
		queue_free()
		get_tree().change_scene("res://src/Screens/EndScreen.tscn")

func damage_enemy(position : Vector2) -> void:
	$Player.explode_enemy(position)
	$Explotion_SFX.play()
