extends Area2D

signal hit

func _on_body_entered(body) -> void:
	hit.emit()
	queue_free()

func disable_orb():
	hide()
	$CollisionShape2D.set_deferred("disabled", true)

func enable_orb():
	show()
	$CollisionShape2D.set_deferred("disabled", false)