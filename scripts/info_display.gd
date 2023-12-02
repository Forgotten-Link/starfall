extends Control

@onready var char_name = $PanelContainer/MarginContainer/VBoxContainer/CharName
@onready var portrait = $PanelContainer/MarginContainer/VBoxContainer/Portrait
@onready var hp_label = $PanelContainer/MarginContainer/VBoxContainer/HPLabel
@onready var hp_bar = $PanelContainer/MarginContainer/VBoxContainer/HPBar

func update_info(char):
	char_name.text = char.name
	portrait.texture = char.char_sprite
	hp_label.text = str(char.health) + '/' + str(char.max_health)
	#hp_bar.max_value = char.max_health
	hp_bar.value = char.health

