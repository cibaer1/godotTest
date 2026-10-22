extends RigidBody2D

@export var speed: int = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_deferred("freeze", true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var move_vec = Vector2(speed, 0).rotated(rotation)
	global_position += move_vec * delta
