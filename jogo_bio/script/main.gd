extends Control

@onready var grid_container = $CenterContainer/GridContainer
var card_scene = preload("res://obj/cartas.tscn")


var flipped_cards := []
var is_processing_move := false
var pairs_data = []

func _ready():
	randomize()

	if Global.s_dige == true:
		var delgado=["Reponsável pela\nabsorção de\nnutrientes","Mede até\nsete metros\nde comprimento"].pick_random()
		var estomago=["Pode armazenar\naté 2 litros \nde comida.","Possui um muco\nprotetor do próprio"].pick_random()
		var figado =["Filtra toxinas\ndo sangue.","Produz bile\npara digestão."].pick_random()
		var _intestinog=["Absorve água\ndos resíduos.","Mede cerca\nde 1,5 metro."].pick_random()
		var pancreas=["Regula açúcar\nno sangue.","Produz sucos\ndigestivos."].pick_random()
		if Global.dific==0:
			pairs_data = [
			[delgado, preload("res://assets/digestorio/s_delgado.png")],
			[estomago, preload("res://assets/digestorio/s_estomago.png")],

		]
		if Global.dific==1:
			pairs_data = [
			[delgado, preload("res://assets/digestorio/s_delgado.png")],
			[estomago, preload("res://assets/digestorio/s_estomago.png")],
			[figado, preload("res://assets/digestorio/s_figado.png")],

		]
		if Global.dific==2:
			pairs_data = [
			[delgado, preload("res://assets/digestorio/s_delgado.png")],
			[estomago, preload("res://assets/digestorio/s_estomago.png")],
			[figado, preload("res://assets/digestorio/s_figado.png")],
			[pancreas, preload("res://assets/digestorio/s_pancreas.png")],
		]
	if Global.s_musc == true:
		var abdomen=["Protege órgãos\nvitais internos","Auxilia na\npostura corporal"].pick_random()
		var biceps=["Flexiona o braço\nno cotovelo","É Formado por\ndois feixes musculares."].pick_random()
		var coracao =["Bombeia 5 litros\nde sangue/minuto","Bate cerca de\n100 mil vezes/dia."].pick_random()
		var deltoide=["Eleva o braço\nlateralmente.","Cobre a articulação\ndo ombro"].pick_random()
		
		if Global.dific==0:
			pairs_data = [
			[abdomen, preload("res://assets/muscular/s_abdomen.png")],
			[biceps, preload("res://assets/muscular/s_biceps.png")],

		]
		if Global.dific==1:
			pairs_data = [
			[abdomen, preload("res://assets/muscular/s_abdomen.png")],
			[biceps, preload("res://assets/muscular/s_biceps.png")],
			[coracao, preload("res://assets/muscular/s_coracao.png")],

		]
		if Global.dific==2:
			pairs_data = [
			[abdomen, preload("res://assets/muscular/s_abdomen.png")],
			[biceps, preload("res://assets/muscular/s_biceps.png")],
			[coracao, preload("res://assets/muscular/s_coracao.png")],
			[deltoide, preload("res://assets/muscular/s_deltoide.png")],
		]
	if Global.s_esque == true:
		var coluna=["Protege a \nmedula espinhal","Possui 33 \nvértebras"].pick_random()
		var cranio=["Protege o cérebro","Da suporte à face"].pick_random()
		var escapula =["Não se conecta diretamente \nà caixa toráxica","É mantida no lugar \npor 17 músculos diferentes."].pick_random()
		var femur=["Osso mais longo\ne mais forte\ndo corpo humano","Suporta força\nequivalente a 30 vezes\no peso do corpo"].pick_random()
		var esterno=["É o osso central\ndo peito","Onde as costelas\nse fixam"].pick_random()
		if Global.dific==0:
			pairs_data = [
			[coluna, preload("res://assets/esqueletico/s_colunaver.png")],
			[cranio, preload("res://assets/esqueletico/s_cranio.png")],

		]
		if Global.dific==1:
			pairs_data = [
			[coluna, preload("res://assets/esqueletico/s_colunaver.png")],
			[cranio, preload("res://assets/esqueletico/s_cranio.png")],
			[escapula, preload("res://assets/esqueletico/s_escápula.png")],
			[femur, preload("res://assets/esqueletico/s_fêmur.png")],
		]
		if Global.dific==2:
			pairs_data = [
			[coluna, preload("res://assets/esqueletico/s_colunaver.png")],
			[cranio, preload("res://assets/esqueletico/s_cranio.png")],
			[escapula, preload("res://assets/esqueletico/s_escápula.png")],
			[femur, preload("res://assets/esqueletico/s_fêmur.png")],
			[esterno, preload("res://assets/esqueletico/s_esterno.png")],
		]
	if Global.s_excre == true:
		var bexiga=["Pode armazenar \naté 600ml de \nurina", "É incrivelmente \nelástica"].pick_random()
		var rim=["Filtram cerca de \n180 litros de \nsangue por dia.", "Controlam o nível \nde sal e água"].pick_random()
		var ureter=["Transportam urina \ndo rim para \n as bexigas", "Utilizam \ncontrações \nmusculares \nrítmicas"].pick_random()
		var veiare=["Maior veia \ndo corpo", "Devolve o sangue \nsem oxigênio da \nparte inferior do \ncorpo ao coração.
"].pick_random()
		if Global.dific==0:
			pairs_data = [
			[bexiga, preload("res://assets/excretor/bexiga.png")],
			[rim, preload("res://assets/excretor/rim.png")],

		]
		if Global.dific==1:
			pairs_data = [
			[bexiga, preload("res://assets/excretor/bexiga.png")],
			[rim, preload("res://assets/excretor/rim.png")],
			[ureter, preload("res://assets/excretor/ureter.png")],

		]
		if Global.dific==2:
			pairs_data = [
			[bexiga, preload("res://assets/excretor/bexiga.png")],
			[rim, preload("res://assets/excretor/rim.png")],
			[ureter, preload("res://assets/excretor/ureter.png")],
			[veiare, preload("res://assets/excretor/veia renal-caval.png")],
		]
	if Global.s_resp == true:
		var bronquios=["São cruciais para \no mecanismo de \nlimpeza e \numidificação \ndo ar", "Controlam o \nfluxo de \nar e cílios para \nvarrer impurezas"].pick_random()
		var traqueia=["Tubo com anéis \nde cartilagem que \na mantêm aberta.", "É revestida \npor cílios \nque limpam o \nar de partículas."].pick_random()
		var vias=["Aquecem, \numedecem \ne filtram o ar \nque respiramos.", "Protegem o corpo \nde irritações \natravés do espirro"].pick_random()
		var pulmoes=["Um deles é\n menor do que o \noutro para dar \nespaço para\n o coração", "Realizam \ntrocas \ngasosas"].pick_random()
		if Global.dific==0:
			pairs_data = [
			[bronquios, preload("res://assets/respiratório/s_bronquiosebronquiolos.png")],
			[traqueia, preload("res://assets/respiratório/s_traqueia.png")],

		]
		if Global.dific==1:
			pairs_data = [
			[bronquios, preload("res://assets/respiratório/s_bronquiosebronquiolos.png")],
			[traqueia, preload("res://assets/respiratório/s_traqueia.png")],
			[vias, preload("res://assets/respiratório/s_viasrespiratorias.png")],

		]
		if Global.dific==2:
			pairs_data = [
			[bronquios, preload("res://assets/respiratório/s_bronquiosebronquiolos.png")],
			[traqueia, preload("res://assets/respiratório/s_traqueia.png")],
			[vias, preload("res://assets/respiratório/s_viasrespiratorias.png")],
			[pulmoes, preload("res://assets/respiratório/s_resp.png")],
		]
		
	if Global.s_nerv == true:
		var cerebelo=["Contém metade \ndos neurônios \ndo cérebro \ninteiro", "É crucial para \ncoordenação \nmotora fina, \nequilíbrio e \nfunções cognitivas"].pick_random()
		var cerebro=["Consome cerca \nde 20% da energia \ntotal do corpo", "Consolida \nmemórias \ne remove resíduos \ndurante o \nsono"].pick_random()
		var nervo=["Transmitem \nsinais a \nvelocidades \nincríveis", "Compostos por \nfeixes de fibras \nde células \nnervosas"].pick_random()
		var troncoence=["Centro de \ncontrole vital \ndo corpo", "Regula o \nsono e a \ndeglutição"].pick_random()
		if Global.dific==0:
			pairs_data = [
			[cerebelo, preload("res://assets/nervoso/s_cerebelo.png")],
			[cerebro, preload("res://assets/nervoso/s_cerebro.png")],

		]
		if Global.dific==1:
			pairs_data = [
			[cerebelo, preload("res://assets/nervoso/s_cerebelo.png")],
			[cerebro, preload("res://assets/nervoso/s_cerebro.png")],
			[nervo, preload("res://assets/nervoso/s_nervo.png")],

		]
		if Global.dific==2:
			pairs_data = [
			[cerebelo, preload("res://assets/nervoso/s_cerebelo.png")],
			[cerebro, preload("res://assets/nervoso/s_cerebro.png")],
			[nervo, preload("res://assets/nervoso/s_nervo.png")],
			[troncoence, preload("res://assets/nervoso/s_troncoence.png")],
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
		Global.p_click=false
		is_processing_move = true

		await get_tree().create_timer(2).timeout
		_check_match()


func _check_match():
	Global.p_click=false
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
