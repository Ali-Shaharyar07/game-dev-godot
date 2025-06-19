extends PlayerState
@export var sprite : AnimatedSprite2D 

var idle_time : float

func randomize_animation():
	idle_time = randf_range(7, 10)


func enter_state(player_node):
	super(player_node)
	player.velocity.x = 0
	randomize_animation()

func handle_input(_delta):
	if idle_time > 0:
		idle_time -= _delta
	else:
		sprite.play("idle")
		randomize_animation()
		
	#Change to jump
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		print("idle->jumping")
		player.change_state("Jumping")
		
	#Change to running
	elif Input.get_axis("move_left", "move_right") != 0:
		print("idle->running")
		player.change_state("Running")
	
	#Change to dashing
	elif Input.is_action_just_pressed("dash"):
		print("idle->dashing")
		player.change_state("Dashing")
	
	#Change to attacking
	elif Input.is_action_just_pressed("attack"):
		print("idle->attacking")
		player.change_state("Attacking")
	
