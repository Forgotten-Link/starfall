extends Area2D

@export var char_resource : CharacterStats
@onready var sprite = $Sprite2D
@export var info_display : Node

func _ready():
	sprite.texture = char_resource.char_sprite


func _on_mouse_entered():
	info_display.update_info(char_resource)
	print(char_resource)
