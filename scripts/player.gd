extends CharacterBody2D

@export var speed = 400
var screen_size
var can_move = true

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
	
	if can_move:	
		if velocity.length() > 0:
			velocity = velocity.normalized() * speed
	elif !can_move:
		velocity = Vector2.ZERO
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	move_and_slide()

func disable_player():
	hide()
	$CollisionShape2D.set_deferred("disabled", true)

func enable_player():
	show()
	$CollisionShape2D.set_deferred("disabled", false)


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()


func _on_animation_player_animation_started(anim_name: StringName) -> void:
	can_move = false
