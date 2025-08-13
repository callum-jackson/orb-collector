extends Node

var orbs_remaining
var elapsed_time: float = 0.0
var time = "00:00:00"

func _ready() -> void:
	var orbs = get_tree().get_nodes_in_group("orbs")
	orbs_remaining = orbs.size()
	for orb in orbs:
		orb.hit.connect(_on_orb_hit)
	$HUD/ScoreLabel.show()


func _process(delta: float) -> void:
	elapsed_time += delta
	var minutes = int(elapsed_time / 60)
	var seconds = int(elapsed_time) % 60
	var centiseconds = int((elapsed_time - int(elapsed_time)) * 100)
	time = "%02d:%02d:%02d" % [minutes, seconds, centiseconds] 
	$HUD/ScoreLabel.text = "Time: " + str(time)
	
func _on_orb_hit() -> void:
	orbs_remaining -= 1
	if orbs_remaining == 0:
		$Portal.enable_portal()

func _on_portal_hit() -> void:
	$HUD/ScoreLabel.hide()
	$HUD/WinMessage.text = "Time: " + str(time)
	$HUD/WinMessage.show()
	$HUD/ReplayMessage.show()
	$Player/AnimationPlayer.play("disappear")
	# await get_tree().create_timer(5).timeout
	# get_tree().change_scene_to_file("res://scenes/start.tscn")
	

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		if $HUD/ReplayMessage.is_visible_in_tree():
			get_tree().change_scene_to_file("res://scenes/main.tscn")