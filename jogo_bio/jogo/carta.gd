extends Button

signal card_flipped(card)

var pair_id = -1
var is_flipped = false
var is_matched = false

# A textura da face do cartão (se for uma imagem)
var front_content: Texture2D
# O texto da face do cartão (se for um texto)
var text_content = ""

# A textura do verso, que será a textura inicial do TextureRect
var back_texture: Texture2D = preload("res://assets/Carta Memória.png")

@onready var texture_rect = $TextureRect
@onready var label = $Label

# Este método é chamado pelo script Main.gd para configurar a carta
func initialize(id, content, is_text_card):
	pair_id = id
	is_flipped = false
	is_matched = false
	
	# Garante que o estado inicial é o do verso da carta
	texture_rect.texture = back_texture
	label.hide()
	
	# Armazena o conteúdo da frente
	if is_text_card:
		text_content = content
		label.text = text_content
	else:
		front_content = content as Texture2D

# A função para virar a carta para cima
func flip_card():
	if not is_flipped and not is_matched:
		is_flipped = true
		
		# Esconde a textura do verso e mostra a da frente (ou o texto)
		if text_content != "":
			texture_rect.hide()
			label.show()
		else:
			# Apenas troca a textura do TextureRect para a da frente
			texture_rect.show()
			texture_rect.texture = front_content
			label.hide()
		
		emit_signal("card_flipped", self)

# A função para virar a carta de volta (quando não forma par)
func flip_back():
	if not is_matched:
		is_flipped = false
		
		# Retorna o estado visual para o verso
		texture_rect.show()
		texture_rect.texture = back_texture
		label.hide()

# A função para marcar como pareado permanece a mesma
func match():
	is_matched = true
	# Opcional: Adicionar um efeito visual, como desaparecer
	await get_tree().create_timer(0.5).timeout
	queue_free()

# Conecta o sinal "pressed" do botão no próprio script
func _on_pressed():
	if not is_flipped and not is_matched:
		flip_card()
