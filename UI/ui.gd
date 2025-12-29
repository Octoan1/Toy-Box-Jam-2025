extends Node

#signal start_game

@onready var death_screen := $DeathScreenLayer
@onready var start_screen := $StartMenuLayer

#func _ready() -> void:

func show_death_screen() -> void:
	death_screen.show()

	
