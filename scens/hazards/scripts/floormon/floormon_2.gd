extends CharacterBody2D


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var collp1 = $"areas/player die/CollisionPolygon2D"
@onready var collp2 = $"areas/player die/CollisionPolygon2D2"
@onready var collp3 = $"areas/player die/CollisionShape2D"
@onready var starting_position_y = position.y
@onready var starting_position_x = position.x
@onready var ray = $RayCast2D
@onready var ray2 = $RayCast2D3


var speed = 40
var dir = -1
var hit = 4

var area_exit = true
var alive = true
var play = true

func _ready():
	collp1.disabled = false
	collp2.disabled = false
	collp3.disabled = false

func _physics_process(delta):
	apply_garavity(delta)
	move()
	update_animation()
	move_and_slide()

func apply_garavity(_delta):
	if not is_on_floor():
		velocity.y += gravity * _delta

func move():
	if !play : return
	if hit == 4 :
		collp1.disabled = true
		collp2.disabled = true
		collp3.disabled = false
		if is_on_wall() or !ray.is_colliding() or ray2.is_colliding()  :
			dir *= -1
		
		if is_on_floor() :
			velocity.x = speed * dir
			if $walk.playing == false :
				$walk.play()
		else : 
			velocity.x = 0
			$walk.stop()
		
	elif hit == 3 :
		velocity.x = 0
		collp1.disabled = true
		collp2.disabled = true
		collp3.disabled = true
		if $dietimer.is_stopped() :
			$dietimer.start()
		
	elif hit == 2 :
		collp1.disabled = false
		collp2.disabled = false
		collp3.disabled = false
		if is_on_wall() :
			dir *= -1
		
		if is_on_floor() :
			velocity.x = (speed+110) * dir
			
	elif hit == 1 :
		velocity.x = 0
		if $dietimer.is_stopped() :
			$dietimer.start()
		
	elif hit == 0 :
		hit = 4



func update_animation():
	if dir != 0 :
		$particles.direction.x = dir*-1
	
	if hit == 4 :
		$Animator.play("move")
		$particles.emitting = true
	elif hit == 3 :
		$Animator.play("midie")
		$particles.emitting = false
	elif hit == 2 :
		$Animator.play("slide")
		$particles.emitting = true
		$particles.speed_scale = 0.6
	else :
		$particles.emitting = false
	
	
	if play == false :
		$Animator.play("die")

func die() :
	play = false
	velocity.x = 0
	if $dietimer.is_stopped() :
		$dietimer.start()

func _on_player_kill_area_entered(_area):
	if area_exit == true :
		area_exit = false
		if hit != 0 :
			hit -= 1
			$die.play()
	
	






func _on_dietimer_timeout():
	if hit == 3 :
		hit += 1
	elif hit == 1 :
		hit = 4



func _on_player_kill_area_exited(_area):
	area_exit = true
	pass # Replace with function body.
