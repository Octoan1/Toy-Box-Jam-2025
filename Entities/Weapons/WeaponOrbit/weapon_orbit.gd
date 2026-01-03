extends Node2D

@export_category("Weapon Settings")
@export var total: int = 1
@export var speed: int = 5
@export var attack_damage: int = 1
@export var size: float = 1
@export var radius: int = 15

@export_category(("Weapon Type"))
@export var type: PackedScene

var balls: Array[Node2D]= []

var t = 0  # keeps track of time

func _ready() -> void:
	# spawn balls
	add_ball(total)

		
	get_node("/root/Main/UI/LevelUpScreenLayer/LevelUpScreen").upgrade_weapon_1.connect(on_upgrade)


func _process(delta: float) -> void:
	t += delta * speed
	
	var offset = 2*PI / balls.size()
	for i in balls.size():
		var angle = t + offset * i
		balls[i].position.x = radius * sin(angle)
		balls[i].position.y = radius * cos(angle)
	
func on_upgrade() -> void:
	total += 1
	@warning_ignore("narrowing_conversion")
	speed *= 1.10
	
	add_ball(1)

	
func add_ball(amount: int) -> void:
	for i in amount:
		var ball := type.instantiate()
		ball.scale = Vector2.ONE * size
		call_deferred("add_child", ball)
		
		balls.append(ball)
