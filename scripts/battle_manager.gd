extends Node

#phases
@export var phase = {0: 'attack phase', 1: 'target phase'}
var phase_num = 0
@export var current_phase: String

@export var activating_card: Node
#@export var target: CharacterStats

func _ready():
	pass
#turns

#set phase function

#set turns
func set_phase(num):
	current_phase = phase[num]
	print(current_phase)

func activate_card(target):
	activating_card.card_resource.trigger(target)
	printt(activating_card.card_resource.name, target.name)
	pass

#testing
func _on_test_button_pressed():
	if phase_num >= phase.size() - 1:
		phase_num = 0
		print(phase[phase_num])
		
	elif phase_num < phase.size():
		phase_num += 1
		print(phase[phase_num])
