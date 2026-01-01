extends HBoxContainer

var player: CharacterBody2D

@onready var hearts := []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var health = get_node("/root/Main/Player/HealthComponent")
	health.damaged.connect(_update_hearts)
	
	hearts = get_children()

var current = 2
func _update_hearts() -> void:
	hearts[current].set_filled(false)
	if current > 0: 
		current -= 1
