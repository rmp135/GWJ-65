extends Node2D

@export var is_faulting = false
@export_range(0, 100, 1) var value: int

@onready var color_rect: ColorRect = $ColorRect
@onready var led = $LED
@onready var label: Label = $Label
@onready var timer: Timer = $Timer

var text = "F22"
var target: float

var instrument_name : String:
	get: return "Gauge {0}".format([text])

func _ready() -> void:
	var letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
				   "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
				   "U", "V", "W", "X", "Y", "Z"]
	var numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
	# a letter and 2 numbers
	text = letters[randi() % letters.size()] + numbers[randi() % numbers.size()] + numbers[randi() % numbers.size()]
	label.text = text

func _process(delta: float) -> void:
	color_rect.rotation_degrees = lerpf(color_rect.rotation_degrees, target, delta)
	led.flashing = is_faulting

func _on_timer_timeout() -> void:
	if is_faulting:
		target = randf_range(maxf(-35, target - 10), minf(-5, target + 10))
	else:
		target = randf_range(maxf(-160, target - 10), minf(-35, target + 10))

func fault() -> void:
	target = 35
	is_faulting = true

func resolve() -> void:
	timer.start()
	target = -130
	is_faulting = false

