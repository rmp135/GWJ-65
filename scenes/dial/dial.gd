extends Node2D
class_name Dial

@onready var dial_line: Sprite2D = $DialLine
@onready var label_6: Label = $Label6

@export var click_sounds : Array[AudioStreamWAV] = []

var text: String = "D123"

# between 0 and 4
var index := randi_range(0,4)

func _ready() -> void:
	text  = NameGenerator.get_name_string()
	label_6.text = text

var value: String:
	get: return str(index)

func _on_texture_button_pressed() -> void:
	index += 1
	if index > 4:
		index = 0
	var player = AudioStreamPlayer.new()
	player.stream = click_sounds.pick_random()
	player.bus = "Effects"
	add_child(player)
	player.play()
	await player.finished
	remove_child(player)
	
	
func _process(delta: float) -> void:
	dial_line.rotation_degrees = index * 45 - 90
	
