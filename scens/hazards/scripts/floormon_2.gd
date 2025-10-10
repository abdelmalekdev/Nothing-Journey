extends CharacterBody2D


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var collp1 = $"areas/player die/CollisionPolygon2D"
@onready var collp2 = $"areas/player die/CollisionPolygon2D2"
@onready var starting_position_y = position.y
@onready var starting_position_x = position.x
@onready var ray = $RayCast2D

var speed = 50
var dir = -1
var hit = 4

var area_exit = true
var alive = true
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
	if hit == 4 :
		collp1.disabled = true
		collp2.disabled = true
		if is_on_wall() or !ray.is_colliding() :
			dir *= -1
		
		if is_on_floor() :
			velocity.x = speed * dir
		else : velocity.x = 0
		
	elif hit == 3 :
		velocity.x = 0
		if $dietimer.is_stopped() :
			$dietimer.start()
		
	elif hit == 2 :
		collp1.disabled = false
		collp2.disabled = false
		if is_on_wall() :
			dir *= -1
		
		if is_on_floor() :
			velocity.x = 250 * dir
			
	elif hit == 1 :
		velocity.x = 0
		if $dietimer.is_stopped() :
			$dietimer.start()
		
	elif hit == 0 :
		hit = 4



func update_animation():
	if hit == 4 :
		$Animator.play("move")
	elif hit == 3 :
		$Animator.play("midie")
	elif hit == 2 :
		$Animator.play("slide")
	
	
	if play == false :
		$Animator.play("die")

func die() :
	play = false
	velocity.x = 0
	if $dietimer.is_stopped() :
		$dietimer.start()

func _on_player_kill_area_entered(area):
	if area_exit == true :
		area_exit = false
		if hit != 0 :
			hit -= 1
	
	






func _on_dietimer_timeout():
	if hit == 3 :
		hit += 1
	elif hit == 1 :
		hit = 4



func _on_player_kill_area_exited(area):
	area_exit = true
	pass # Replace with function body.
