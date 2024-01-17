@tool
extends Node2D
class_name HeatIndicator

@onready var loading_led: LoadingLED = %LoadingLED

var value := 0

func _ready() -> void:
	for i in 15:
		var n = loading_led.duplicate() as Node2D
		add_child(n)
		n.position = Vector2(n.position.x, n.position.y - 20 * i)

func _process(delta: float) -> void:
	var cs = get_children()
	for i in value / 100 * cs.size():
		cs[i].set_on()
