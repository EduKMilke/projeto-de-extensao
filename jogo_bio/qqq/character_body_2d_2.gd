extends CharacterBody2D

# Variáveis para controlar a flutuação

var a=0
func _ready():
	pass
func _physics_process(delta: float) -> void:
	a+=1
	position.y=position.y+sin(a*0.03)*0.8
	move_and_slide()
  
