extends Resource
class_name WeaponStats

@export var attack: float
@export var attack_speed: float
@export var defense: float
@export var reach: bool

func _init(_attack: float = 10.0, _defense: float = 10.0, _attack_speed: float = 1.0, _reach = false) -> void:
	attack = _attack
	defense = _defense
	attack_speed = _attack_speed
	reach = _reach
