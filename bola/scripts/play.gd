extends Button

@onready var cena=null

func _ready() -> void:
	Global.nsala=1
	cena= Global.sala[Global.nsala]



func _on_button_down() -> void:
	get_tree().change_scene_to_file(cena)
	Global.nsala+=1
