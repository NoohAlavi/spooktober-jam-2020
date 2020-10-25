extends Area2D

func _on_Vent_body_entered(body):
	if (body.get_name() == "Player"):
		body.set_touching_vent(true);


func _on_Vent_body_exited(body):
	if (body.get_name() == "Player"):
		body.set_touching_vent(false);
