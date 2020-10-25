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

func _on_Area2D_area_entered(area):
	if (area.name == "Citizen"):
		if (newspaperCount > 0):
			newspaperCount -= 1;

func _on_Area2D_area_exited(area):
	pass # Replace with function body.
