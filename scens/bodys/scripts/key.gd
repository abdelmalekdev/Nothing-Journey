extends Area2D

signal open_door

var can_free = false

func _on_area_entered(_area):
	$AnimationPlayer.play("free")
	$sound.playing = true
	can_free = true
	emit_signal("open_door")

func _physics_process(_delta):
	if can_free == true :
		if $sound.playing == false :
			queue_free()
