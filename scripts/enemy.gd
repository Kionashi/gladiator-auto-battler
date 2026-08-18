extends Area2D

@export var enemy_data: EnemyData

signal enemy_movement(enemy: Area2D)
signal enemy_collision(collisioner: Area2D, enemy: Area2D)
 
@onready var sprite: Sprite2D = $Sprite2D
@onready var label: Label = $Label
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var movement_timer: Timer = $Timer

func _ready() -> void:
	self.area_entered.connect(_on_area_entered)
	movement_timer.timeout.connect(_on_movement_timeout)
	sprite.texture = enemy_data.texture
	_set_enemy_size_properties()

func _on_area_entered(area: Area2D) -> void:
	enemy_collision.emit(area, self)

func _on_movement_timeout() -> void:
	enemy_movement.emit(self)

func _set_enemy_size_properties() -> void:
	match enemy_data.size:
		enemy_data.EnemySize.SMALL:
			collision_shape.scale = Vector2(0.5, 0.5)
			sprite.scale = Vector2(0.3, 0.3)
			movement_timer.wait_time = 0.5
		enemy_data.EnemySize.MEDIUM:
			collision_shape.scale = Vector2(1.0, 1.0)
			sprite.scale = Vector2(1.0, 1.0)
			movement_timer.wait_time = 2.0
		enemy_data.EnemySize.BIG:
			collision_shape.scale = Vector2(2.0, 2.0)
			sprite.scale = Vector2(2.0, 2.0)
			movement_timer.wait_time = 5.0
