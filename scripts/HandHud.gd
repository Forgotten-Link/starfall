extends Control

@onready var hand = $PanelContainer/HBoxContainer/CardContainer
@export var character: Node

func draw_card():
	var character_deck = character.char_resource.deck
	var rng = RandomNumberGenerator.new()
	var rand_card = rng.randi_range(0, character.char_resource.deck.size()-1)
	var card_image = character_deck[rand_card]
	var card = TextureRect.new()
	card.texture = card_image
	card.expand_mode = 3
	card.stretch_mode = 4
	hand.add_child(card)
	
	pass

func clear_hand():
	for i in hand.get_child_count():
		hand.get_child(i).queue_free()
	pass


func _on_draw_pressed():
	draw_card()
	pass # Replace with function body.


func _on_clear_pressed():
	clear_hand()
