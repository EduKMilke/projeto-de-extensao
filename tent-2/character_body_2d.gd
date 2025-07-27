extends CharacterBody2D

var tecla=1
const SPEED = 300.0
const JUMP_VELOCITY = -600.0
var anda=-700
var andat=anda
var lima=2
@onready var fundo = get_node("../Parallax2D")
var cont=0
var label
var tempo=0

func _ready() -> void:
	label = get_node("../Label")
func _physics_process(delta: float) -> void:
	# Add the gravity.
	andat=(anda*-1)/7
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("tesp") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("ta") and tecla==1:
		tecla*=-1
		fundo.scroll_offset.x += anda * delta
		cont+=1
	if Input.is_action_just_pressed("td") and tecla==-1:
		tecla*=-1
		fundo.scroll_offset.x += anda * delta
		cont+=1
	if lima<=cont:
		lima*=1.5
		anda*=1.2
	label.text="passos: "+str(cont)+"
	tempo: "+str(tempo)+"s"+"
	pontos: "+str(andat)+"
	+vel: "+str(lima)
	move_and_slide()

func _on_timer_timeout() -> void:
	tempo+=1
