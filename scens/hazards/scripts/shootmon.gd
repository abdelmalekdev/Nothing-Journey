extends CharacterBody2D

var Bullet = preload("res://scens/hazards/gun.tscn")

func _ready() -> void:
	velocity.y += 1
	velocity.x += 1
	velocity.x += -2
	velocity = Vector2(0,0)
	pass

func _physics_process(delta: float) -> void:
	var wall_normal = get_wall_normal()
	move_and_slide()
	pass

func _on_timer_timeout():
	var bullet = Bullet.instantiate()
	get_parent().add_child(bullet)
	bullet.global_position = $Marker2D.global_position
	$AnimatedSprite2D.play("shoot")
	$Timer.start()
	$animationT.start()

func _on_animation_t_timeout():
	$AnimatedSprite2D.play("idel")
