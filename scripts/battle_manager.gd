extends Node

#phases
@export var phase = {0: 'player phase', 1: 'target phase', 2:  'enemy phase'}
var phase_num = 0
@export var current_phase: String

@export var activating_card: Node

signal draw_for_draw_phase
signal update_phase_label
signal deal_damage
signal death_check

func _ready():
	pass
#turns

#set phase function

#set turns
func set_phase(num):
	phase_num = num
	current_phase = phase[phase_num]
	update_phase_label.emit()
	printt('current phase:', current_phase)
	if current_phase == 'enemy phase':
		go_to_enemy_phase()
	if current_phase == 'player phase':
		go_to_player_phase()

func go_to_player_phase():
	draw_for_draw_phase.emit()
	print('drawing card')
	set_phase(1)

func go_to_enemy_phase():
	var rng = RandomNumberGenerator.new()
	var rand_int = rng.randi_range(0, 4)
	print(rand_int)
	deal_damage.emit(rand_int)
	dead_check()
	set_phase(0)
	
func activate_card(target):
	if activating_card == null:
		return
	activating_card.card_resource.trigger(target)
	printt(activating_card.card_resource.name, target.name)
	activating_card.queue_free()
	print('removing card')
	set_phase(2)

func enemy_turn():
	print('take damage')

func dead_check():
	death_check.emit()
	
#testing
func _on_test_button_pressed():
	if phase_num >= phase.size() - 1:
		phase_num = 0
		print(phase[phase_num])
		
	elif phase_num < phase.size():
		phase_num += 1
		print(phase[phase_num])
