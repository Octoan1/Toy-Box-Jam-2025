extends Node
class_name LevelComponent

signal xp_changed(current_xp, xp_to_next)
signal level_up(new_level)

var level := 1
var xp := 0
var xp_to_next := 100
var scaler := 1

func add_xp(amount: int):
	xp += amount
	xp_changed.emit(xp, xp_to_next)

	# handle leveling up 
	if xp > xp_to_next:
		xp -= xp_to_next
		level += 1
		
		xp_to_next = int(xp_to_next * scaler)
		xp_changed.emit(xp, xp_to_next)
		level_up.emit(level)
		
