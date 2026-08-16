extends Resource

class_name EnemyData

signal health_depleted
signal health_changed(current_health: float, max_health: float)

enum EnemySize {
	SMALL,
	MEDIUM,
	BIG
}

@export var max_health: float = 100
@export var attack: float = 10
@export var defense: float = 10
@export var attack_speed: float = 10
@export var weakness: CombatTypes.DamageType
@export var texture: Texture2D
@export var name: String
@export var size: EnemySize 

var health: float = 0: set = _on_health_set

func _init() -> void:
	setup_stats.call_deferred()
	
func setup_stats() -> void:
	health = max_health

func _on_health_set(new_value: float) -> void:
	health = clampf(new_value, 0, max_health) 
	if health <= 0:
		health_depleted.emit()
		pass
	health_changed.emit(new_value, max_health)
