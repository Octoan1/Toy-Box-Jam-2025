extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite2D

const SPEED = 2000.0


func _physics_process(delta: float) -> void:
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	# move player
	if direction:
		velocity = direction * SPEED # * delta (move_and_slide() handles delta already)
	else:
		velocity = Vector2.ZERO
	
	print(velocity)

	move_and_slide()

	# handle animation	
	if direction.x < 0:
		self.sprite.flip_h = true
	elif direction.x > 0:
		self.sprite.flip_h = false
