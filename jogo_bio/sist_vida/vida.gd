extends Sprite2D
var arra=[load("res://sist_vida/c_0.png"),load("res://sist_vida/c_1.png"),load("res://sist_vida/c_2.png"),load("res://sist_vida/c_3.png")]
func _ready() -> void:
	texture=arra[Global.vida]
func _process(delta: float) -> void:
	if Global.vida<=0:
		Global.vida=0
		var current_scene_path = get_tree().current_scene.scene_file_path
		get_tree().change_scene_to_file(current_scene_path)
	texture=arra[Global.vida]
