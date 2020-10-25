extends KinematicBody2D;

export var is_witness: bool = false;
export var velocity: Vector2 = Vector2.ZERO;

var reached_destination: bool = true;

func _process(_delta: float) -> void:
	$"Exclamation Mark".visible = is_witness;
	
func _physics_process(_delta: float) -> void:
	move();
	
func move():
	if is_witness:
		#move to police station
		pass
	else:
		if reached_destination:
			reached_destination = false;
			var randX = rand_range(-2000, 2000);
			if position.x < randX:
				velocity.x += 20;
			if position.x > randX:
				velocity.y -= 20
			if position.x == randX:
				reached_destination = true;
		#randomly move around
		pass
	velocity = move_and_slide(velocity);
