extends Area2D
func _on_play_animation_area_entered(_area):
	$AnimationPlayer.play("jump")
