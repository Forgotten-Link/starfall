extends Resource
class_name CharacterStats

@export var name :String
@export var max_health :int
@export var health :int
@export var char_sprite :Texture

func damage(damage_amount):
	health -= damage_amount
	printt('health = ', max_health, '/', health)
