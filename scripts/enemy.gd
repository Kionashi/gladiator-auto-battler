extends Area2D

@export var enemy_data: EnemyData

@onready var sprite: Sprite2D = $Sprite2D
@onready var label: Label = $Label
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var movement_timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	movement_timer.timeout.connect(_on_movement_timeout)
	sprite.texture = enemy_data.texture
	_set_enemy_size_properties()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_movement_timeout():
	print("moving enemy (%s)",[enemy_data.name])

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
