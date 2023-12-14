extends Area2D

@export var char_resource : CharacterStats
@onready var sprite = $Sprite2D
@export var info_display : Node
@export var battle_manager: Node

func _ready():
	sprite.texture = char_resource.char_sprite
	char_resource.health = char_resource.max_health


func _on_mouse_entered():
	info_display.update_info(char_resource)
	#print(char_resource)

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and BattleManager.current_phase == 'target phase':
		print('char_resource')
		#BattleManager.target = char_resource
		BattleManager.activate_card(char_resource)
		
