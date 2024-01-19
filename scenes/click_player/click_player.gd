extends Node

@export var clicks : Array[ClickSound] = []
@onready var click_up_player = %ClickUpPlayer
@onready var click_down_player = %ClickDownPlayer

var current_click : ClickSound

# Called when the node enters the scene tree for the first time.
func _ready():
	_pick_new_sound()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if click_down_player.get_playback_position() > current_click.up_position:
		click_down_player.stop()

func _on_button_down():
	click_down_player.play()

func _on_button_up():
	click_up_player.play(current_click.up_position)

func _on_click_up_player_finished():
	_pick_new_sound()

func _pick_new_sound():
	current_click = clicks.pick_random()
	click_up_player.stream = current_click.sound
	click_down_player.stream = current_click.sound
	
