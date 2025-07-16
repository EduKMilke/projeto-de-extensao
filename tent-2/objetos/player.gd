extends CharacterBody2D

var spd = 500
var movx = 0
var movy = 0
var label
@onready var sprite:=$sprite
func _ready() -> void:
	label = get_node("../Label")

func _process(_delta: float) -> void:
	pass
func _physics_process(_delta: float) -> void:
	movx = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	movy = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	label.text = str(movx)
	if movx != 0:
		sprite.scale.x = sign(movx)
	var mov = Vector2(movx, movy)
	velocity = mov.normalized() * spd
	move_and_slide()
