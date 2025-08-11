extends Area2D

signal hit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide_orb()

# Called when the Orb is collided with.
func _on_body_entered(body) -> void:
	hit.emit() # Emit the 'hit' signal.
	queue_free() # Delete the Orb scene.

# Disables and hides the Orb when called.
func hide_orb():
	hide()
	$CollisionShape2D.set_deferred("disabled", true)

# Enables and shows the Orb when called.
func show_orb():
	show()
	$CollisionShape2D.set_deferred("disabled", false)