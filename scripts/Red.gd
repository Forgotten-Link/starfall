extends CharacterBody2D

signal hit

@export var coins = 0
@export var speed = 400 # How fast the player will move (pixels/sec).
@onready var actionable_finder: Area2D = $Direction/ActionableFinder

var previous_position: Vector2
var time_standing_still = 0.0

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return

func add_coin():
	coins += 1
	print("I have ", coins, " coins")

func _physics_process(delta):
	velocity = Vector2.ZERO  # Resetting velocity at the beginning of the function
	# Check for horizontal movement
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	elif Input.is_action_pressed("move_left"):
		velocity.x -= 1
	# If no horizontal movement, check for vertical
	elif Input.is_action_pressed("move_down"):
		velocity.y += 1
	elif Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed  # We're setting the speed here
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	var collision_occurred = move_and_slide()  # Using CharacterBody2D's method to move the body, storing whether we had a collision
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
		

