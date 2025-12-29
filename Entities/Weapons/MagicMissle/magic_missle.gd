extends Node2D


@export_category("Weapon Settings")
#@export var amount: int = 1
@export var speed: float = .5
@export var attack_damage: int = 1
@export var size: float = 1
#@export var radius: int = 15

#@export_category(("Weapon Type"))
#@export var type: PackedScene


func _process(_delta: float) -> void:
	# get mouse coords 
	var mouse_pos: Vector2 = get_global_mouse_position()

	# get direction to mouse
	var direction: Vector2 = (mouse_pos - self.global_position).normalized()
	
	# move towards mouse
	self.global_position += direction * speed
