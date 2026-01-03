extends Node2D

var level = 0

@export_category("Weapon Settings")
#@export var total: int = 
#@export var speed: int = 5
@export var attack_damage: int = 1
@export var size: float = 1
#@export var radius: int = 15
@export var spawn_time: float = 3.0

@export_category(("Weapon Type"))
@export var type: PackedScene

@export var player: CharacterBody2D


func _ready() -> void:
	var timer : Timer = get_node("SpawnTimer")
	timer.wait_time = spawn_time
	
	get_node("/root/Main/UI/LevelUpScreenLayer/LevelUpScreen").upgrade_weapon_2.connect(on_upgrade)


func _on_spawn_timer_timeout() -> void:
	# spawn bomb on player
	var bomb := type.instantiate()
	bomb.global_position = player.global_position
	bomb.size = size
	get_node("PositionFixTest").call_deferred("add_child", bomb)

func on_upgrade() -> void:
	level += 1
	
	if level % 10 == 0:
		size += 1
	
	spawn_time *= 0.5
	_update_stats()

func _update_stats() -> void:
	var timer : Timer = get_node("SpawnTimer")
	timer.wait_time = spawn_time

	
