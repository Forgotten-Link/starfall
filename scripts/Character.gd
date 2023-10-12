class_name RPGCharacter

var name = ""
var health = 100
var mana = 100
var attack = 10
var magic = 10
var defense = 10
var magic_defense = 10

# Constructor for easy character creation
func _init(_name, _health, _mana, _attack, _magic, _defense, _magic_defense):
	name = _name
	health = _health
	mana = _mana
	attack = _attack
	magic = _magic
	defense = _defense
	magic_defense = _magic_defense

func take_damage(amount):
	var damage_taken = max(amount - defense, 0)
	health -= damage_taken

func use_mana(amount):
	mana = max(mana - amount, 0)


