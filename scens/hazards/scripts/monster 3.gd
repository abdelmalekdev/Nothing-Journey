extends CharacterBody2D


@onready var starting_position_y = position.y
@onready var starting_position_x = position.x
@onready var ray = $RayCast2D

var ray_detection = true
var play = true

func _physics_process(delta):
	idel()
	atack()
	update_animation()
	
	move_and_slide()

func atack():
	
	if ray.is_colliding() :
		if ray_detection == true :
			velocity.y = 250
	
	if play == true :
		if is_on_floor() :
			velocity.y = -100
	else : 
		velocity.y = 50
		if is_on_floor() :
			queue_free()

func idel():
	position.x = starting_position_x
	#if position.y <= starting_position_y and !ray.is_colliding() and play == true :
	#	velocity.y = 0

func update_animation():
	if velocity.y == 0 :
		$Animator.play("idel")
	
	if ray.is_colliding() :
		$Animator.play("atack")

func die():
	play = false
	$Animator.play("die")


func _on_player_die_area_entered(area):
	ray_detection = false
	pass # Replace with function body.
