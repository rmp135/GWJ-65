extends Node

var faults: Array[Fault] = []
@onready var fault_timer: Timer = $FaultTimer
@export var manual : Manual

func _ready() -> void:
	var faultables = get_tree().get_nodes_in_group("faultable")
	var indicators = get_tree().get_nodes_in_group("indicator") as Array[Indicator]
	var actions = get_tree().get_nodes_in_group("actionable")
	for actionable in actions:
		actionable.connect("action", _on_action)

	for faultable in faultables:
		var s = indicators.pick_random()
		var fault = Fault.new()
		fault.indicators.append(s)
		fault.faulting_node = faultable
		fault.action_value = _find_action_value()
		faults.append(fault)

	manual.set_instructions(get_manual())

func _on_trigger() -> void:
	var f = faults.pick_random() as Fault
	if !f.is_faulting:
		f.trigger()

func _on_action(action: String) -> void:
	for fault: Fault in faults.filter(func (a): return a.is_faulting):
		if fault.action_value == action and fault.is_resolved():
			fault.resolve()

func _find_action_value() -> String:
	var actionables = get_tree().get_nodes_in_group("actionable")
	var a = actionables.pick_random()
	if a.has_method("get_action_value"):
		return a.get_action_value()
	return ""

func get_manual() -> String:
	return "\n\n".join(faults.map(func (c): return c.get_manual()))
