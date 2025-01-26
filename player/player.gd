extends CharacterBody2D

var speed = 10
var jump_speed = speed * 65
var anim_speed = speed * 0.1

var can_jump = true
var is_ducking = false
var is_jumping = false

var bubblesScene = preload("res://bubbles-player/bubbles.tscn")
var bubbles

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var bubblesInstance = bubblesScene.instantiate()
	bubblesInstance.init(Vector2(0, 30), 50, 50, 0.00005, 40)
	
	$BubbleCloud.add_child(bubblesInstance)
	$AnimationPlayer.play("run")  # Start with the "run" animation as default.
	$AudioStreamPlayer2D.play()

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
		print("jumping")
		can_jump = false  # Disable jumping until the player is on the ground again
		$AnimationPlayer.play("jump")  # Play the "jump" animation
		$AudioStreamPlayer2D.stop()
		velocity.y -= jump_speed  # Apply vertical speed for jump
		is_ducking = false  # Ensure the ducking state is reset
		is_jumping = true

	# Prevent ducking if already ducking
	elif slide_down and is_on_floor() and not is_ducking:
		$AnimationPlayer.play("SlideDown")  # Play the "SlideDown" animation
		$AudioStreamPlayer2D.stop()
		is_ducking = true
		
	# Handle getting up from ducking
	elif slide_up and is_on_floor() and is_ducking:
		$AnimationPlayer.play("SlideUp")  # Play the "SlideUp" animation
		$AudioStreamPlayer2D.play()
		is_ducking = false

	# Handle regular running state (on the ground)
	elif is_on_floor() and not is_ducking and is_jumping:
		can_jump = true  # Allow jumping again when the player is on the floor
		is_jumping = false
		$AnimationPlayer.play("run")
		$AudioStreamPlayer2D.play()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "SlideDown":
		$AnimationPlayer.play("slide")  # Play the sliding animation
		$AudioStreamPlayer2D.stop()
		is_ducking = true
		
	if anim_name == "SlideUp":
		$AnimationPlayer.play("run")  # Return to running animation after sliding up
		$AudioStreamPlayer2D.play()
		is_ducking = false
	
	if anim_name == "jump":
		is_ducking = false
	
func reduce_life():
	bubbles.popBubbles
	pass
