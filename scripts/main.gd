extends Node

var orbs_remaining

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Get reference to all Orbs in the scene.
	var orbs = get_tree().get_nodes_in_group("orbs")
	
	# Count the number of orbs in the scene and connect their "hit" signal.
	orbs_remaining = orbs.size() 
	for orb in orbs:
		orb.hit.connect(_on_orb_hit)
		orb.hide_orb()
	
	start_game(orbs)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Called when an Orb is collided with.
func _on_orb_hit() -> void:
	# Decrease count of Orbs in scene and update score label.
	orbs_remaining -= 1
	$HUD.update_score_label(orbs_remaining)
	# Show goal portal when all Orbs are collected.
	if orbs_remaining == 0:
		$Portal.show_portal()

# Starts game when called.
func start_game(orbs):
	# Disable and hide objects until game starts.
	$Portal.hide_portal()
	$Player.hide_player()
	$HUD.hide_score()
	
	# Update the Message label to give instructions to the player.
	$HUD.update_message("Collect all of the orbs then get to the portal!")
	await get_tree().create_timer(5).timeout
	
	# Hide Message and show ScoreLabel.
	$HUD.hide_message()
	$HUD.update_score_label(orbs_remaining)
	$HUD.show_score()
	
	# Enable and show the Player and Orbs.
	$Player.show_player()
	for orb in orbs:
		orb.show_orb()

# Called when the goal portal is collided with.
func _on_portal_hit() -> void:
	$HUD.hide_score() # Hide the ScoreLabel.
	$HUD.update_message("You Win!") # Update the Message label with a win statement.
	$HUD.show_message() # Show the Message label.
	$Player.queue_free() # Delete the Player scene.
	
	# Wait for 5 seconds and restart the game.
	await get_tree().create_timer(5).timeout
	get_tree().reload_current_scene()
