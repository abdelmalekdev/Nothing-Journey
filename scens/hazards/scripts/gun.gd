extends Area2D

var speed = 4
var dir = -1

func _physics_process(delta):
	position += Vector2(speed * dir , 0)

func _on_body_entered(body):
	queue_free()
	pass # Replace with function body.
