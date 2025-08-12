extends Node

var orbs_remaining

func _ready() -> void:
	var orbs = get_tree().get_nodes_in_group("orbs")
	orbs_remaining = orbs.size()
	for orb in orbs:
		orb.hit.connect(_on_orb_hit)
	$HUD/ScoreLabel.text = "Orbs Remaining: " + str(orbs_remaining)
	$HUD/ScoreLabel.show()

func _process(delta: float) -> void:
	pass

func _on_orb_hit() -> void:
	orbs_remaining -= 1
	$HUD/ScoreLabel.text = "Orbs Remaining: " + str(orbs_remaining)
	if orbs_remaining == 0:
		$Portal.enable_portal()

func _on_portal_hit() -> void:
	$HUD/ScoreLabel.hide()
	$HUD/WinMessage.text = "You Win!"
	$HUD/WinMessage.show()
	$Player/AnimationPlayer.play("disappear")
	# $Player.queue_free()
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://scenes/start.tscn")
