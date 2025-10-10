extends Area2D

var click = true

func _on_area_entered(_area):
	if click == true :
		$animation.play("click")
		$click.play()
		click = false
func _on_area_exited(_area):
	click = true
	$animation.play("idel")
