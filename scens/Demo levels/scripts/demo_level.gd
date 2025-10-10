extends Node2D

var start_menu_script = preload("res://scens/UI/scripts/startmenu.gd")

func save() :
	var file = FileAccess.open(start_menu_script.save_path , FileAccess.WRITE)
	file.store_var(start_menu_script.level_path)

func _ready():
	start_menu_script = start_menu_script.new()
	RenderingServer.set_default_clear_color(Color.BLACK)

func _on_door_area_entered(_area):
	start_menu_script.level_path = "res://scens/world/level_5.tscn"
	save()
	$Player.save_collection()
	$bg/AnimationPlayer.play("fade out")
	$"objects/areas/door/door open".play()

func _on_button_area_entered(_area):
	$bg/AnimationPlayer.play("fade out")

func _on_skip_pressed():
	get_tree().change_scene_to_file("res://scens/Demo levels/demo_level.tscn")

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://scens/UI/startmenu.tscn")

func _on_controls_pressed():
	get_tree().change_scene_to_file("res://scens/UI/controls.tscn")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade out" :
		get_tree().change_scene_to_file("res://scens/Demo levels/demo_level.tscn")

func _on_animation_player2_animation_finished(anim_name):
		if anim_name == "fade out" :
			get_tree().change_scene_to_file("res://scens/world/level_5.tscn")

func _on_touch_screen_button_pressed():
	if $"mob controls".visible == false :
		$"mob controls".visible = true
	else : $"mob controls".visible = false

func _on_area_2d_area_entered(_area):
	$objects/CanvasLayer/W.visible = true
