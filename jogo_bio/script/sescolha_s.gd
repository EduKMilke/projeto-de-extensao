extends Control

@onready var b_dif=$dific
@onready var label_dif=$dific/Label

var n_dific=["Fácil","Médio","Difícil"]
var c_dific=["00ba00","ff8200","de0000"]
@onready var subt=$"Título(1)/AnimationPlayer"

func _ready() -> void:
	label_dif.text=n_dific[Global.dific] 
	b_dif.modulate=c_dific[Global.dific] 
	subt.play("new_animation")
	Global.p_click=true
func _on_dific_pressed() -> void: #mudar a dificuladade
		Global.dific+=1
		if Global.dific>2:
			Global.dific=0
		label_dif.text=n_dific[Global.dific]
		b_dif.modulate=c_dific[Global.dific]
#botões de para cada sistema
func _on_b_s_diges_pressed() -> void:
	Global.s_dige=true
	get_tree().change_scene_to_file("res://cenas/jogo.tscn")


func _on_b_s_musc_pressed() -> void:
	Global.s_musc=true
	get_tree().change_scene_to_file("res://cenas/jogo.tscn")

func _on_b_s_resp_pressed() -> void:
	Global.s_resp=true
	get_tree().change_scene_to_file("res://cenas/jogo.tscn")


func _on_b_s_repro_pressed() -> void:
	Global.s_repro=true
	get_tree().change_scene_to_file("res://cenas/jogo.tscn")

func _on_b_s_reprofem_pressed() -> void:
	Global.s_reprofem=true
	get_tree().change_scene_to_file("res://cenas/jogo.tscn")


func _on_b_s_excre_pressed() -> void:
	Global.s_excre=true
	get_tree().change_scene_to_file("res://cenas/jogo.tscn")
	
func _on_b_s_esque_pressed() -> void:
	Global.s_esque=true
	get_tree().change_scene_to_file("res://cenas/jogo.tscn")


func _on_b_s_nerv_pressed() -> void:
	Global.s_nerv=true
	get_tree().change_scene_to_file("res://cenas/jogo.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://cenas/menu.tscn")
