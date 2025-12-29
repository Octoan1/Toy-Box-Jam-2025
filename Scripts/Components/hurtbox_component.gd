extends Area2D
class_name HurtboxComponent

@export var health_component : HealthComponent

func _ready() -> void:
	self.monitoring = false
	self.monitorable = true


func damage(attack: Attack):
	if health_component:
		health_component.damage(attack)
