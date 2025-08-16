extends Area2D


@export var cena_pai: Node2D

func _ready():

	body_entered.connect(on_body_entered)

func on_body_entered(body: Node2D):
	
	if body is RigidBody2D:
		body.queue_free()
		var timer = get_tree().create_timer(1.0)
		timer.timeout.connect(reset_cena)
func reset_cena():

	get_tree().reload_current_scene()
