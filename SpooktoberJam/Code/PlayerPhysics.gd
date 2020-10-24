extends KinematicBody2D

export var moveSpeed = 300;
var velocity = Vector2()

func _ready():
	pass

func _physics_process(delta):
	velocity.x = (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")) * moveSpeed;
	move_and_slide(velocity);
