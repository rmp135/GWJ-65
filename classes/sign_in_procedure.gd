extends Node
class_name SignInProcedure

var action_value : String
var indicator: Indicator

func resolve() -> void:
	GameManager.game_started.emit()

func is_resolved() -> bool:
	return indicator.get_current_value() == indicator.get_random_value()

func get_manual() -> String:
	var lines: Array[String] = []
	lines.append("Sign In Procedure:")
	lines.append(indicator.get_manual_text())
	lines.append("Press key: {0}".format([action_value]))
	return "\n".join(lines)
