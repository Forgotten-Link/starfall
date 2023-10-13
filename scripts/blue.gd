extends Area2D


extends KinematicBody2D  # or RigidBody2D, depending on your setup

var speed = 100  # adjust based on your needs
var target: Node  # the main character you want to follow
var min_distance = 50  # minimum distance to maintain from the target

func _physics_process(delta):
	if target:
		var direction = target.global_position - global_position
		if direction.length() > min_distance:
			direction = direction.normalized()
			move_and_slide(direction * speed)
