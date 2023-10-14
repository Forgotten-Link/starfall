extends Area2D

@export var speed = 100  # adjust based on your needs
@export var target: Node2D  # the main character you want to follow
@export var default_min_distance = 50
@export var min_distance = default_min_distance
@export var timer = 4.0

func _process(delta):
	if target:
		# Adjust min_distance if main character has been still for 4 seconds
		if target.time_standing_still >= timer:
			min_distance = 0
		else:
			min_distance = default_min_distance

		var direction = target.global_position - global_position
		if direction.length() > min_distance:
			direction = direction.normalized()
			global_position += direction * speed * delta
	# Check the x direction and flip sprite accordingly
			if direction.x > 0:  # Moving to the right
				$AnimatedSprite2D.flip_h = false
			elif direction.x < 0:  # Moving to the left
				$AnimatedSprite2D.flip_h = true
