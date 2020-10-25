extends Node2D;

export var citizens_array = [];
export var citizen_scene: PackedScene;

func _ready() -> void:
	randomize();
	for _i in range(10):
		spawn_citizen((rand_range(0,1) > 0.25));

func spawn_citizen(is_witness = false) -> void:
	var new_citizen: Area2D = citizen_scene.instance(); 
	var randX = rand_range(-2000, 2000);
	var posY = 480;
	new_citizen.is_witness = is_witness;
	$Citizens.add_child(new_citizen);
	new_citizen.position.x = randX;
	new_citizen.position.y = posY;
	citizens_array.append(new_citizen);
	

func _on_CitizenSpawnTimer_timeout() -> void:
	for _i in range(3):
		spawn_citizen();
