extends Node2D

func _ready():
	RenderingServer.set_default_clear_color(Color.BLACK)
	$bg/AnimationPlayer2.play("fade")

func _on_door_area_entered(_area):
	$bg/AnimationPlayer.play("fade out")
	$"objects/areas/door/door open".play()

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://scens/UI/startmenu.tscn")

func _on_controls_pressed():
	get_tree().change_scene_to_file("res://scens/UI/controls.tscn")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade out" :
		get_tree().change_scene_to_file("res://scens/Demo levels/info.tscn")

func _on_animation_player2_animation_finished(anim_name):
		if anim_name == "fade out" :
			get_tree().change_scene_to_file("res://scens/Demo levels/info.tscn")

func _on_main_menu_area_entered(_area):
	$bg/AnimationPlayer2.play("fade out")

func _on_animation_player_2_animation_finished(anim_name):
	if anim_name == "fade out" :
		get_tree().change_scene_to_file("res://scens/UI/startmenu.tscn")

func _on_touch_screen_button_pressed():
	if $"mob controls".visible == false :
		$"mob controls".visible = true
	else : $"mob controls".visible = false
