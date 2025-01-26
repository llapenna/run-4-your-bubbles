extends CharacterBody2D

var speed = 10
var jump_speed = speed * 40
var anim_speed = speed * 0.1

var can_jump = true
var is_ducking = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("run")  # Start with the "run" animation as default.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
	velocity.y += get_gravity().y * delta

func get_input():    
	var jump = Input.is_action_just_pressed("jump")
	var slide_down = Input.is_action_just_pressed("duck")
	var slide_up = Input.is_action_just_released("duck")
	
	# Handle jumping
	if jump and can_jump and is_on_floor():  # Only allow jump if on the ground
		can_jump = false  # Disable jumping until the player is on the ground again
		$AnimationPlayer.play("jump")  # Play the "jump" animation
		velocity.y -= jump_speed  # Apply vertical speed for jump
		is_ducking = false  # Ensure the ducking state is reset

	# Prevent ducking if already ducking
	elif slide_down and is_on_floor() and not is_ducking:
		$AnimationPlayer.play("SlideDown")  # Play the "SlideDown" animation
		is_ducking = true
		
	# Handle getting up from ducking
	elif slide_up and is_on_floor() and is_ducking:
		$AnimationPlayer.play("SlideUp")  # Play the "SlideUp" animation
		is_ducking = false

	# Handle regular running state (on the ground)
	elif is_on_floor() and not is_ducking:
		can_jump = true  # Allow jumping again when the player is on the floor
		$AnimationPlayer.play("run", anim_speed)  # Play the "run" animation


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	#if anim_name == "jump":
		#if is_on_floor():
			#$AnimationPlayer.play("run")  # Return to "run" animation once the jump is finished
			#can_jump = true  # Re-enable jumping when the player is back on the ground
	
	if anim_name == "SlideDown":
		$AnimationPlayer.play("slide")  # Play the sliding animation
		is_ducking = true
		
	if anim_name == "SlideUp":
		$AnimationPlayer.play("run")  # Return to running animation after sliding up
		is_ducking = false
