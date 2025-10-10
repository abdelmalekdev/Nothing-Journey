extends CharacterBody2D


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var starting_position_y = position.y
@onready var starting_position_x = position.x
@onready var ray = $RayCast2D

var speed = 100 
var dir = -1

var play = true

func _physics_process(delta):
	apply_garavity(delta)
	move()
	update_animation()
	
	move_and_slide()

func apply_garavity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

func move():
	if !play : return

	if is_on_wall() or !ray.is_colliding() :
		dir *= -1
	
	if is_on_floor() :
		velocity.x = speed * dir
	else : velocity.x = 0
	




func update_animation():
	if velocity.x == 0 :
		$Animator.play("idel")
	else : $Animator.play("move")
	
	if play == false :
		$Animator.play("die")

func die() :
	play = false
	velocity.x = 0
	if $dietimer.is_stopped() :
		$dietimer.start()

func _on_player_kill_area_entered(area):
	if not area is player :
		die()
	pass




func _on_dietimer_timeout():
	queue_free()

