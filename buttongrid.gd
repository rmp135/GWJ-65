extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var children = get_children()
	var names: Array[String] = []
	for child : ButtonLED in children:
		child.set_name_string(NameGenerator.get_name_string())
		#names.append(NameGenerator.get_name_string())
	children.sort()
	for i in children.size():
		print(i % 3 * i / 3)

	#	children[i].set_name_string(names[i + i % 3])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
