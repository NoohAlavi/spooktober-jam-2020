extends KinematicBody2D

export var move_speed = 300;
export var vertical_speed = 300;
export var overground_y = 0;
export var underground_y = 500;
export var max_x = 100;
export var min_x = -100;
var vertical_mode = 0;
var velocity = Vector2()
var touching_vent = false

export var max_cooldown = 5;
var cooldown
var cooldown_label: Label

func _ready():
	cooldown = max_cooldown
	position.y = overground_y;
	$CooldownTimer.connect("timeout", self, "_on_cooldown_timeout")
	cooldown_label = $CanvasLayer/Label

func _process(delta: float) -> void:
	cooldown_label.text = "Cooldown: " + str(cooldown)
	$CanvasLayer/LivesLabel.text = "Lives: " + str($"../../World".lives)

func _physics_process(_delta):
	print(cooldown)
	if (touching_vent && (position.y == overground_y || position.y == underground_y )):
		if (Input.get_action_strength("ui_up")):
			vertical_mode = -1
		elif(Input.get_action_strength("ui_down")):
			vertical_mode = 1
	
	match (vertical_mode):
		0:
			velocity.x = (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")) * move_speed; #Moving
			if ((velocity.x > 0 && position.x > max_x) || (velocity.x < 0 && position.x < min_x)):
				velocity.x = 0; # Restrict Player By Bounds
		-1:
			velocity.x = 0;
			if (position.y < overground_y): 
				position.y = overground_y; # Making sure the player doesnt go past bounds
				vertical_mode = 0; # Resetting vertical mode
		1:
			velocity.x = 0;
			if (position.y > underground_y): 
				position.y = underground_y; # Making sure the player doesnt go past bounds
				vertical_mode = 0; # Resetting vertical mode
			
	velocity.y = vertical_speed * vertical_mode;
	velocity = move_and_slide(velocity);

func set_touching_vent(boolean):
	touching_vent = boolean;

func _on_cooldown_timeout():
	print("lol")
	if cooldown > 0:
		cooldown -= 1
