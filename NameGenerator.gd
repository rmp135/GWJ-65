extends Node

const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
const numbers = '0123456789'

var used_names: Array[String] = []

func _get_first_letters() -> Array[String]:
	return letters.split("").slice(0, 9)
	
func _get_mid_letters() -> Array[String]:
	return letters.split("").slice(9, 18)
	
func _get_last_letters() -> Array[String]:
	return letters.split("").slice(18, 26)

func get_name_string() -> String:
	var name: String
	while true:
		name = "{0}{1}{2}".format([letters[randi()% len(letters)],letters[randi()% len(letters)],letters[randi()% len(letters)]])
		if !used_names.has(name):
			break;
	used_names.append(name)
	return name
