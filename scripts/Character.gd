class_name RPGCharacter

var name = ""
var health = 10
var speed = 5
var attack = 5
var magic = 5
var defense = 5
var magic_defense = 5

# Constructor for easy character creation
func _init(_name, _health, _attack, _magic, _speed, _defense, _magic_defense):
	name = _name
	
	health = _health
	attack = _attack
	magic = _magic
	speed = _speed
	defense = _defense
	magic_defense = _magic_defense

func take_damage(amount):
	var damage_taken = max(amount - defense, 0)
	health -= damage_taken



