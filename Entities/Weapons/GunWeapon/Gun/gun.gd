extends Node2D

@export var fire_rate := 3
@export var bullet_scene: PackedScene
@export var radius := 200.0

@onready var fire_timer := $FireTimer
@onready var owner_node := get_parent() # player

func _ready():
	fire_timer.wait_time = fire_rate
	

func _on_shoot() -> void:
	var target := _get_closest_enemy()
	if target == null:
		return

	var bullet := bullet_scene.instantiate()
	get_node("BulletContainer").add_child(bullet)
	bullet.global_position = global_position
	bullet.direction = (target.global_position - global_position).normalized()

func _get_closest_enemy() -> Node2D:
	var closest = null
	var closest_dist := INF

	for enemy in get_tree().get_nodes_in_group("enemies"):
		if not is_instance_valid(enemy):
			continue

		var dist := global_position.distance_squared_to(enemy.global_position)
		if dist < closest_dist and dist <= radius * radius:
			closest_dist = dist
			closest = enemy

	print(closest)
	return closest
