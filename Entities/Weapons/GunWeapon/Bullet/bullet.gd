extends Node2D

@export var speed := 30.0
var direction := Vector2.ZERO

@onready var hitbox := $HitboxComponent

func _process(delta: float) -> void:
	position += direction * speed * delta
	

func _on_hit(area: Area2D) -> void:
	if area is HurtboxComponent:
		queue_free()
