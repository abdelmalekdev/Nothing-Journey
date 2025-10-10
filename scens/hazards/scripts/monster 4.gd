extends CharacterBody2D


@onready var starting_position_y = position.y
@onready var starting_position_x = position.x
@onready var ray = $RayCast2D

var ray_detection = true
var play = true



func _physics_process(delta):
	atack()
	idel()
	update_animation()
	
	move_and_slide()

func atack():
	
	if ray.is_colliding() :
		if play == true :
			if ray_detection == true :
				velocity.y = 500
	else : move()
	
	if play == true :
		if is_on_floor() :
			velocity.y = -100
	else : 
		velocity.y = 50
		if is_on_floor() :
			queue_free()

func idel():
	if position.y <= starting_position_y and !ray.is_colliding() and play == true :
		velocity.y = 0


func update_animation():
	if velocity.y == 0 :
		$Animator.play("idel")
	
	if play == false :
		$Animator.play("die")

func move() :
	if play == true :
		if position.x <= starting_position_x or is_on_wall() :
			velocity.x = 50
		if position.x >= starting_position_x + 200 or is_on_wall() :
			velocity.x = -50
	else : velocity.x = 0




func _on_player_kill_area_entered(area):
	play = false

func _on_player_die_area_entered(area):
	ray_detection = false

