extends RigidBody

# Statistics
export(float) var RotationSpeed = 20000
export(float) var MaxRotationSpeed = .8
export(float) var Speed = 50000
export(float) var MaxSpeed = 8

# Components
var Base
var Turret
var Canon


func _ready():
	# Defining components
	Base = get_node("Base")
	Turret = get_node("Base/Turret")
	Canon = get_node("Base/Turret/Canon")

func _process(delta):
	var player_inputs = Vector2( Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"), Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down") )
	
	if linear_velocity.length() < MaxSpeed:
		add_central_force(-global_transform.basis.z * Speed * player_inputs.y)
	
	if angular_velocity.length() < MaxRotationSpeed:
		add_force(-global_transform.basis.z * RotationSpeed * abs(player_inputs.x), global_transform.basis.x / 2 * -sign(player_inputs.x))
		add_force(global_transform.basis.z * RotationSpeed * abs(player_inputs.x), global_transform.basis.x / 2 * sign(player_inputs.x))
