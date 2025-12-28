extends Area2D
class_name HitboxComponent


func _ready() -> void:
	self.monitoring = true
	self.monitorable = false
	
	self.area_entered.connect(_on_hitbox_component_area_entered)


func _on_hitbox_component_area_entered(area: Area2D) -> void: 
	# Check for Hurtbox
	if area is HurtboxComponent:
		var hurtbox : HurtboxComponent = area
		
		var attack = Attack.new()
		attack.attack_damage = 1
		
		hurtbox.damage(attack) 
