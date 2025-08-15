extends Area2D
var chave
func _ready():
	scale.x=3
	scale.y=3
	$Sprite2D.texture = load("res://sprites/d_bandera.png")
func _physics_process(delta: float) -> void:
	var chave = get_node_or_null("../chaves")
	if chave==null:
		$Sprite2D.texture = load("res://sprites/bandera.png")
func _on_body_entered(body: Node2D) -> void:
	chave = get_node_or_null("../chaves")
	if chave==null:
		if body is RigidBody2D:
			var cena= Global.sala[Global.nsala]
			get_tree().change_scene_to_file(cena)
			Global.nsala+=1
