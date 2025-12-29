extends Node

@onready var death_screen := $DeathScreenLayer

#func _ready() -> void:
func show_death_screen() -> void:
	death_screen.show()
