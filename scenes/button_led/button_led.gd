extends Node2D
class_name ButtonLED

@onready var red_led: Sprite2D = $Offset/RedLED
@onready var blue_led: Sprite2D = $Offset/BlueLED
@onready var label = %Label
@onready var timer: Timer = $Timer
@onready var offset: Node2D = $Offset
@onready var actionable: Node = $Actionable
@onready var click_player = %ClickPlayer


@export var enabled := false

var text: String :
	get: return label.text
	set(value): label.text = value

func _process(_delta):
	blue_led.visible = !enabled
	red_led.visible = enabled

func _ready():
	text = NameGenerator.get_name_string()
	label.text = text
	enabled = randi_range(0, 1) == 0
	timer.wait_time = randf_range(5, 30)
	timer.start()

func _on_timer_timeout() -> void:
	enabled = !enabled
	timer.wait_time = randf_range(5, 30)
	timer.start()

func _on_texture_button_pressed() -> void:
	enabled = !enabled
	actionable.action.emit(text)

func _on_texture_button_2_button_down() -> void:
	offset.position.y += 5

func _on_texture_button_2_button_up() -> void:
	# if clicked by user, delay swapping for a higher inteval
	timer.wait_time = randf_range(30, 60)
	timer.start()
	offset.position.y -= 5


