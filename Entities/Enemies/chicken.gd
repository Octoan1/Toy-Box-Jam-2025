extends CharacterBody2D


@export var SPEED: int = 1000

@export var player: Node2D
@export var can_follow: bool = true

@onready var sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	if not player: 
		print("Error: no player")
		return 
		
	if not can_follow:
		return
	
	# get direction of player 
	var direction: Vector2 = player.position - self.position
	direction = direction.normalized()
	
	# move chicken towards player
	self.position += direction * SPEED * delta
	
	move_and_slide()
	
	# handle animation 
	if direction.x < 0:
		self.sprite.flip_h = false
	elif direction.x > 0:
		self.sprite.flip_h = true
