extends Label


func _ready():
	BattleManager.update_phase_label.connect(update_label)
	
func update_label():
	self.text = BattleManager.current_phase
