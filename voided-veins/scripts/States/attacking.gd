extends PlayerState
@export var sprite : AnimatedSprite2D 


func enter_state(player_node):
	super(player_node)
	player.velocity.x = 0
	sprite.play("attack")
	Global.isAttacking = true

func handle_input(_delta):
	
	#if animation ended: change to idle
	if !sprite.is_playing():
		Global.isAttacking = false
		print("attacking->idle")
		player.change_state("Idle")
	
