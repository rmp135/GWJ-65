extends Button

func _on_pressed() -> void:
	GameManager.game_started.emit()
