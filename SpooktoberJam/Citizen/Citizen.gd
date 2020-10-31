extends Area2D;

export var is_witness: bool = false;
export var velocity: Vector2 = Vector2.ZERO;
export var speed = 10;
export var is_touching_player: bool = false;
var loitering_timer = 0;
export var loitering_time_max = 5;
export var reached_destination: bool = true;
var destinationX = 0;

var player: KinematicBody2D

var rand_nums = [2, 4, 6, 8]

func _ready() -> void:
	speed = (randf()*40) + 20
	connect("body_entered", self, "_on_body_entered");
	connect("body_exited", self, "_on_body_exited");
	player = get_tree().root.get_node("World/Player")

func _process(_delta: float) -> void:
	$"Exclamation Mark".visible = is_witness;
	
	if is_touching_player and Input.is_action_just_pressed("interact"):
		kill()
	
func _physics_process(delta: float) -> void:
	move(delta);
	

func _on_body_entered(body: PhysicsBody2D) -> void:
	if body.name == "Player":
		is_touching_player = true
		print("is_touching_player " + str(is_touching_player) + name);

func _on_body_exited(body: PhysicsBody2D) -> void:
	if body.name == "Player":
		is_touching_player = false
		print("is_touching_player " + str(is_touching_player) + name);
	

func move(dt):
	velocity.x = 0;
	if reached_destination:
		destinationX = rand_range(-1500,1500);
		reached_destination = false;
	
	if (loitering_timer > 0):
		loitering_timer -= dt;
	else:
		if abs(destinationX - position.x) < 10:
			reached_destination = true;
		elif (destinationX > position.x):
			velocity.x = speed;
		elif (destinationX < position.x):
			velocity.x = -speed;
			
	position += (velocity * dt);

func begin_loitering():
	loitering_timer = loitering_time_max;
	

func kill():
	if (player.cooldown == 0):
		if is_inside_tree():
			queue_free()
		else:
			call_deferred("free")
		player.cooldown = player.max_cooldown
