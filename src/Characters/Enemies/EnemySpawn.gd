extends Node2D

var enemy_scene : PackedScene = preload("res://src/Characters/Enemies/Enemy.tscn")

onready var enemy_locations = $EnemyPath/EnemySpawnLocations

func _ready() -> void:
	randomize()
	
func _process(delta: float) -> void:
	pass
	
	
func enemy_spawn() -> void:
	enemy_locations.unit_offset = randf()
	
	var enemy = enemy_scene.instance()
	owner.add_child(enemy)
	enemy.transform = enemy_locations.global_transform


func _on_EnemyTimer_timeout() -> void:
	enemy_spawn()
