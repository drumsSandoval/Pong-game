extends CharacterBody2D

var speed = 0
var is_moving = false

func _ready():
	randomize()
	speed = 600
	velocity.x = [-1,1][randi() % 2] * speed
	velocity.y = [-0.8, 0.8][randi() % 2] * speed
	is_moving = true

func _physics_process(delta):
	if is_moving:
		var collide = move_and_collide(velocity * delta)
		if collide:
			velocity = velocity.bounce(collide.get_normal())
