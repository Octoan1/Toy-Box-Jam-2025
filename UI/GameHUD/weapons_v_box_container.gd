extends VBoxContainer

@onready var weapon_1_label: Label = $Weapon1/Label
@onready var weapon_2_label: Label = $Weapon2/Label
@onready var weapon_3_label: Label = $Weapon3/Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player = get_node("/root/Main/Player")
	
	player.get_node("WeaponOrbit").display_level.connect(_update_label_1)
	player.get_node("BombWeapon").display_level.connect(_update_label_2)
	player.get_node("GunWeapon").display_level.connect(_update_label_3)

func _update_label_1(level) -> void:
	weapon_1_label.text = str(level)
	
func _update_label_2(level) -> void:
	weapon_2_label.text = str(level)
	
func _update_label_3(level) -> void:
	weapon_3_label.text = str(level)
