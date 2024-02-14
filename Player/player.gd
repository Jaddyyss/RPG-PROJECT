extends CharacterBody2D

@export var speed: int = 35
@onready var animations = $AnimationPlayer

#Gets keyboard Input
func handleInput():
	var moveDirection = Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down")
	velocity = moveDirection*speed

#Handles walk animation
func updateAnimation():
	if velocity.length() == 0:
		if animations.is_playing():
			animations.stop()
	else:
		var direction = "Down"
		if velocity.x < 0: direction = "Left"
		elif velocity.x > 0: direction = "Right"
		elif velocity.y < 0: direction = "Up"
	
		animations.play("walk" + direction)
	
func _physics_process(delta):
	handleInput()
	move_and_slide()
	updateAnimation()
