extends Control

func _ready() -> void:
	$Background/Container/MenuContainer/StartGameBtn.grab_focus()

func _on_StartGameBtn_pressed() -> void:
	$BlackOverlayAnim.play("BlackOverlay")
	$MenuClickSFX.play()
	
	yield(get_tree().create_timer(0.35), "timeout")
	get_tree().change_scene("res://src/Screens/Levels/Level1.tscn")

func _on_ExitBtn_pressed() -> void:
	$MenuClickSFX.play()
	
	yield(get_tree().create_timer(1), "timeout")
	
	get_tree().quit()

