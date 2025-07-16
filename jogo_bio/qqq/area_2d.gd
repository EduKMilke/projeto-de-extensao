extends Area2D

signal clicked 

var mouse= false

func _ready():
	
	connect("mouse_entered", _on_Hitbox_mouse_entered)
	connect("mouse_exited", _on_Hitbox_mouse_exited)

func _input_event(viewport, event, shape_idx):
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and mouse:
			get_tree().change_scene_to_file("res://qqq/corpo.tscn")
			emit_signal("clicked") 

func _on_Hitbox_mouse_entered():
	mouse = true
func _on_Hitbox_mouse_exited():
	mouse= false
