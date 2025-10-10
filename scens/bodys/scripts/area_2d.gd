extends Area2D

var can_free = false

func _on_area_entered(_area):
	$AnimationPlayer.play("free")
	$sound.playing = true
	can_free = true

func _physics_process(_delta):
	if can_free == true :
		if $sound.playing == false :
			queue_free()
