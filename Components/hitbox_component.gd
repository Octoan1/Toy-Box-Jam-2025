extends Area2D
class_name HitboxComponent


func _ready() -> void:
	self.monitoring = true
	self.monitorable = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("test_attack"):
		#self.proce
		pass
		
func _on_area_entered 
