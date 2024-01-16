extends Node2D

@onready var output: Label = $Output
@onready var actionable: Node = $Actionable

func _ready() -> void:
	var children : Array[Node] = get_children()
	for c in children.filter(func(c): return c.has_signal("press")):
		c.connect("press", _on__press)

func _on__press(value: String) -> void:
	if value == 'CLEAR':
		output.text = ""
	elif value == 'ENTER':
		actionable.action.emit(output.text)
		output.text = ""
		pass
	elif output.text.length() < 4:
		output.text += value
