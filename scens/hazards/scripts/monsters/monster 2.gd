extends CharacterBody2D


@onready var starting_position_y = position.y
@onready var starting_position_x = position.x
@onready var ray = $RayCast2D

var ray_detection = true
var play = true


func _physics_process(_delta):
	idel()
	atack()
	update_animation()
	
	move_and_slide()

func atack():
	if ray.is_colliding() :
		if ray_detection == true :
			$attack.play()
			velocity.y = 200
	
	if play == true :
		if is_on_floor() :
			velocity.y = -140
	else : 
		velocity.y = 100
		if is_on_floor() :
			$Animator.play("die")
			play = true

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
	$Animator.play("down")


func _on_player_kill_area_entered(_area):
	$die.play()
	die()

func _on_player_die_area_entered(_area):
	#if area is player or area.is_in_group("floormon") :
		ray_detection = false
