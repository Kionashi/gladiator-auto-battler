extends Node2D

@onready var enemies : Node2D = $Enemies
@onready var gladiators : Node2D = $Gladiators
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for enemy in enemies.get_children():
		enemy.enemy_movement.connect(_move_enemy)
		enemy.enemy_collision.connect(_on_enemy_collision)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_enemy_collision(collisioner: Area2D, enemy: Area2D) -> void:
	

func _move_enemy(enemy: Area2D) -> void:
	var enemy_pos: Vector2 = enemy.global_position
	var nearest_gladiator: Area2D = _get_nearest_gladiator(enemy)
	var direction := enemy_pos.direction_to(nearest_gladiator.global_position)
	print(direction)
	enemy.global_position += direction * 50


func _get_nearest_gladiator(enemy: Area2D) -> Area2D:
	var nearest: Area2D = null
	var shortest_distance := INF
	for gladiator in gladiators.get_children():
		#print("checking gladiator => %s " % gladiator.gladiator_name)
		var distance := enemy.global_position.distance_to(gladiator.global_position)
		#print('distance => %s' % distance)
		if distance < shortest_distance:
			shortest_distance = distance
			nearest = gladiator
	print('nearest gladiator = %s' % nearest.gladiator_name)
	return nearest


	
