extends Node
class_name FaultManager

var faults: Array[Fault] = []

@onready var fault_timer: Timer = $FaultTimer

func _on_game_started():
	fault_timer.start()
	
func _ready() -> void:
	GameManager.game_started.connect(_on_game_started)
	
	var faultables = get_tree().get_nodes_in_group("faultable") as Array[Faultable]
	var indicators = get_tree().get_nodes_in_group("indicator") as Array[Indicator]
	var actions = get_tree().get_nodes_in_group("actionable") as Array[Actionable]
	
	for actionable in actions:
		actionable.connect("action", _on_action)

	for faultable in faultables:
		var fault = Fault.new()
		fault.faulting_node = faultable
		fault.indicator_node = indicators.pick_random()
		fault.indicator_value = fault.indicator_node.get_random_value()
		fault.action_node = actions.filter(func(a): return a.get_current_value() != fault.indicator_value).pick_random()
		fault.action_value = fault.action_node.get_random_value()
		faults.append(fault)

func _on_fault_timeout() -> void:
	if GameManager.game_state == GameManager.GameState.SHIFT_OVER: 
		fault_timer.stop()
		return
	var new_faulting = faults.filter(func(f): return !f.is_faulting).pick_random() as Fault
	new_faulting.trigger()
	var number_of_faulting = _get_faulting_faults().size()
	fault_timer.start((3 * (number_of_faulting + 1) as float) * randf_range(0.75, 1.25))

func _on_action(action: String) -> void:
	for fault: Fault in _get_faulting_faults():
		if fault.action_value == action and fault.is_resolved():
			fault.resolve()
	if _get_faulting_faults().is_empty() and GameManager.game_state == GameManager.GameState.SHIFT_OVER: 
		GameManager.complete_game()
		
func _get_faulting_faults() -> Array[Fault]:
	return faults.filter(func (a): return a.is_faulting)

func get_manual() -> String:
	var manual_lines = faults.map(func (c): return c.get_manual())
	return "\n\n".join(manual_lines)

func _on_fault_check_timer_timeout() -> void:
	var faulting = _get_faulting_faults().size() as float
	GameManager.capacitor_value += faulting as float / 2
