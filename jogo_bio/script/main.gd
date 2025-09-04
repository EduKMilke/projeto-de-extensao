extends Control

@onready var grid_container = $CenterContainer/GridContainer
var card_scene = preload("res://obj/cartas.tscn")


var flipped_cards := []
var is_processing_move := false
var pairs_data = []

func _ready():
	if Global.s_dige == true:
		if Global.dific==0:
			pairs_data = [
			["Reponsavel absorção de nutrientes", preload("res://assets/digestorio/s_delgado.png")],
			["Atua no início da digestão", preload("res://assets/digestorio/s_estomago.png")],
			["Produz bile", preload("res://assets/digestorio/s_figado.png")],
		]
		if Global.dific==1:
			pairs_data = [
			["Reponsavel absorção de nutrientes", preload("res://assets/digestorio/s_delgado.png")],
			["Atua no início da digestão", preload("res://assets/digestorio/s_estomago.png")],
			["Produz bile", preload("res://assets/digestorio/s_figado.png")],
			["Produz enzimas digestivas", preload("res://assets/digestorio/s_pancreas.png")],
		]
		if Global.dific==2:
			pairs_data = [
			["Reponsavel absorção de nutrientes", preload("res://assets/digestorio/s_delgado.png")],
			["Atua no início da digestão", preload("res://assets/digestorio/s_estomago.png")],
			["Produz bile", preload("res://assets/digestorio/s_figado.png")],
			["Produz bile", preload("res://assets/digestorio/s_figado.png")],
			["Produz enzimas digestivas", preload("res://assets/digestorio/s_pancreas.png")],
		]
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
			Global.reset_tudo()
			get_tree().change_scene_to_file("res://cenas/escolha_s.tscn")
	else:
		card1.flip_back()
		card2.flip_back()
		Global.p_click=true

	flipped_cards.clear()
	is_processing_move = false
	grid_container.mouse_filter = Control.MOUSE_FILTER_PASS
