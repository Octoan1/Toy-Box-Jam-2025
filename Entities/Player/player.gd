extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite2D

const SPEED = 50.0
#const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	# move player
	if direction:
		self.position += direction * SPEED * delta

	move_and_slide()

	# handle animation	
	if direction.x < 0:
		self.sprite.flip_h = true
	elif direction.x > 0:
		self.sprite.flip_h = false
