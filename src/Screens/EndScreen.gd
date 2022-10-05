extends Control

func _ready() -> void:
	$Container/MenuContainer/RetryBtn.grab_focus()
	$Container/MenuContainer/ScoreLabel.text = "Your Final Score is: " + str(PlayerData.score)

func _on_RetryBtn_pressed() -> void:
	get_tree().change_scene("res://src/Screens/Levels/Level1.tscn")
	PlayerData.score = 0

func _on_MainMenuBtn_pressed() -> void:
	get_tree().change_scene("res://src/Screens/MainScreen.tscn")
