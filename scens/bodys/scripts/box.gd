extends CharacterBody2D

var speed = 70
var acceleration = 1000
var friction = 600
var push = false
var move_box = true

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(_delta):
	apply_gravity(_delta)
	if push == true and Input.is_action_pressed("push") : 
		var input_axis = Input.get_axis("ui_left", "ui_right")
		handle_acceleration(input_axis , _delta)
		apply_friction(input_axis , _delta)
	else : velocity.x = 0
	move_and_slide()

func apply_gravity(_delta) :
	if not is_on_floor():
		velocity.y += gravity * _delta

func handle_acceleration(input_axis , _delta) :
	if input_axis != 0:
		velocity.x = move_toward(velocity.x , speed * input_axis , acceleration * _delta)

func apply_friction(input_axis , _delta):
	if input_axis == 0 and is_on_floor() :
		velocity.x = move_toward(velocity.x , 0 , friction)

func _on_area_2d_area_entered(_area):
	push = true

func _on_area_2d_area_exited(_area):
	if move_box == true :
		push = false
