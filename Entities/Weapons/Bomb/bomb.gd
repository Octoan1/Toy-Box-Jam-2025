extends Node2D

@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var hitbox : HitboxComponent = $ExplosionHitbox
@onready var shape : CollisionShape2D = $ExplosionHitbox/CollisionShape2D
var size

func _ready() -> void: 
	# Hitbox starts disabled
	hitbox.monitoring = false
	shape.disabled = true
	
 
func _on_explode_timer_timeout() -> void:
	self.scale = Vector2.ONE * size
	sprite.play("explode")
	
	# activate hitbox
	hitbox.monitoring = true
	shape.disabled = false
	


func _on_animated_sprite_2d_animation_finished() -> void:
	if sprite.animation == "explode":
		hitbox.monitoring = false
		shape.disabled = true
		queue_free()
