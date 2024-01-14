extends Node2D

@onready var color_rect: ColorRect = $ColorRect
@onready var led = $LED

@export var is_faulting = false

var target: float
@export_range(0, 100, 1) var value: int

#func _ready() -> void:
	#update_rect()

func _process(delta: float) -> void:
	color_rect.rotation_degrees = lerpf(color_rect.rotation_degrees, target, delta)
	led.flashing = is_faulting

#func update_rect() -> void:
	#color_rect.rotation_degrees = lerp(-180, 0, value as float/100)

func _on_timer_timeout() -> void:
	if is_faulting:
		#if color_rect.rotation_degrees < -35:
			##target = -30
		target = randf_range(maxf(-35, color_rect.rotation_degrees - 10), minf(-5, color_rect.rotation_degrees + 10))
	else:
		target = randf_range(maxf(-160, color_rect.rotation_degrees - 10), minf(-35, color_rect.rotation_degrees + 10))
	#value = randi_range(10, 80)
	#update_rect()
