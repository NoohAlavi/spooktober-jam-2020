extends Area2D;

export var is_witness: bool = false;
export var velocity: Vector2 = Vector2.ZERO;
export var speed = 10;
export var is_touching_player: bool = false
export var reached_destination: bool = true;

var rand_nums = [2, 4, 6, 8]

func _ready() -> void:
	speed = (randf()*40) + 20
	connect("body_entered", self, "_on_body_entered")
	connect("body_entered", self, "_on_body_exited")

func _process(_delta: float) -> void:
	$"Exclamation Mark".visible = is_witness;
	
	if is_touching_player and Input.is_action_just_pressed("interact"):
		if is_inside_tree():
			queue_free()
		else:
			call_deferred("free")
	
func _physics_process(delta: float) -> void:
	move(delta);
	

func _on_body_entered(body: PhysicsBody2D) -> void:
	if body.name == "Player":
		is_touching_player = true
		print("is_touching_player" + str(is_touching_player) + name);

func _on_body_exited(body: PhysicsBody2D) -> void:
	if body.name == "Player":
		is_touching_player = false
		print("is_touching_player" + str(is_touching_player) + name);
	
func oldmove(dt):
	velocity.x = 0;
	if is_witness:
		if position.x > -2000:
			velocity.x -= speed;
		else:
			velocity.x += speed;
		pass
	else:
		if reached_destination:
			reached_destination = false;
			var randX = rand_range(-1500, 1500) * pow(rand_nums[rand_range(0, 3)], speed);
			if position.x < randX:
				velocity.x += speed;
			if position.x > randX:
				velocity.x -= speed;
			if position.x == randX:
				reached_destination = true;
		#randomly move around
		pass
	position += (velocity * dt);

func move(dt):
	velocity.x = 0;
	if reached_destination:
		reached_destination = false;
		var randX = rand_range(-1500, 1500) * pow(rand_nums[rand_range(0, 3)], speed);
		if position.x < randX:
			velocity.x += speed;
		if position.x > randX:
			velocity.x -= speed;
		if position.x == randX:
			reached_destination = true;
	else:
		if position.x > -2000:
			velocity.x -= speed;
		else:
			velocity.x += speed;
	
	position += (velocity * dt);

