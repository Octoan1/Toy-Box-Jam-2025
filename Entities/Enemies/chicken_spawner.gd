extends Timer

@export var player: CharacterBody2D
@export var enemy_scene: PackedScene

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
var time_scale : int = 1
var blocker : float = 10

func _on_timeout() -> void:
	var enemy = enemy_scene.instantiate()
	enemy.player = player
	
	var dir := Vector2.RIGHT.rotated(randf() * 2 * PI)
	var v := dir * 128
	enemy.global_position = player.global_position + v
	add_child(enemy)
	
	if time_scale > blocker: 
		time_scale -= 10
		wait_time = wait_time * 0.95
		blocker /= 0.95
	time_scale += 1
