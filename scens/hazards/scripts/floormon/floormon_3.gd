extends CharacterBody2D


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var starting_position_y = position.y
@onready var starting_position_x = position.x
@onready var ray = $RayCast2D
@onready var ray2 = $"attack rays/RayCast2D2"
@onready var ray3 = $"attack rays/RayCast2D"


var speed = 50
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
		if ray2.is_colliding() :
			if dir >= 0 :
				velocity.x = (speed*3) * dir
			elif dir < 0 :
				velocity.x = (speed*3) * (dir*-1)
			if $walk.playing == false :
				$walk.play()
			$walk.pitch_scale = 3
		elif ray3.is_colliding() :
			if dir < 0 :
				velocity.x = (speed*3) * dir
			elif dir >= 0 :
				velocity.x = (speed*3) * (dir*-1)
			if $walk.playing == false :
				$walk.play()
			$walk.pitch_scale = 3
		else : 
			velocity.x = speed * dir
			if $walk.playing == false :
				$walk.play()
			$walk.pitch_scale = 2.5
	else : 
		velocity.x = 0
		$walk.stop()




func update_animation():
	if dir != 0 :
		$particles.direction.x = dir*-1
	
	if velocity.x == 0 :
		$Animator.play("idel")
		$particles.emitting = false
	else : 
		$Animator.play("move")
		$particles.emitting = true
	
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
