extends Node2D

@export var is_faulting := false
@export_range(0, 100, 1) var value : int

@onready var color_rect: ColorRect = $ColorRect
@onready var led = $LED
@onready var label: Label = $Label
@onready var timer: Timer = $Timer
@onready var sprite_2d_2: Sprite2D = $Sprite2D2

# Disabled before the user begins a shift
var is_enabled := false

var text := ""
var target: float

func _ready() -> void:
	color_rect.rotation_degrees = -180
	sprite_2d_2.modulate = Color(0.6, 0.6, 0.6)
	GameManager.game_started.connect(_on_game_started)
	text = NameGenerator.get_name_string()
	label.text = text

func _on_game_started():
	target = randf_range(-160, -110)
	sprite_2d_2.modulate = Color(1, 1, 1)
	is_enabled = true

func _process(delta: float) -> void:
	if is_enabled:
		color_rect.rotation_degrees = lerpf(color_rect.rotation_degrees, target, delta)
		led.flashing = is_faulting

func _on_timer_timeout() -> void:
	if is_faulting:
		target = randf_range(maxf(-35, target - 10), minf(-5, target + 10))
	else:
		target = randf_range(maxf(-160, target - 10), minf(-35, target + 10))
