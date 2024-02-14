extends CharacterBody2D

@export var speed: int = 35

func handleInput():
	var moveDirection = Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down")
	velocity = moveDirection*speed
	
func _physics_process(delta):
	handleInput()
	move_and_slide()
