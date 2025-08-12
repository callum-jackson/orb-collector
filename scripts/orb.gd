extends Area2D

signal hit

func _on_body_entered(body) -> void:
	$CollisionShape2D.set_deferred("disabled", true)
	hit.emit()
	$AnimatedSprite2D.play("collected")
	$CollectedSound.play()

func disable_orb():
	hide()
	$CollisionShape2D.set_deferred("disabled", true)

func enable_orb():
	show()
	$CollisionShape2D.set_deferred("disabled", false)


func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()
