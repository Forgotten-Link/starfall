extends Area2D

@export var speed = 100  # adjust based on your needs
@export var target: Node2D  # the main character you want to follow
@export var default_min_distance = 50
@export var min_distance = default_min_distance
@export var timer = 4.0
@export var hideTimer = 5.0

func _process(delta):
	if target:
		# Adjust min_distance if main character has been still for 4 seconds
		if target.time_standing_still >= timer:
			min_distance = 0
			if target.time_standing_still >= hideTimer:
				hide()
			else:
				show()
		else:
			min_distance = default_min_distance
			show()

		var direction = target.global_position - global_position
		if direction.length() > min_distance:
			var velocity = Vector2.ZERO

			# Check which absolute distance is greater (x or y) and move on that axis
			if abs(direction.x) > abs(direction.y):
				velocity.x = speed * (1 if direction.x > 0 else -1)
			else:
				velocity.y = speed * (1 if direction.y > 0 else -1)

			# Apply the movement to the position
			global_position += velocity * delta
	# Check the x direction and flip sprite accordingly
			if direction.x > 0:  # Moving to the right
				$AnimatedSprite2D.flip_h = false
			elif direction.x < 0:  # Moving to the left
				$AnimatedSprite2D.flip_h = true
