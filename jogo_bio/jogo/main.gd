extends Control

# Caminho para a cena do cartão
var card_scene = preload("res://jogo/cartas.tscn")

# Estrutura de dados para os pares (Texto, Imagem)
var pairs_data = [
	["Célula responsável por gerar ATP", preload("res://assets/c_3.png")],
	["Centro de controle da célula", preload("res://assets/c_2.png")],
	["Respirar o oxigênio da água", preload("res://assets/c_1.png")],
	# Adicione mais pares aqui conforme necessário
]

var flipped_cards = []
var is_processing_move = false

@onready var grid_container = $CenterContainer/GridContainer

func _ready():
	start_new_game()

func start_new_game():
	for child in grid_container.get_children():
		child.queue_free()

	var all_cards_data = []

	# Cria os dados para as cartas de texto e de imagem
	for i in range(pairs_data.size()):
		var text_content = pairs_data[i][0]
		var image_content = pairs_data[i][1]
		
		# Adiciona a carta de texto
		var text_card_data = {
			"id": i,
			"is_text_card": true,
			"content": text_content
		}
		all_cards_data.append(text_card_data)
		
		# Adiciona a carta de imagem
		var image_card_data = {
			"id": i,
			"is_text_card": false,
			"content": image_content
		}
		all_cards_data.append(image_card_data)

	# Embaralha a lista de dados
	all_cards_data.shuffle()

	# Instancia as cartas na grade
	for card_data in all_cards_data:
		var card = card_scene.instantiate()
		grid_container.add_child(card)
		card.initialize(card_data.id, card_data.content, card_data.is_text_card)
		card.connect("card_flipped", _on_card_flipped)

func _on_card_flipped(card):
	if is_processing_move:
		return
	
	flipped_cards.append(card)

	if flipped_cards.size() == 2:
		is_processing_move = true
		await get_tree().create_timer(1.0).timeout
		check_match()

func check_match():
	var card1 = flipped_cards[0]
	var card2 = flipped_cards[1]
	
	# Agora, a verificação de par é feita comparando o ID único
	if card1.pair_id == card2.pair_id:
		card1.match()
		card2.match()
		
		if grid_container.get_child_count() <= 2:
			print("Parabéns, você venceu!")
			await get_tree().create_timer(2.0).timeout
			start_new_game()
	else:
		card1.flip_back()
		card2.flip_back()
		
	flipped_cards.clear()
	is_processing_move = false
