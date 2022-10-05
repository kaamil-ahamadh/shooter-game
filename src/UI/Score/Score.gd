extends CanvasLayer

func _ready() -> void:
	PlayerData.connect("score_updated",self,"update_score_label")
	update_score_label()

func update_score_label() -> void:
	$Control/ScoreLabel.text = "Score: " + str(PlayerData.score)
