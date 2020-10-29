extends Area2D

# NEWSPAPERS
var newspaperCount;
var images = [];

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

func load_images():
	for number in range(0,4):
		images.append(load("res://Art/newspaper" + str(number) + ".png"));

func update_images():
	$Sprite.texture = images[newspaperCount];

# TIMER
export var cooldownTime = 30

var timer = 0;

# SYSTEMS
func _ready():
	newspaperCount = totalNewspaperCount;
	load_images()
	pass # Replace with function body.
	
func _process(delta):
	update_images()
	if (timer >= cooldownTime):
		fill()
		timer = 0

	timer += delta

func _on_Area2D_area_entered(area):
	if (area.name.left(8) == "@Citizen" || area.name.left(7) == "Citizen"):
		print(area.name + " collding with newspaper ayayay")
		if (newspaperCount > 0):
			print("newspaperCount -= 1");
			newspaperCount -= 1;

func _on_Area2D_area_exited(area):
	pass # Replace with function body.
