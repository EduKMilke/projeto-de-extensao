class_name carta extends Node2D

var vira:bool =false

@export var value:int
@onready var carta_v=$"c-back/escrita"
@onready var anim= $AnimationPlayer
signal flipped_up
signal flipped_down
func _redy():
	carta_v.text=str(value)

func virar():
	if !anim.is_playing():
		if vira:
			crt_d()
		else:
			crt_u()
func crt_d():
	anim.play("flip_down")
	vira=false
	flipped_up.emit()
func crt_u():
	anim.play("flip_up")
	vira=true
	flipped_down.emit()

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton\
	and event.button_index == MOUSE_BUTTON_LEFT\
	and event.is_pressed():
		virar()
