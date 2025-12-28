extends Label

# in seconds
@export var starting_time: int = 300

var time: int

func _ready() -> void:
	time = starting_time
	
	# set label to start time 
	_update_label()

func _on_time_clock_test_timer_timeout() -> void:
	time -= 1
	
	# every time timer changes update label
	_update_label()
	
func _update_label() -> void:
	if time < 0:
		self.text = "-:--"
		return
	
	@warning_ignore("integer_division")
	var minutes: int = time / 60
	var seconds: int = time % 60
	
	self.text = "%d:%02d" % [minutes,seconds]
	
