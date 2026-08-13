extends Area2D

@export var stats: CharacterStats

var sprite: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var drop_zone = self.find_child("DropZone")
	if drop_zone:
		drop_zone.drop_accepted.connect(_on_drop_accepted)
	else:
		print('no drop zone')

func _on_drop_accepted(zone: DropZone, area: Area2D, plan: DropPlan) -> void:
	print('drop accepted')
	print(area)
