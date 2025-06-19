extends PlayerState

const DASH_SPEED = 500.0 #Speed of dash
const DASH_DURATION = 0.05 #Time for dash to last
var dash_timer = 0.0

@export var sprite : AnimatedSprite2D

func enter_state(player_node):
	super(player_node)
	
	var direction = Input.get_axis("move_left", "move_right")

	if direction == 0: direction = player.last_dir
	sprite.play("dash")
	player.velocity.x = direction * DASH_SPEED
	dash_timer = DASH_DURATION
	
func handle_input(delta):
	dash_timer -= delta
	if dash_timer <= 0:
		
		if Input.get_axis("move_left", "move_right") != 0:
			print("dashing->running")
			player.change_state("Running")
		else:
			print("dashing->idle")
			player.change_state("Idle")
