extends Control

@onready var b_dif=$dific
@onready var label_dif=$dific/Label
var n_dific=["Fácil","Médio","Difícil"]


func _ready() -> void:
	label_dif.text=n_dific[Global.dific]


func _process(delta: float) -> void:
	pass


func _on_dific_pressed() -> void:
	Global.dific+=1
	if Global.dific>=3:
		Global.dific=-1
	else:
		label_dif.text=n_dific[Global.dific]


func _on_b_s_diges_pressed() -> void:
	Global.s_dige=true
	get_tree().change_scene_to_file("res://cenas/jogo.tscn")
