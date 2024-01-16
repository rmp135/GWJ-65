class_name Fault

var faulting_node : Faultable
var action_value : String
var is_faulting := false
var indicators: Array[Indicator]

func trigger() -> void:
	is_faulting = true
	if faulting_node.has_method("fault"):
		faulting_node.fault()

func resolve() -> void:
	is_faulting = false
	if faulting_node.has_method("resolve"):
		faulting_node.resolve()

func is_resolved() -> bool:
	return indicators.map(func (b): return b.get_current_value() == b.get_random_value()).reduce(func (b, a): return a && b)

func get_manual() -> String:
	var lines: Array[String] = []
	lines.append(faulting_node.get_label())
	for i in indicators:
		lines.append(i.get_manual_text())
	lines.append("Press key: {0}".format([action_value]))
	return "\n".join(lines)
