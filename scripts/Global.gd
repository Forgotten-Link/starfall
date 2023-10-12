extends Node

var money = 0
var xp = 0
var hp = 100
var party = {} # This dictionary will hold characters

func _ready():
	# Create characters
	var red = RPGCharacter.new("Red", 100, 50, 15, 10, 5, 5)
	var blue = RPGCharacter.new("Blue", 100, 45, 14, 11, 6, 5)
	var yellow = RPGCharacter.new("Yellow", 80, 55, 13, 12, 6, 6)
	var green = RPGCharacter.new("Green", 200, 60, 12, 10, 7, 5)
	var purple = RPGCharacter.new("Purple", 80, 48, 16, 9, 5, 6)

	# Add characters to the party dictionary
	party["Red"] = red
	party["Blue"] = blue
	party["Yellow"] = yellow
	party["Green"] = green
	party["Purple"] = purple
	

