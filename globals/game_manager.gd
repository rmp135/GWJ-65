extends Node

signal game_started

var is_game_started := false
var seed := 0

func start_game():
	is_game_started = true
	game_started.emit()
