extends Control

@onready var seed_label: Label = %SeedLabel
@onready var alarms_label: Label = %AlarmsLabel
@onready var capacitor_level: Label = %CapacitorLevel

func _ready() -> void:
	hide()
	GameManager.game_complete.connect(_on_game_complete)
	seed_label.text = "Seed: {0}".format([GameManager.game_seed])

func _on_game_complete():
	alarms_label.text = "Alarms reset: {0}".format([GameManager.alarms_reset])
	alarms_label.text = "Capacitor load: {0}%".format([GameManager.capacitor_value])
	show()
	get_tree().paused = true
		
func _on_quit_button_pressed() -> void:
	get_tree().quit()
