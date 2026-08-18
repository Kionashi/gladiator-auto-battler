extends Resource
class_name CharacterData

signal health_depleted
signal health_changed(current_health: float, max_health: float)

@export var base_max_health: float = 100
@export var base_attack: float = 10
@export var base_defense: float = 10
@export var base_attack_speed: float = 10
@export var has_reach: bool = false

var current_max_health: float = 100
var current_attack: float = 10
var current_defense: float = 10
var current_attack_speed: float = 10

var health: float = 0: set = _on_health_set
func _init() -> void:
	setup_stats.call_deferred()

func setup_stats() -> void:
	health = current_max_health

func _on_health_set(new_value: float) -> void:
	health = clampf(new_value, 0, current_max_health) 
	if health <= 0:
		health_depleted.emit()
		pass
	health_changed.emit(new_value, current_max_health)
