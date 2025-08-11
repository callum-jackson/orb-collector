extends Area2D

signal hit

# Called when the Portal is collided with.
func _on_body_entered(body: Node2D) -> void:
	hit.emit() # Emit the 'hit' signal.

# Disables and hides the Portal when called.
func hide_portal():
	hide()
	$CollisionShape2D.set_deferred("disabled", true)

# Enables and shows the Portal when called.
func show_portal():
	show()
	$CollisionShape2D.set_deferred("disabled", false)