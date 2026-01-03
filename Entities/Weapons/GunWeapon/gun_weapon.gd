extends Node2D

@export_category("Weapon Settings")
@export var amount: int = 1
@export var bullet_speed: int = 5
@export var attack_damage: int = 1
#@export var size: float = 1
var radius: int = 11
var guns: Array[Node2D] = []

@export_category(("Weapon Type"))
@export var type: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_gun(amount)


func add_gun(quantity: int) -> void:
	for i in quantity:
		var gun := type.instantiate()
		call_deferred("add_child", gun)
		guns.append(gun)
	
	
	var offset = 2*PI / guns.size()
	for i in guns.size():
		var angle = offset * i
		guns[i].position.x = radius * cos(angle)
		guns[i].position.y = radius * sin(angle)
	
