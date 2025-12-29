extends Node2D

@export_category("Weapon Settings")
@export var amount: int = 1
@export var speed: int = 5
@export var attack_damage: int = 1
@export var size: float = 1
@export var radius: int = 15

@export_category(("Weapon Type"))
@export var type: PackedScene

var balls: Array[Node2D]= []

var t = 0  # keeps track of time

func _ready() -> void:
	for i in amount: 
		var ball := type.instantiate()
		ball.scale = Vector2.ONE * size
		add_child(ball)
		balls.append(ball)


func _process(delta: float) -> void:
	t += delta * speed
	
	var offset = 2*PI / balls.size()
	for i in balls.size():
		var angle = t + offset * i
		balls[i].position.x = radius * sin(angle)
		balls[i].position.y = radius * cos(angle)
	
