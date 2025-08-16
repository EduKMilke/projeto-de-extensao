extends Button

func _ready():
	
	self.pressed.connect(_on_botao_sair_pressed)

func _on_botao_sair_pressed():
	get_tree().quit()  
