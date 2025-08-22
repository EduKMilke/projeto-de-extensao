extends Control

@onready var grid_container = $CenterContainer/GridContainer
var card_scene = preload("res://obj/cartas.tscn")


var pairs_data = [
	["Célula responsável por gerar ATP", preload("res://assets/c_3.png")],
	["Centro de controle da célula",preload("res://assets/c_2.png")],
	["Respirar o oxigênio da água", preload("res://assets/c_1.png")],

]

var flipped_cards := []
var is_processing_move := false

func _ready():
	start_new_game()

func start_new_game():

	for child in grid_container.get_children():
		child.queue_free()


	var all_cards_data := []
	for i in pairs_data.size():
		var text_content  = pairs_data[i][0]
		var image_content = pairs_data[i][1]
		all_cards_data.append({
			"id":           i,
			"is_text_card": true,
			"content":      text_content
		})
		all_cards_data.append({
			"id":           i,
			"is_text_card": false,
			"content":      image_content
		})
	all_cards_data.shuffle()


	for data in all_cards_data:
		var card = card_scene.instantiate()
		grid_container.add_child(card)
		card.initialize(data.id, data.content, data.is_text_card)

		card.connect("card_flipped", Callable(self, "_on_card_flipped"))


func _on_card_flipped(card):
	if is_processing_move:
		return

	flipped_cards.append(card)

	if flipped_cards.size() == 2:
		is_processing_move = true



		Global.p_click=false
		await get_tree().create_timer(2).timeout
		_check_match()


func _check_match():
	var card1 = flipped_cards[0]
	var card2 = flipped_cards[1]

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
		Global.p_click=true

	flipped_cards.clear()
	is_processing_move = false
	grid_container.mouse_filter = Control.MOUSE_FILTER_PASS
