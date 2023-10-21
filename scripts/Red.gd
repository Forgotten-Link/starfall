extends Area2D

signal hit

@export var speed = 400 # How fast the player will move (pixels/sec).

var previous_position: Vector2
var time_standing_still = 0.0


func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	# Check for horizontal movement
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
	elif Input.is_action_pressed("move_left"):
		velocity.x -= speed
	# If no horizontal movement, check for vertical
	elif Input.is_action_pressed("move_down"):
		velocity.y += speed
	elif Input.is_action_pressed("move_up"):
		velocity.y -= speed

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	position += velocity * delta
	#position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "side"
		$AnimatedSprite2D.flip_v = false
		# See the note below about boolean assignment.
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y < 0:
		$AnimatedSprite2D.animation = "up"
	elif velocity.y > 0:
		$AnimatedSprite2D.animation = "down"
		
	if global_position == previous_position:
		time_standing_still += delta
	else:
		time_standing_still = 0.0
	previous_position = global_position
		

