extends Button

signal card_flipped(card)

var pair_id = -1
var is_flipped = false
var is_matched = false


var front_content: Texture2D

var text_content = ""


var back_texture: Texture2D = preload("res://assets/Carta Memória.png")
var feito=false
@onready var texture_rect = $TextureRect
@onready var label = $Label
@onready var anim=$AnimationPlayer
@onready var spr=$Sprite2D
@onready var spr2=$Sprite2D2

func initialize(id, content, is_text_card):
	pair_id = id
	is_flipped = false
	is_matched = false
	spr2.hide()

	texture_rect.texture = back_texture
	label.hide()
	

	if is_text_card:
		text_content = content
		label.text = text_content
	else:
		front_content = content as Texture2D


func flip_card():

	if not is_flipped and not is_matched:

		anim.play("virar")

		is_flipped = true

		if text_content != "":
			texture_rect.hide()
			label.show()
			spr2.show()
		else:

			texture_rect.show()
			texture_rect.texture = front_content
			label.hide()
			spr2.hide()
		emit_signal("card_flipped", self)


func flip_back():

	if not is_matched:
		is_flipped = false
		anim.play("virar")
		await get_tree().create_timer(0.5).timeout
		texture_rect.show()
		texture_rect.texture = back_texture
		label.hide()
		spr2.hide()
func match():
	await get_tree().create_timer(1).timeout
	anim.play("desvirar")
	await get_tree().create_timer(0.5).timeout
	is_matched = true
	Global.p_click = true
	feito = true 
	texture_rect.hide()
	label.hide()
	spr.hide()
	spr2.hide()
func _on_pressed():

	if not is_flipped and not is_matched and Global.p_click==true:

		flip_card()
