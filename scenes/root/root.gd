extends Node2D

@onready var pause_overlay: Control = %PauseOverlay
@onready var startup_player: AudioStreamPlayer = %StartupPlayer
@onready var overlays: Node = %Overlays
@onready var fade_in_overlay: FadeIn = $FadeInOverlay

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.game_started.connect(_on_game_started)
	GameManager.capacitor_value = 0
	GameManager.game_state = GameManager.GameState.WAITING
	GameManager.alarms_reset = 0
	fade_in_overlay.fade_in()
	for overlay in overlays.get_children():
		overlay.hide()
	
func _on_game_started():
	startup_player.play()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		get_tree().paused = true
		get_viewport().set_input_as_handled()
		pause_overlay.show()
