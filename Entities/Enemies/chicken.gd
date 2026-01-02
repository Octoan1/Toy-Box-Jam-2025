extends CharacterBody2D


@export var SPEED: int = 15

@export var player: CharacterBody2D
@export var can_follow: bool = true

@onready var sprite: Sprite2D = $Sprite2D
@onready var health_component: HealthComponent = $HealthComponent

func _ready() -> void:
	health_component.died.connect(_on_chicken_died)


func _process(_delta: float) -> void:
	if not player: 
		print("Error: ", self.name, " - has no player")
		return 
		
	if not can_follow:
		return
	
	# get direction of player 
	var direction: Vector2 = player.position - self.position
	direction = direction.normalized()
	
	# move chicken towards player
	self.velocity = direction * SPEED
	
	move_and_slide()
	
	# handle animation 
	if direction.x < 0:
		self.sprite.flip_h = false
	elif direction.x > 0:
		self.sprite.flip_h = true

func _on_chicken_died():
	print(self.name + " died")
	player.get_node("LevelComponent").add_xp(10)
	print(player.get_node("LevelComponent").level)
	queue_free()


func _on_chicken_damaged() -> void:
	get_node("DamagedSprite2D").visible = true
	await get_tree().create_timer(0.1).timeout# await timer timout 0.1 sec
	get_node("DamagedSprite2D").visible = false
