extends CharacterBody2D

@export var speed = 400
@onready var sprite = $AnimatedSprite2D

func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed
	
	if input_direction != Vector2.ZERO:
		sprite.play("walk")
		
		if input_direction.x != 0:
			sprite.flip_h = input_direction.x < 0  # flip left if moving left
	else:
		sprite.stop()

func _physics_process(_delta):
	get_input()
	move_and_slide()
