extends Area2D

@export var weapon_data: WeaponData
@onready var sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	print('weapon ready')
	sprite.texture = weapon_data.inventory_texture
		
	var draggable_node = self.find_child("Draggable")
	if draggable_node:
		draggable_node.drag_ended.connect(_on_item_drag_ended)
		draggable_node.drag_started.connect(_on_item_drag_started)
	else:
		print('no draggable node')

func _on_item_drag_started(area: Area2D) -> void:
	print('drag started')
	pass
	
func _on_item_drag_ended(_area: Area2D, drop_spot: SnappingSpot) -> void:
	print('drag ended (weapon)')

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
