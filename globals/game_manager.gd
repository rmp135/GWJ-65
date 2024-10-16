extends Node

enum GameState { WAITING, STARTED, OVER, SHIFT_OVER, COMPLETE }

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
	await get_tree().create_timer(240, false).timeout
	game_state = GameState.SHIFT_OVER
	shift_over.emit()

func end_game():
	game_state = GameState.OVER
	game_over.emit()

func complete_game():
	game_state = GameState.COMPLETE
	game_complete.emit()
