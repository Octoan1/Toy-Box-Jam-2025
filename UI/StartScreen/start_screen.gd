extends Control

signal start_game

func _ready() -> void:
	self.visible = true

func _on_play_button_pressed() -> void:
	start_game.emit()
	hide()


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_info_button_pressed() -> void:
	print("only nerds want info")
