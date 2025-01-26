extends CharacterBody2D

var speed = 10
var jump_speed = speed * 40
var anim_speed = speed * 0.1

var can_jump = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if is_on_floor():
		can_jump = true
		$Anim.play("run", anim_speed)
	
	print(velocity.y)
	get_input()
	move_and_slide()
	
	velocity.y += get_gravity().y * delta

func get_input():	
	var jump = Input.is_action_just_pressed("jump")
	var left = Input.is_action_pressed("duck")
	
	if jump:
		can_jump = false
		$Anim.play("jump", anim_speed*0.5)
		velocity.y -= jump_speed
