extends CharacterBody2D

@export var animation = "goblin"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play(animation)


