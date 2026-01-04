extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var health_component: HealthComponent = $HealthComponent

@export var SPEED = 30
var kills := 0

signal player_died
signal display_kills(kills)

func _ready() -> void:
	health_component.died.connect(_on_player_died)
	health_component.damaged.connect(_on_player_damaged)

func _physics_process(_delta: float) -> void:
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	# move player
	if direction:
		velocity = direction * SPEED # * delta (move_and_slide() handles delta already)
	else:
		velocity = Vector2.ZERO

	move_and_slide()

	# handle animation	
	if direction.x < 0:
		self.sprite.flip_h = true
	elif direction.x > 0:
		self.sprite.flip_h = false

func _on_player_died():
	print("Player died")
	$/root/Main/UI/DeathScreenLayer/DeathScreen.show()
	player_died.emit()
	
func _on_player_damaged() -> void:
	get_node("Damaged").visible = true
	await get_tree().create_timer(0.1).timeout# await timer timout 0.1 sec
	get_node("Damaged").visible = false

func add_kill(amount: int) -> void:
	kills += amount
	display_kills.emit(kills)
