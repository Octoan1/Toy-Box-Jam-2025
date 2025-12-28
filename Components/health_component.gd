extends Node2D
class_name HealthComponent

@export var MAX_HEALTH := 10
var health : float

#signal died
signal damaged

func _ready() -> void:
	health = MAX_HEALTH
	
func damage(attack: Attack):
	health -= attack.attack_damage
	print(owner.name + " health is now: "+ str(health))
	
	if health <= 0:
		damaged.emit(attack.attack_damage)
		# death 
		#died.emit()
		owner.queue_free()
