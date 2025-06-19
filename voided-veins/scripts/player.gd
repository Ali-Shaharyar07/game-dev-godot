extends CharacterBody2D
const SPEED = 80.0
const JUMP_VELOCITY = -230.0
var current_state
var last_dir = 1 # -1, 0, 1  | L, Idle, R
@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	print("init idle")
	change_state("Idle") #start in idle

func change_state(new_state : String):
	if current_state:
		current_state.exit_state() #exit current state
	current_state = get_node(new_state)
	if current_state: #if new state exists
		current_state.enter_state(self) #enter new state


func _physics_process(delta: float) -> void:
	#Get direction
	var direction = Input.get_axis("move_left", "move_right") 
	
	if direction != 0: last_dir = sign(direction)
	
	#Add gravity
	if not is_on_floor(): velocity += get_gravity() * delta
	
	#Ensure a state is active
	if current_state:
		current_state.handle_input(delta)
	move_and_slide()
	
	#Flip sprite
	if direction >= 1 and !Global.isAttacking: 
		sprite.flip_h = false
	elif direction <= -1 and !Global.isAttacking: 
		sprite.flip_h = true
