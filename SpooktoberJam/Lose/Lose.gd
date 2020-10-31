extends Control

func _ready():
	$Button.connect("pressed", self, "_on_button_pressed")

func _on_button_pressed():
	get_tree().change_scene("Menu/MainMenu.tscn")