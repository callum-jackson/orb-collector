extends Area2D

signal hit

func _ready() -> void:
	disable_portal()

func _on_body_entered(body: Node2D) -> void:
	hit.emit()
	$PortalEnteredSound.play()

func disable_portal():
	hide()
	$CollisionShape2D.set_deferred("disabled", true)

func enable_portal():
	show()
	$CollisionShape2D.set_deferred("disabled", false)
