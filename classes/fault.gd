class_name Fault

var faulting_node : Faultable
var indicator_node: Indicator
var action_node : Actionable

var indicator_value : String
var action_value : String

var is_faulting := false

func trigger() -> void:
	is_faulting = true
	faulting_node.fault()

func resolve() -> void:
	is_faulting = false
	GameManager.alarms_reset += 1
	faulting_node.resolve()

func is_resolved() -> bool:
	return indicator_node.get_current_value() == indicator_value

func get_manual() -> String:
	var lines: Array[String] = []
	lines.append(faulting_node.get_label())
	lines.append(indicator_node.get_manual_text(indicator_value))
	lines.append(action_node.get_manual_text(action_value))
	return "\n".join(lines)
