extends Node2D
class_name Manual

@export var fault_manager : FaultManager
@export var sign_in_manager : SignInManager
@export var flip_sounds : Array[AudioStreamWAV] = []

@onready var text_label: RichTextLabel = %RichTextLabel
@onready var previous_button: Button = %PreviousButton
@onready var next_button: Button = %NextButton
@onready var instructions_rect: NinePatchRect = %InstructionsRect
@onready var cover_rect: NinePatchRect = %CoverRect

var pages: Array[String] = []

var page := 0

func _ready() -> void:
	text_label.text += fault_manager.get_manual()
	text_label.text += "\n\n"
	text_label.text += sign_in_manager.get_manual()
	split_content_into_pages()
	previous_button.hide()
	cover_rect.show()
	instructions_rect.hide()

func _on_button_pressed() -> void:
	page = page + 1
	update_page()

func _on_previous_button_pressed() -> void:
	if page > 0:
		page -= 1
		update_page()

func split_content_into_pages():
	var temp_label := text_label.duplicate()
	temp_label.bbcode_enabled = true
	temp_label.size = text_label.size
	add_child(temp_label)

	var lines := text_label.text.split("\n")
	var current_page_content := ""

	for line in lines:
		temp_label.bbcode_text = current_page_content + line + "\n"
		if temp_label.get_content_height() > text_label.size.y:
			pages.append(current_page_content)
			current_page_content = line + "\n"
		else:
			current_page_content += line + "\n"

	if current_page_content:
		pages.append(current_page_content)

	remove_child(temp_label)
	temp_label.queue_free()

func update_page() -> void:
	cover_rect.visible = page == 0
	text_label.bbcode_text = pages[page]
	previous_button.visible = page != 0
	instructions_rect.visible = page != pages.size() - 1
	_play_flip()

func _play_flip():
	var audio_player : AudioStreamPlayer = AudioStreamPlayer.new()
	audio_player.bus = "Effects"
	audio_player.stream = flip_sounds.pick_random()
	add_child(audio_player)
	audio_player.play()
	await audio_player.finished
	remove_child(audio_player)
