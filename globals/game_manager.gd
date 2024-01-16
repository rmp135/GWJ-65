extends Node

signal game_started

var is_game_started := false

func _ready() -> void:
	game_started.connect(_on_game_started)
	
func _on_game_started():
	is_game_started = true
