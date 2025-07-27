extends Area2D
var player = null

func _physics_process(delta):
	if player == null:
		player = get_node_or_null("/root/Node2D/player")
		return 
	else:
		if Input.is_action_just_pressed("ta") and player.tecla==-1:
			global_position.x += player.anda * delta
		if Input.is_action_just_pressed("td") and player.tecla==1:
			global_position.x += player.anda * delta
	

func _on_body_entered(_body: CharacterBody2D) -> void:
	player.anda/=1.5
	player.lima/=1.5
	print("oi")
