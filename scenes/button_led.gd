extends Node2D
class_name ButtonLED

signal action

@onready var red_led: Sprite2D = $Offset/RedLED
@onready var blue_led: Sprite2D = $Offset/BlueLED
@onready var label_2 = $Offset/Label2
@onready var timer: Timer = $Timer
@onready var offset: Node2D = $Offset

@export var enabled: bool

var text: String

var consanonts = ['B','C','D','F']
var vowels = ['A','E','I','O','U']

func _process(delta):
	blue_led.visible = !enabled
	red_led.visible = enabled
			
func _ready():
	text = consanonts.pick_random() + vowels.pick_random() + consanonts.pick_random()
	label_2.text = text
	enabled = randi_range(0, 1) == 0
	timer.wait_time = randf_range(5, 30)
	timer.start()

func _on_timer_timeout() -> void:
	enabled = !enabled
	timer.wait_time = randf_range(5, 30)
	timer.start()

func _on_texture_button_pressed() -> void:
	enabled = !enabled
	action.emit(text)

func _on_texture_button_2_button_down() -> void:
	offset.position.y += 5

func _on_texture_button_2_button_up() -> void:
	# if clicked by user, delay swapping for a higher inteval
	timer.wait_time = randf_range(30, 60)
	timer.start()
	offset.position.y -= 5

func get_action_value() -> String:
	return text
