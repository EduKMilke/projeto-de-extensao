extends Button


@export var icones: Array[Texture2D]


var icone_atual = 0


func _ready():
	
	self.pressed.connect(on_button_pressed)
	
	
	if icones.size() > 0:
		self.icon = icones[0]

 
func on_button_pressed():
	
	icone_atual += 1
	
	
	if icone_atual >= icones.size():
		icone_atual = 0
		
	
	self.icon = icones[icone_atual]
