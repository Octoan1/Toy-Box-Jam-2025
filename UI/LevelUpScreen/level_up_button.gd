extends TextureButton

@export var normal_color := Color.WHITE
@export var pressed_color := Color(0.7, 0.7, 0.7) # darker
@export var hover_color := Color(1.2, 1.2, 1.2)

var mat: ShaderMaterial

func _ready():
	modulate = normal_color
	mat = self.material as ShaderMaterial
	
#func _on_pressed():
	#modulate = pressed_color

func _on_button_up():
	modulate = normal_color

func _on_button_down() -> void:
	modulate = pressed_color

func _on_mouse_entered():
	modulate = hover_color
	mat.set_shader_parameter("line_color", Color("fff1e8"))
	mat.set_shader_parameter("line_thickness", 2.0)

func _on_mouse_exited():
	modulate = normal_color
	mat.set_shader_parameter("line_color", Color("1d2b53"))
	mat.set_shader_parameter("line_thickness", 1.0)

#func _on_focus_entered() -> void:
	#modulate = hover_color
