extends CanvasLayer

onready var healthbar_over = $HealthbarOver
onready var healthbar_under = $HealthbarUnder

func _ready() -> void:
	set_hp_label_value()
	
	
func set_hp_value(value: float) -> void:
	healthbar_over.value = value
	var tween : = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	
	tween.tween_property(healthbar_under, "value", value, 1)

func set_hp_max_value(value: float) -> void:
	healthbar_over.max_value = value

func set_hp_label_value() -> void:
	$HPLabel.text = str(healthbar_over.value) + "/300 HP"
	

func _on_Healthbar_value_changed(value: float) -> void:
	set_hp_label_value()
