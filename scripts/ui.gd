extends CanvasLayer

# Updates ScoreLabel with the count of remaing Orbs when called.
func update_score_label(score):
	$ScoreLabel.text = "Orbs Remaining: " + str(score)
	
# Updates the Message label when called.
func update_message(message):
	$Message.text = str(message)
	
# Hides the Message label when called.
func hide_message():
	$Message.hide()

# Shows the Message label when called.
func show_message():
	$Message.show()

# Hides the ScoreLabel when called.
func hide_score():
	$ScoreLabel.hide()

# Shows the ScoreLabel when called.
func show_score():
	$ScoreLabel.show()