extends Resource
class_name CharacterStats

@export var name :String
@export var max_health :int
@export var health = max_health
@export var char_sprite :Texture

@export var deck = [CardResource]

func damage(damage_amount):
	health -= damage_amount
	printt('health = ', max_health, '/', health)
