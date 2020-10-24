extends Area2D

# NEWSPAPERS
var newspaperCount;

export var totalNewspaperCount = 3;

func hasNewspapers():
	return newspaperCount != 0;

func isFull():
	return newspaperCount == totalNewspaperCount;

func isEmpty():
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
