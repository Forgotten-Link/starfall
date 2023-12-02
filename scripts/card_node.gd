extends TextureRect

@export var card_resource: CardResource

signal change_phase

func _ready():
	texture = card_resource.card_texture

func activate_card():
	print("select a target")
	BattleManager.set_phase(1)
	BattleManager.activating_card = self
	pass


func _on_gui_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		activate_card()
	pass # Replace with function body.
