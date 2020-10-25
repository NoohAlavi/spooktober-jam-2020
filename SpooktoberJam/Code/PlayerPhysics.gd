extends KinematicBody2D

export var move_speed = 300;
export var vertical_speed = 300;
export var overground_y = 0;
export var underground_y = 500;
var vertical_mode = 0;
var velocity = Vector2()
var touchingVent = false


func _ready():
	
	pass

func _physics_process(delta):
	if (touchingVent):
		if (Input.get_action_strength("ui_up")):
			vertical_mode = -1
		elif(Input.get_action_strength("ui_down")):
			vertical_mode = 1
	
	match (vertical_mode):
		0:
			velocity.x = (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")) * moveSpeed; #Moving
		-1:
			if (position.y < overground_y): 
				position.y = overground_y; # Making sure the player doesnt go past bounds
				vertical_mode = 0; # Resetting vertical mode
		1:
			if (position.y > underground_y): 
				position.y = underground_y; # Making sure the player doesnt go past bounds
				vertical_mode = 0; # Resetting vertical mode
			
	velocity.y = vertical_speed * vertical_mode;
	move_and_slide(velocity);


