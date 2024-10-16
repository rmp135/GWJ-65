extends Node
class_name SignInManager

var action_node : Actionable
var indicator_node : Indicator

var indicator_value : String
var action_value : String

@export var manual : Manual

func _ready() -> void:
	var indicators = get_tree().get_nodes_in_group("indicator") as Array[Indicator]
	var actions = get_tree().get_nodes_in_group("actionable") as Array[Actionable]
	
	for actionable in actions:
		actionable.action.connect(_on_action)
	
	indicator_node = indicators.pick_random()
	indicator_value = indicator_node.get_random_value()
	
	action_node = actions.filter(func(f): return f.get_current_value() != indicator_value).pick_random()
	action_value = action_node.get_random_value()

func _on_action(action: String) -> void:
	if GameManager.game_state == GameManager.GameState.WAITING and action_value == action and indicator_node.get_current_value() == indicator_value:
		GameManager.start_game()

func get_manual() -> String:
	var lines: Array[String] = []
	lines.append("Sign In Procedure:")
	lines.append(indicator_node.get_manual_text(indicator_value))
	lines.append(action_node.get_manual_text(action_value))
	return "\n".join(lines)
