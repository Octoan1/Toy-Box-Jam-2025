extends Node2D

@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var hitbox : HitboxComponent = $ExplosionHitbox
@onready var shape : CollisionShape2D = $ExplosionHitbox/CollisionShape2D

func _ready() -> void: 
	# Hitbox starts disabled
	hitbox.monitoring = false
	shape.disabled = true
	
 
func _on_explode_timer_timeout() -> void:
	sprite.play("explode")
	
	# activate hitbox
	hitbox.monitoring = true
	shape.disabled = false
	


func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()
