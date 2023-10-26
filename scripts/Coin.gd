extends Area2D



func _on_body_entered(body):
	print("I am still here")
	body.add_coin()
	queue_free()
