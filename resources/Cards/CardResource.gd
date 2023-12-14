extends Resource
class_name CardResource

@export var card_texture: Texture2D
@export var name: String

#possible effects
@export var is_attack: bool
@export var is_heal: bool

@export var value: int

func trigger(target):
	if is_attack == true:
		target.health -= value
		print('taking ', value, ' damage')
	elif is_heal == true:
		target.health += value
		print('healing ', value, ' points')
	else:
		pass
	print(target.health)


