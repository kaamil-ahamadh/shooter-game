extends KinematicBody2D
class_name Player

# Explotion
var explotion_scene : PackedScene = preload("res://src/UI/Explosion/Explosion.tscn")

# For Movement
export var speed : = 500.0
var motion : = Vector2.ZERO
var velocity : = Vector2.ZERO

# For Movement in Touchscreen
var touch_position : = Vector2.ZERO
var is_touched : = false

# Viewport
var viewport_size : = Vector2.ZERO
var viewport_player_offset : = 50

# For Shooting
var shooter_scene : PackedScene = preload("res://src/ProjectTiles/Shooter.tscn")

func _ready() -> void:
	viewport_size = get_viewport_rect().size

func _physics_process(delta: float) -> void:
	apply_move()
	
func apply_move() -> void:
	
	# Move Logic
	motion.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	motion.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	# Velocity
	velocity = motion * speed
	
	# Actual Move
	move_and_slide(velocity)
	
	# Limiting Move Position
	position.x = clamp(position.x, 0 + viewport_player_offset, viewport_size.x - viewport_player_offset)
	position.y = clamp(position.y, 0 + viewport_player_offset, viewport_size.y - viewport_player_offset)
	
	# Shoot
	if Input.is_action_just_pressed("shoot"):
		apply_shoot()
	
func apply_shoot() -> void:
	var shoot = shooter_scene.instance()
	owner.add_child(shoot)
	shoot.transform = $ShooterPosition.global_transform
	$Shoot_SFX.play()

# Touch Screen Movement
func _input(event: InputEvent) -> void:
	if is_touched:
		if event == InputEventScreenTouch && event.is_pressed():
			touch_position = event.position
			
		elif event is InputEventScreenDrag:
			touch_position = event.position
			set_position(Vector2(touch_position.x, touch_position.y))
			

func _on_TouchScreenBtn_pressed() -> void:
	is_touched = true


func _on_TouchScreenBtn_released() -> void:
	is_touched = false


func _on_Timer_timeout() -> void:
	if is_touched:
		apply_shoot()
		
func damage_player() -> void:
	$BlinkEffect.play("hit")
	$Pain_SFX.play()
	get_tree().call_group("gamestate","damage_player")

func explode_player() -> void:
	# Add Explotion Effect
	var explotion = explotion_scene.instance()
	add_child(explotion)
	explotion.position = $ShooterPosition.position

func explode_enemy(position : Vector2) -> void:
	var explotion = explotion_scene.instance()
	owner.add_child(explotion)
	explotion.global_position = position
