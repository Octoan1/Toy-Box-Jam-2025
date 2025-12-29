extends ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


var test = 0 
var inc = 1
func _on_progress_bar_test_timer_timout() -> void:
	if test > 110:
		#test = 0
		inc = -1
	
	if test < -10:
		inc = 1
		
	test += inc
	self.value = test
