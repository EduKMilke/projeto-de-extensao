extends Node2D

var card_scene = preload("res://icon.svg")
var game_data = [
	{"id": 1, "type": "image", "value": "res://assets/images/godot_logo.png"},
	{"id": 1, "type": "text", "value": "Logo da Godot"},
	{"id": 2, "type": "image", "value": "res://assets/images/gdscript_icon.png"},
	{"id": 2, "type": "text", "value": "GDScript"},
	{"id": 3, "type": "image", "value": "res://assets/images/scene_icon.png"},
	{"id": 3, "type": "text", "value": "Cena Godot"},
	# Adicione mais pares de cartas
]

@onready var grid_container = $GridContainer

var selected_cards = []
var can_select = true
var matched_pairs = 0
var total_pairs = 0

func _ready():
	total_pairs = game_data.size() / 2
	setup_game()


func setup_game():
	randomize()
	game_data.shuffle()
	
	for card_data in game_data:
		var card = card_scene.instance()
		card.setup(card_data)
		grid_container.add_child(card)
		card.connect("card_selected", self, "_on_Card_selected")

# Quando uma carta é selecionada
func _on_Card_selected(card):
	if not can_select or card in selected_cards:
		return

	selected_cards.append(card)

	if selected_cards.size() == 2:
		can_select = false
		var card1 = selected_cards[0]
		var card2 = selected_cards[1]
		
		await get_tree().create_timer(0.5).timeout

		if card1.get_card_id() == card2.get_card_id():
			# Par encontrado
			card1.match()
			card2.match()
			matched_pairs += 1
			selected_cards.clear()
			can_select = true
			
			if matched_pairs == total_pairs:
				await get_tree().create_timer(1).timeout
				print("Jogo concluído!")
				# Aqui você pode adicionar a lógica de fim de jogo
		else:
			# Não é um par, vira as cartas de volta
			await get_tree().create_timer(1.5).timeout
			card1.unmatch()
			card2.unmatch()
			selected_cards.clear()
			can_select = true
