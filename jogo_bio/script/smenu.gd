extends Control
@onready var play=$play
@onready var sair=$sair

func _process(delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://cenas/escolha_s.tscn")


func _on_sair_pressed() -> void:
	get_tree().quit()
