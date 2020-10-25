extends KinematicBody2D;

export var is_witness: bool = false;
export var velocity: Vector2 = Vector2.ZERO;


func _process(_delta: float) -> void:
	$"Exclamation Mark".visible = is_witness;
	
func _physics_process(_delta: float) -> void:
	move();
	
func move():
	if is_witness:
		#move to police station
		pass
	else:
		var randX = rand_range(-2000, 2000);
		#velocity.x = lerp()
		#randomly move around
		pass
	move_and_slide(velocity);