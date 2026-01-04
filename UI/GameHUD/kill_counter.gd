extends Label

func _ready() -> void:
	var player = get_node("/root/Main/Player")
	player.display_kills.connect(_update_label)
	
	
func _update_label(kills: int) -> void:
	self.text = "#%d" % [kills]
