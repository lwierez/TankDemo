extends Spatial

# Statistics
export(float) var RotationSpeed = 5;
export(float) var Speed = 5;

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
	pass

func _physics_process(delta):
	var Inputs = Vector2( Input.get_action_strength("ui_left") - Input.get_action_strength("ui_right"), Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down") )
	
	translate( Vector3.FORWARD * Speed * delta * Inputs.y )
	rotate( Vector3.UP, RotationSpeed * delta * Inputs.x )
