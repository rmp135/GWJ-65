class_name Faultable
extends Node

func _ready() -> void:
	add_to_group("faultable")

func get_label() -> String:
	return ""

func fault() -> void:
	pass
	
func resolve() -> void:
	pass
