extends Control

@onready var hand = $PanelContainer/HBoxContainer/CardContainer/HBoxContainer
@export var character: Node

func _ready():
	BattleManager.draw_for_draw_phase.connect(draw_card)
func draw_card():
	var character_deck = character.char_resource.deck
	var rng = RandomNumberGenerator.new()
	var rand_num = rng.randi_range(0, character.char_resource.deck.size()-1)
	var rand_card = character_deck[rand_num]
	var card_image = rand_card.card_texture
	var card = load("res://scenes/card_node.tscn").instantiate()
	card.card_resource = rand_card
	card.texture = card_image
	hand.add_child(card)

func clear_hand():
	for i in hand.get_child_count():
		hand.get_child(i).queue_free()


func _on_draw_pressed():
	draw_card()

func _on_clear_pressed():
	clear_hand()

func _on_draw_five_pressed():
	for i in 5:
		draw_card()


