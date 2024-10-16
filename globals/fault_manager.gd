extends Node

var faults: Array[Fault] = []
@onready var fault_timer: Timer = $FaultTimer
@export var manual : Manual
@onready var progress_bar: ProgressBar = $"../ProgressBar"

func _on_game_started():
	fault_timer.start()
	
func _ready() -> void:
	GameManager.game_started.connect(_on_game_started)
	
	var faultables := get_tree().get_nodes_in_group("faultable") as Array[Faultable]
	var indicators := get_tree().get_nodes_in_group("indicator") as Array[Indicator]
	var actions := get_tree().get_nodes_in_group("actionable") as Array[Actionable]
	
	for actionable in actions:
		actionable.action.connect(_on_action)

	for faultable in faultables:
		var indicator = indicators.pick_random()
		var fault = Fault.new()
		fault.indicators.append(indicator)
		fault.faulting_node = faultable
		fault.action_value = _find_action_value()
		faults.append(fault)

	manual.set_instructions(get_manual())

func _on_trigger() -> void:
	var f := faults.pick_random() as Fault
	if !f.is_faulting:
		f.trigger()

func _on_action(action: String) -> void:
	for fault: Fault in faults.filter(func (a): return a.is_faulting):
		if fault.action_value == action and fault.is_resolved():
			fault.resolve()

func _find_action_value() -> String:
	var actionables := get_tree().get_nodes_in_group("actionable")
	var a := actionables.pick_random() as Actionable
	return a.get_action_value()

func get_manual() -> String:
	return "\n\n".join(faults.map(func (c): return c.get_manual()))


func _on_fault_check_timer_timeout() -> void:
	var faulting := faults.filter(func (a): return a.is_faulting).size()
	progress_bar.value += faulting / 2
