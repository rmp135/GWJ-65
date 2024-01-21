extends HBoxContainer

@onready var awaiting_sign_in_label: Label = %AwaitingSignInLabel
@onready var shift_label: Label = %ShiftLabel
@onready var awaiting_alarms_label: Label = %AwaitingAlarmsLabel
@onready var animation_player: AnimationPlayer = %AnimationPlayer

const color_off := Color(0.553, 0.612, 0.576)
const color_on := Color(0.89, 0.298, 0.231)

func _ready() -> void:
	GameManager.game_started.connect(_on_game_started)
	GameManager.shift_over.connect(_on_shift_over)
	awaiting_alarms_label.label_settings.font_color = color_off
	shift_label.label_settings.font_color = color_off

func _on_shift_over():
	awaiting_alarms_label.label_settings.font_color = color_on
	shift_label.label_settings.font_color = color_off
	
func _on_game_started():
	awaiting_sign_in_label.label_settings.font_color = color_off
	shift_label.label_settings.font_color = color_on
	animation_player.play("RESET")
