extends Resource
class_name StatBuff

@export var stat: String
@export var buff_amount: float

func _init(_stat: String = "health", _buff_amount: float = 1.0) -> void:
	stat = _stat
	buff_amount = _buff_amount
