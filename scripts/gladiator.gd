extends Area2D

@export var character_data: CharacterData

@onready var sprite: Sprite2D = $Sprite2D
@onready var drop_zone: DropZone = $DropZone
@onready var label: Label = $Label

var gladiator_name: String

const GLADIATOR_NAMES = [
	"Brutus",
	"Cassius",
	"Gaius",
	"Titus",
	"Maximus",
	"Varro",
	"Lucius",
	"Drusus",
	"Octavius",
	"Aurelius",
	"Rufus",
	"Marcellus",
	"Felix",
	"Flavius",
    "Decimus"
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	if (!character_data):
		print('NO CHARACTER DATA')
	label.text = GLADIATOR_NAMES.pick_random()
	if !sprite:
		print('sprite not found')
	if drop_zone:
		drop_zone.drop_accepted.connect(_on_drop_accepted)
	else:
		print('no drop zone')
	gladiator_name = label.text

func _on_drop_accepted(zone: DropZone, area: Area2D, plan: DropPlan) -> void:
	print('drop accepted')
	print(area.weapon_data.name)
	_equip_weapon(area)
	
func _equip_weapon(weapon: Area2D) -> void:
	sprite.texture = weapon.weapon_data.gladiator_texture
	_update_stats(weapon.weapon_data)
	weapon.queue_free()
	
func _update_stats(weapon_data: WeaponData) -> void:
	character_data.current_attack = character_data.base_attack + weapon_data.attack
	character_data.current_defense = character_data.base_defense + weapon_data.defense
	character_data.current_attack_speed = character_data.base_attack_speed + weapon_data.attack_speed
	character_data.has_reach = weapon_data.reach
	
