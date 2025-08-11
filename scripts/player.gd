extends CharacterBody2D

@export var speed = 400
var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect().size # Set size of game screen.

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	
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

func disable_player():
	hide()
	$CollisionShape2D.set_deferred("disabled", true)

func enable_player():
	show()
	$CollisionShape2D.set_deferred("disabled", false)