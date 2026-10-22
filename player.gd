extends RigidBody2D

@export var speed: int = 80
@export var bullet_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
	

func _physics_process(delta: float) -> void:
	calculate_movement()
	look_at(get_global_mouse_position())
	
func calculate_movement():
	var Movement = Vector2(0, 0)
	
	if Input.is_action_pressed("MoveN"):
		Movement += Vector2(0, -1)
	if Input.is_action_pressed("MoveS"):
		Movement += Vector2(0, 1)
	if Input.is_action_pressed("MoveE"):
		Movement += Vector2(1, 0)
	if Input.is_action_pressed("MoveW"):
		Movement += Vector2(-1, 0)
		
	apply_central_force(Movement.normalized() * speed)
		
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Shoot"):
		shoot()
func shoot() -> void:
	var bullet = bullet_scene.instantiate()
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = global_position
	bullet.global_rotation = global_rotation
	
