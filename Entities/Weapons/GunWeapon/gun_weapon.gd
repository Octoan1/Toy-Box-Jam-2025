extends Node2D

var level := 0

@export_category("Weapon Settings")
@export var amount: int = 1
@export var bullet_speed: int = 5
@export var attack_damage: int = 1
#@export var size: float = 1
var radius: int = 11
var guns: Array[Node2D] = []

@export_category(("Weapon Type"))
@export var type: PackedScene

signal display_level(level)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_gun(amount)
	
	get_node("/root/Main/UI/LevelUpScreenLayer/LevelUpScreen").upgrade_weapon_3.connect(on_upgrade)



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
	
func on_upgrade() -> void: 
	level += 1
	display_level.emit(level)
	
	if level == 1:
		_enable_weapon()
		return 
	
	if level % 10 == 0:
		add_gun(1)

func _enable_weapon() -> void:
	self.process_mode = Node.PROCESS_MODE_INHERIT
	self.show()
	
	
