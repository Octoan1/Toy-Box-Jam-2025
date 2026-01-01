extends Control

@onready var empty: TextureRect = $Empty
@onready var full: TextureRect = $Full

func set_filled(filled: bool):
	full.visible = filled
	empty.visible = not filled
