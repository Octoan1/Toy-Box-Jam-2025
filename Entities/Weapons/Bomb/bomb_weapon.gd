extends Node2D

@export_category("Weapon Settings")
@export var total: int = 1
@export var speed: int = 5
@export var attack_damage: int = 1
@export var size: float = 1
@export var radius: int = 15

@export_category(("Weapon Type"))
@export var type: PackedScene

@export var player: CharacterBody2D


func _on_spawn_timer_timeout() -> void:
	# spawn bomb on player
	var bomb := type.instantiate()
	bomb.global_position = player.global_position
	get_node("PositionFixTest").call_deferred("add_child", bomb)

	
