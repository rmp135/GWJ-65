extends Control

@onready var pause_overlay: Control = %PauseOverlay
@onready var startup_player: AudioStreamPlayer = %StartupPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.game_started.connect(_on_game_started)
	pause_overlay.hide()
	
func _on_game_started():
	startup_player.play()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		get_tree().paused = true
		get_viewport().set_input_as_handled()
		pause_overlay.show()
