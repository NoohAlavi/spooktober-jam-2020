extends Node2D

export var citizens_array = [];
export var citizen_scene: PackedScene;

func _ready() -> void:
	for i in range(10):
		spawn_citizen();

func spawn_citizen() -> void:
	var new_citizen: KinematicBody2D = citizen_scene.instance(); 
	var randX = rand_range(-2000, 2000);
	var posY = 448;
	$Citizens.add_child(new_citizen);
	new_citizen.position.x = randX;
	new_citizen.position.y = posY;
	citizens_array.append(new_citizen);
	

func _on_CitizenSpawnTimer_timeout() -> void:
	for i in range(3):
		spawn_citizen();
