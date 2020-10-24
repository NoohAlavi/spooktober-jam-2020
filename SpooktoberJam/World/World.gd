extends Node2D

export var citizens_array = [];
export var citizen_scene: PackedScene;

func spawn_citizen() -> void:
	var new_citizen = citizen_scene.instance(); 
