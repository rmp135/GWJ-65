extends Node2D
class_name CapacitorLevel

@onready var loading_led: LoadingLED = %LoadingLED
@onready var label: Label = $Label
@onready var audio_stream_player: AudioStreamPlayer = %AudioStreamPlayer
@onready var alarm_timer: Timer = %AlarmTimer

var leds : Array[LoadingLED] = []

func _ready() -> void:
	leds.append(loading_led)
	for i in 14:
		var new_led = loading_led.duplicate() as Node2D
		add_child(new_led)
		leds.append(new_led)
		new_led.position = Vector2(new_led.position.x, new_led.position.y - 20 * (i + 1))

func _process(_delta: float) -> void:
	if GameManager.capacitor_value >= 100:
		GameManager.end_game()
		return
	label.text = str(GameManager.capacitor_value)
	if GameManager.capacitor_value == 0:
		return
	var leds_to_enable = floori(lerp(1, 16, GameManager.capacitor_value as float/100))
	for i in leds_to_enable:
		leds[i].set_on()

func _on_alarm_timer_timeout() -> void:
	audio_stream_player.play()
	alarm_timer.start(lerpf(2, 0.1, GameManager.capacitor_value as float / 100))
