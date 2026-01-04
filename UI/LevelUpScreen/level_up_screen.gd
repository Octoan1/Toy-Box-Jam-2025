extends Control

signal upgrade_weapon_1
signal upgrade_weapon_2
signal upgrade_weapon_3


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("/root/Main/Player/LevelComponent").level_up.connect(on_level_up)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func on_level_up(_level: int) -> void:
	get_parent().show()
	#owner.show()
	self.show()
	get_tree().paused = true


func _on_weapon_button_1_pressed() -> void:
	self.hide()
	upgrade_weapon_1.emit()
	get_tree().paused = false


func _on_weapon_button_2_pressed() -> void:
	self.hide()
	upgrade_weapon_2.emit()
	get_tree().paused = false
	
func _on_weapon_button_3_pressed() -> void:
	self.hide()
	upgrade_weapon_3.emit()
	get_tree().paused = false
