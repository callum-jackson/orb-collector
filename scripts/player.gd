extends CharacterBody2D

@export var speed = 400 # Set Player movement speed.
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size # Set size of game screen.
	hide_player()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO # The player's movement vector.
	
	# Get key input and set Player's movement direction.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	move_and_slide()

# Disables and hides the Player when called.
func hide_player():
	hide()
	$CollisionShape2D.set_deferred("disabled", true)

# Enables and shows the Player when called.
func show_player():
	show()
	$CollisionShape2D.set_deferred("disabled", false)