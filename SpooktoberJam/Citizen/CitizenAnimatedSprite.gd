extends AnimatedSprite
export var update_time = 0.1;
var timer;
var prev_pos = Vector2();
func _ready():
	playing = true
	timer = 0.0;

func _process(delta):
	if (timer > update_time):
		var current_pos = get_parent().position;
		if (current_pos != prev_pos):
			animation = "walk";
			flip_h = current_pos.x - prev_pos.x < 0 
		else:
			animation = "idle";
		prev_pos = current_pos;
		timer = 0;
	timer += delta;
	
