extends Area2D

var open = false
var open2 = false
var sound_do = false
var player_script = preload("res://scens/players/scripts/Player.gd").new()

func _physics_process(_delta):
	if open == true :
		if open2 == true :
			if Input.is_action_just_pressed("push") :
				$"../AnimationPlayer".play("open")
				if sound_do == false :
					$"../open".play()
					sound_do = true

func _on_area_entered(_area):
	open = true

func _on_key_open_door():
	open2 = true

func _on_area_exited(_area):
	open = false
