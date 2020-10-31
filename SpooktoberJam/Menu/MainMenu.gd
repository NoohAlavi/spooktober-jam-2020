extends Control

func _ready() -> void:
	$PlayButton.connect("pressed", self, "play")
	$QuitButton.connect("pressed", self, "quit")

func play():
	get_tree().change_scene("res://World/World.tscn");

func quit():
	get_tree().quit()