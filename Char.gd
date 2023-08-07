extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var smoothRotation = 0.0;
func _ready():
	smoothRotation = $MeshInstance3D2.rotation.y
func _physics_process(delta):
	
