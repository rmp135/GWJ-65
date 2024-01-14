extends Node2D

@onready var sprite_red: AnimatedSprite2D = $SpriteRed
@onready var sprite_blue: AnimatedSprite2D = $SpriteBlue
@onready var label_2 = $Label2
@onready var timer: Timer = $Timer

@export var text: String

@export var enabled: bool

var consanonts = ['B','C','D','F']
var vowels = ['A','E','I','O','U']

func _process(delta):
	#label_2.label_settings.font_color = Color.BLACK if value else Color.WHITE
	sprite_blue.visible = !enabled
	sprite_red.visible = enabled
			
func _ready():
	label_2.text = consanonts.pick_random() + vowels.pick_random() + consanonts.pick_random()
	enabled = randi_range(0, 1) == 0
	timer.wait_time = randf_range(5, 30)
	timer.start()

func _on_timer_timeout() -> void:
	enabled = !enabled
	timer.wait_time = randf_range(5, 30)
	timer.start()

func _on_texture_button_pressed() -> void:
	enabled = !enabled

func _on_texture_button_2_button_down() -> void:
	label_2.position.y += 5
	sprite_red.frame = 1
	sprite_blue.frame = 1

func _on_texture_button_2_button_up() -> void:
	# if clicked by user, delay swapping for a higher inteval
	timer.wait_time = randf_range(30, 60)
	timer.start()
	label_2.position.y -= 5
	sprite_red.frame = 0
	sprite_blue.frame = 0
