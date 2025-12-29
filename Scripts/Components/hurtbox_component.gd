extends Area2D
class_name HurtboxComponent

@export var health_component : HealthComponent

func _ready() -> void:
	self.monitoring = false
	self.monitorable = true
	
	if not health_component:
		print("Error: HurtboxComponent missing HealthComponent on: " + owner.name)
	


func damage(attack: Attack):
	if health_component:
		health_component.damage(attack)
