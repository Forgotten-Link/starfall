extends Node

func _ready():
	BattleManager.death_check.connect(check_if_dead)

func check_if_dead():
	for i in self.get_child_count():
		var character = get_child(i)
		if character.char_resource.health <= 0:
			character.queue_free()
	if self.get_child_count() == 0:
		pass
