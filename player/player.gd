extends CharacterBody2D

var speed = 10
var jump_speed = speed * 40
var anim_speed = speed * 0.1

var can_jump = true

var is_ducking = false
var is_sliding = false
var is_getting_up = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
	velocity.y += get_gravity().y * delta


func get_input():	
	var jump = Input.is_action_just_pressed("jump")
	var slide_down = Input.is_action_just_pressed("duck")
	var slide_up = Input.is_action_just_released("duck")
	
	
	if jump and can_jump:
		can_jump = false
		$Anim.play("jump", anim_speed*0.5)
		velocity.y -= jump_speed
		is_ducking = false
	
	elif slide_down and is_on_floor() and not is_sliding and not is_ducking:
		$Anim.play("SlideDown", anim_speed)
		is_ducking = true
		
	elif slide_up and is_on_floor() and is_ducking:
		is_getting_up = true
		is_ducking = false
		is_sliding = false
		$Anim.play("SlideUp")
	
	elif is_on_floor() and not is_ducking:
		print("onfloor")
		can_jump = true
		$Anim.play("run", anim_speed)


func _on_anim_animation_finished() -> void:
	if ($Anim.animation == "SlideDown"):
		$Anim.play("slide")
		is_sliding = true
		
	if ($Anim.animation == "SlideUp"):
		$Anim.play("run")
		is_sliding = false
