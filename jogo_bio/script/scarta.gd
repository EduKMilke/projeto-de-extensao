extends TextureButton

class_name Card

signal card_selected(card_data)

var card_data = {}
var is_flipped = false
var is_matched = false

# Nodos da cena
@onready var front = $Front
@onready var back = $Back
@onready var card_text = $CardText
@onready var anim = $AnimationPlayer

func _ready():
	# Esconde a imagem da frente no início
	front.visible = false
	card_text.visible = false
	# Conecta o sinal de click


# Recebe os dados da carta
func setup(data):
	self.card_data = data
	if data.type == "image":
		front.texture = load(data.value)
		card_text.visible = false
	elif data.type == "text":
		card_text.text = data.value
		front.visible = false
	else:
		# Se for texto, ajusta a visibilidade
		card_text.text = data.value
		front.visible = false

# Quando a carta é pressionada
func _on_Card_pressed():
	if not is_flipped and not is_matched:
		flip()
		emit_signal("card_selected", self)

# Animação para virar a carta
func flip():
	if is_flipped:
		anim.play("flip_back")
		is_flipped = false
		back.visible = true
		front.visible = false
		card_text.visible = false
	else:
		anim.play("flip_forward")
		is_flipped = true
		back.visible = false
		if card_data.type == "image":
			front.visible = true
		elif card_data.type == "text":
			card_text.visible = true

# Marca a carta como combinada
func match():
	is_matched = true
	# Por exemplo, esmaecer a carta ou fazê-la desaparecer
	modulate = Color(1, 1, 1, 0.5)

# Reseta a carta se não houver correspondência
func unmatch():
	is_flipped = false
	flip()
	
# Getter para o ID da carta
func get_card_id():
	return card_data.id
