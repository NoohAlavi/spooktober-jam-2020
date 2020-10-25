extends Area2D;

export var is_witness: bool = false;
export var velocity: Vector2 = Vector2.ZERO;

var rand_nums = [2, 4, 6, 8]

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
			var randX = rand_range(-2000, 2000) * pow(rand_nums[rand_range(0, 3)], 3.5);
			if position.x < randX:
				velocity.x += 3.5;
			if position.x > randX:
				velocity.x -= 3.5;
			if position.x == randX:
				reached_destination = true;
		#randomly move around
		pass
	position += velocity;
