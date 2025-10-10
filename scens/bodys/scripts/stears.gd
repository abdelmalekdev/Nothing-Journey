extends Area2D

class_name stears

@onready var ry = $RayCast2D2
@onready var ray = $RayCast2D

func _physics_process(_delta):
	if !ray.is_colliding() :
		$AnimationPlayer.play("in floor")
	else : 
		$AnimationPlayer.play("idel")
	
	if !ry.is_colliding() :
		$AnimationPlayer.play("in up" )
