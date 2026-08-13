extends Resource
class_name CharacterStats

signal health_depleted
signal health_changed(current_health: int, max_health: int)

@export var base_max_health: int = 100
@export var base_attack: int = 10
@export var base_defense: int = 10
@export var base_attack_speed: int = 10
@export var has_reach: bool = false

var current_max_health: int = 100
var current_attack: int = 10
var current_defense: int = 10
var current_attack_speed: int = 10

var health: int = 0: set = _on_health_set
var stat_buffs: Array[StatBuff]
func _init() -> void:
	setup_stats.call_deferred()

func add_buff(buff: StatBuff) ->void:
	stat_buffs.append(buff)
	apply_buff(buff)
	
func apply_buff(buff: StatBuff) ->void:
	match buff.stat:
		"health":
			current_max_health = current_max_health + buff.buff_amount
		"attack": 
			current_attack = current_attack + buff.buff_amount
		"defense":
			current_defense = current_defense + buff.buff_amount
		"attack_speed":
			current_attack_speed = current_attack_speed + buff.buff_amount
		_:
			print("unkown buff")
	
func setup_stats() -> void:
	health = current_max_health

func _on_health_set(new_value: int) -> void:
	health = clampi(new_value, 0, current_max_health) 
	if health <= 0:
		health_depleted.emit()
		pass
	health_changed.emit(new_value, current_max_health)
