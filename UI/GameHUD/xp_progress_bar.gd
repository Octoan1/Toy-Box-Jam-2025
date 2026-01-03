extends TextureProgressBar

# for now

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# for now
	var stats = get_node("/root/Main/Player/LevelComponent")
	stats.xp_changed.connect(_on_xp_changed)
	stats.level_up.connect(_on_level_up)

func _on_xp_changed(current, max_xp) -> void:
	self.max_value = max_xp
	self.value = current
	print("xp: ", current, " out of max:", max_xp)

func _on_level_up(level) -> void:
	print("Level up: ", level)
