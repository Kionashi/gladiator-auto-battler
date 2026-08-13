extends Area2D

@export var stats: CharacterStats

var sprite: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _on_item_drag_started(area: Area2D) -> void:
	pass
	
func _on_item_drag_ended(_area: Area2D, drop_spot: SnappingSpot) -> void:
	print(_area)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
