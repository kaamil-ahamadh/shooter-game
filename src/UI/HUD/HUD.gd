extends CanvasLayer

func _ready() -> void:
	$PauseOverlay.visible = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		toggle_pause()
		menu_click_play()
	
func toggle_pause() -> void:
		
	var new_pause_state = !get_tree().paused
	get_tree().paused = new_pause_state
	$PauseOverlay.visible = new_pause_state
	
	if new_pause_state:
		$PauseBtn.texture_normal = preload("res://assets/PNG/play_icon.png")
		$PauseOverlay/Container/MenuContainer/ResumeBtn.grab_focus()
	else:
		$PauseBtn.texture_normal = preload("res://assets/PNG/pause_icon.png")
		
func _on_ResumeBtn_pressed() -> void:
	toggle_pause()
	menu_click_play()

func _on_MainMenuBtn_pressed() -> void:
	menu_click_play()
	yield(get_tree().create_timer(0.35),"timeout")
	get_tree().change_scene("res://src/Screens/MainScreen.tscn")
	toggle_pause()

func _on_PauseBtn_pressed() -> void:
	toggle_pause()
	menu_click_play()
	
func menu_click_play() -> void:
	$MenuClickSFX.play()
	
