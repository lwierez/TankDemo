extends RigidBody

# Statistics
export(float) var RotationSpeed = .75;
export(float) var Speed = 7.5;

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
