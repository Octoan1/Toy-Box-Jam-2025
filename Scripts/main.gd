extends Node2D

@onready var UI = $UI
@onready var player = $Player


func _ready() -> void:
	player.player_died.connect(_on_player_death)


#func _process(delta: float) -> void:
	#pass
	
func _on_player_death() -> void:
	# Pause the entire game
	get_tree().paused = true
	
	# Show death screen 
	UI.show_death_screen()
