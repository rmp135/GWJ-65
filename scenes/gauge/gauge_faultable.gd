extends Faultable

@onready var gauge: Node2D = $".."
@onready var timer: Timer = $"../Timer"

func fault() -> void:
	gauge.target = 35
	gauge.is_faulting = true

func resolve() -> void:
	timer.start()
	gauge.target = randf_range(-160, -110)
	gauge.is_faulting = false

func get_label() -> String:
	return "Gauge {0}".format([gauge.text])
