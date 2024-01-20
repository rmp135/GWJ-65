extends Node

enum GameState { WAITING, STARTED, OVER, SHIFT_OVER, COMPLETE }

signal shift_started

signal game_started
signal game_over

signal shift_over
signal game_complete

var game_state : GameState = GameState.WAITING

var game_seed := 0
var alarms_reset := 0
var capacitor_value := 0.0

func start_game():
	game_state = GameState.STARTED
	game_started.emit()
	# 4 minutes
	get_tree().create_timer(10, false).timeout.connect(_on_shift_over)

func _on_shift_over():
	game_state = GameState.SHIFT_OVER
	shift_over.emit()

func being_shift():
	game_state = GameState.WAITING
	shift_started.emit()

func end_game():
	game_state = GameState.OVER
	game_over.emit()

func complete_game():
	game_state = GameState.COMPLETE
	game_complete.emit()
