extends Node2D

@onready var UI = $UI
@onready var player = $Player


func _ready() -> void:
	player.player_died.connect(_on_player_death)
	
	$UI/StartMenuLayer/StartMenu.start_game.connect(_on_game_start)
	
	get_tree().paused = true


func _on_game_start() -> void:
	get_tree().paused = false
	
func _on_player_death() -> void:
	# Pause the entire game
	get_tree().paused = true
	
	# Show death screen 
	UI.show_death_screen()
