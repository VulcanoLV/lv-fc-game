extends CharacterBody2D

@onready var body = $Body
@onready var legs = $Legs
@onready var anim = $AnimationManager

@onready var col = $CollisionShape2D

const SPEED = 300
var player_rot :Vector2
var direction :Vector2

func get_mouse_rotation():
	player_rot = get_global_mouse_position()
	return player_rot

func get_input():
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if Input.is_action_just_pressed("move_dodge"):
		var opposite_direction = (global_position - get_mouse_rotation()).normalized()
		opposite_direction = opposite_direction * 2.5
		velocity = opposite_direction * SPEED
		
	elif direction:
		
		velocity = direction * SPEED
		var degrees = snappedf(rad_to_deg(direction.angle()),1)
		print(degrees)
	
		legs.rotation_degrees = degrees
		

	else:
		velocity = lerp(velocity, Vector2.ZERO, 0.3)
	
	if Input.is_action_just_pressed("ui_click"):
		anim.punch()
		

func _physics_process(delta: float) -> void:
	
	body.look_at(get_mouse_rotation())
	col.look_at(get_mouse_rotation())
	get_input()
	move_and_slide()
