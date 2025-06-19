extends PlayerState
const SPEED_REDUCTION = 0.8 #Mid-air speed reduction modifier
@export var sprite : AnimatedSprite2D

func enter_state(player_node):
	super(player_node)
	sprite.play("jump")
	player.velocity.y = player.JUMP_VELOCITY

func handle_input(_delta):
	#Mid-air direction change
	var direction = Input.get_axis("move_left", "move_right")
	if direction != 0:	player.velocity.x = direction * player.SPEED * SPEED_REDUCTION 
	
	#change back to idle if on ground
	if player.is_on_floor():
		print("jumping->idle")
		sprite.play("idle")
		player.change_state("Idle")
	
	#if dashed pressed, change to dash state
	elif Input.is_action_just_pressed("dash"):
		print("jumping->dashing")
		player.change_state("Dashing")
