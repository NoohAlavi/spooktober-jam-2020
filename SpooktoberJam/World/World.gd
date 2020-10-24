extends Node2D

export var citizens_array = [];
export var citizen_scene: PackedScene;

func _ready() -> void:
	for i in range(10):
		spawn_citizen();

func spawn_citizen() -> void:
	var new_citizen = citizen_scene.instance(); 
	$Citizens.add_child(new_citizen);
	citizens_array.append(new_citizen);


func _on_CitizenSpawnTimer_timeout() -> void:
	for i in range(3):
		spawn_citizen();
