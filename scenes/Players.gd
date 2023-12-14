extends Node

func _ready():
	BattleManager.deal_damage.connect(deal_damage_to_player)
	BattleManager.death_check.connect(check_for_deaths)

func deal_damage_to_player(i):
	var character = get_child(i).char_resource
	character.health -= 5
	print(get_child(i).char_resource.name)
	BattleManager.set_phase(1)

func check_for_deaths():
	for i in self.get_child_count():
		var character = get_child(i).char_resource
		if character.health <= 0:
			get_child(i).queue_free()
		print(character)
		
