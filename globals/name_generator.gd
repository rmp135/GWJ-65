extends Node

var used_names: Array[String] = []

func get_name_string() -> String:
	var new_name: String
	while true:
		var a := randi_range(0,9) + 65
		var b := randi_range(9, 18) + 65
		var c := randi_range(18, 25) + 65
		new_name = "{0}{1}{2}".format([char(a), char(b), char(c)])
		if !used_names.has(new_name):
			break;
	used_names.append(new_name)
	return new_name
