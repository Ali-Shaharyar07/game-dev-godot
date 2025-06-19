extends PlayerState

@export var sprite : AnimatedSprite2D

func handle_input(_delta):
	#Get direction
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction != 0:
		sprite.play("run")
		player.velocity.x = direction * player.SPEED #Move player
	else:
		print("running->idle")
		player.change_state("Idle") #If no direction, change to idle
	
	#Change to jumping or dashing or attacking
	if Input.is_action_just_pressed("jump") and player.is_on_floor(): 
		print("running->jumping")
		player.change_state("Jumping")
	elif Input.is_action_just_pressed("dash"): 
		print("running->dashing")
		player.change_state("Dashing")
	elif Input.is_action_just_pressed("attack"):
		print("running->attacking")
		player.change_state("Attacking")
