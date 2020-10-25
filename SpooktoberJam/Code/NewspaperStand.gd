extends Area2D

# NEWSPAPERS
var newspaperCount;

export var totalNewspaperCount = 3;

func has_newspapers():
	return newspaperCount != 0;

func is_full():
	return newspaperCount == totalNewspaperCount;

func is_empty():
	return newspaperCount == 0;

func empty():
	newspaperCount = 0;

func fill():
	newspaperCount = totalNewspaperCount;

# TIMER
export var cooldownTime = 30

var timer = 0;

# SYSTEMS
func _ready():
	newspaperCount = totalNewspaperCount;
	
	pass # Replace with function body.
func _process(delta):
	if (timer >= cooldownTime):
		fill()
		timer = 0

	timer += delta






# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
