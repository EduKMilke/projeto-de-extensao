extends Button

signal card_flipped(card)

var pair_id = -1
var is_flipped = false
var is_matched = false


var front_content: Texture2D

var text_content = ""


var back_texture: Texture2D = preload("res://assets/Carta Memória.png")

@onready var texture_rect = $TextureRect
@onready var label = $Label
@onready var anim=$AnimationPlayer
@onready var spr=$Sprite2D
func initialize(id, content, is_text_card):
	pair_id = id
	is_flipped = false
	is_matched = false
	

	texture_rect.texture = back_texture
	label.hide()
	

	if is_text_card:
		text_content = content
		label.text = text_content
	else:
		front_content = content as Texture2D


func flip_card():
	if not is_flipped and not is_matched:
		is_flipped = true
		anim.play("virar")
		spr.scale/=1000
		await get_tree().create_timer(0.5).timeout


		if text_content != "":
			texture_rect.hide()
			label.show()
		else:

			texture_rect.show()
			texture_rect.texture = front_content
			label.hide()
		
		emit_signal("card_flipped", self)


func flip_back():
	if not is_matched:
		is_flipped = false
		anim.play("virar")
		await get_tree().create_timer(0.5).timeout
		texture_rect.show()
		texture_rect.texture = back_texture
		label.hide()
func match():
	is_matched = true
	anim.play("desvirar")
	await get_tree().create_timer(0.5).timeout
	Global.p_click=true
	queue_free()
func _on_pressed():
	if not is_flipped and not is_matched and Global.p_click==true:
		flip_card()
