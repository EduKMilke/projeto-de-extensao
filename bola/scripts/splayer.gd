extends RigidBody2D

var spd = 500
var jmp = 500

@onready var raycast = $RayCast2D
func _physics_process(delta: float) -> void:
	var velocity = linear_velocity
	

	if Input.is_action_pressed("ui_right"):
		velocity.x = spd
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -spd
	elif velocity.x>=0:
		velocity.x -=0.1
	elif velocity.x<=0:
		velocity.x +=0.1

	if raycast.is_colliding() and Input.is_action_just_pressed("ui_up"):
		velocity.y = -jmp
	linear_velocity = velocity
