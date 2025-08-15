extends Node
func _process(delta):
	if get_child_count() == 0:
		queue_free()
