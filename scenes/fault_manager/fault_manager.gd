extends Node

var faults: Array[Fault] = []
@onready var fault_timer: Timer = $FaultTimer
@export var manual : Manual
@onready var heat_indicator: HeatIndicator = $"../HeatIndicator"

var sign_in_proc : SignInProcedure

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
		var s = indicators.pick_random()
		var fault = Fault.new()
		fault.indicators.append(s)
		fault.faulting_node = faultable
		fault.action_value = _find_action_value()
		faults.append(fault)
		
	sign_in_proc = SignInProcedure.new()
	sign_in_proc.action_value = _find_action_value()
	sign_in_proc.indicator = indicators.pick_random()

	manual.set_instructions(get_manual())

func _on_fault_timeout() -> void:
	var f = faults.filter(func(f): return !f.is_faulting).pick_random() as Fault
	f.trigger()
	var number_of_faulting = faults.filter(func(f): return f.is_faulting).size()
	print(number_of_faulting)
	fault_timer.start(3 * (number_of_faulting + 1))

func _on_action(action: String) -> void:
	if !GameManager.is_game_started and sign_in_proc.action_value == action and sign_in_proc.is_resolved():
		GameManager.start_game()
	for fault: Fault in faults.filter(func (a): return a.is_faulting):
		if fault.action_value == action and fault.is_resolved():
			fault.resolve()
			var number_of_faulting = faults.filter(func(f): return f.is_faulting).size()
			print(number_of_faulting)
			

func _find_action_value() -> String:
	var actionables = get_tree().get_nodes_in_group("actionable")
	var a = actionables.pick_random() as Actionable
	return a.get_action_value()

func get_manual() -> String:
	var manual_lines = faults.map(func (c): return c.get_manual())
	manual_lines.append(sign_in_proc.get_manual())
	return "\n\n".join(manual_lines)

func _on_fault_check_timer_timeout() -> void:
	var faulting = faults.filter(func (a): return a.is_faulting).size() as float
	heat_indicator.value += faulting / 2
