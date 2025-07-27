extends CharacterBody2D
@onready var barrera = preload("res://barrera.tscn")
var player=null
var c_bar=0
var bari=null
func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if player == null:
		player = get_node_or_null("/root/Node2D/player")
		
		return 
	else:
		if player.cont>=c_bar:
			bari=barrera.instantiate()
			c_bar+=40
			add_child(bari)
