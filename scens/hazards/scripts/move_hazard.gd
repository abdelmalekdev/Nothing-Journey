extends Area2D


func _physics_process(_delta):
	updat_move()
	
	pass

func updat_move() :
	if $Timer.time_left >= 2 :
		$Animation.play("atack")
		$CollisionPolygon2D.disabled = false
	if $Timer.time_left <= 2 :
		$Animation.play("idel")
		$CollisionPolygon2D.disabled = true
	
	pass
