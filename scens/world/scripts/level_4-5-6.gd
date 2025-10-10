extends Node2D

var start_menu_script = preload("res://scens/UI/scripts/startmenu.gd")

var pointsave = "user://chekpoint4.save"

func _ready(): 
	load_point()
	start_menu_script = start_menu_script.new()
	RenderingServer.set_default_clear_color(Color.BLACK)

func save() :
	var file = FileAccess.open(start_menu_script.save_path , FileAccess.WRITE)
	file.store_var(start_menu_script.level_path)

# level_4

func save_point() :
	var file = FileAccess.open(pointsave , FileAccess.WRITE)
	file.store_var($Player.position)

func load_point() :
	if FileAccess.file_exists(pointsave) :
		var file = FileAccess.open(pointsave , FileAccess.READ)
		$Player.position = file.get_var()

func _on_button_area_entered(_area):
	$"objects/bodys/cave door/AnimationPlayer".play("open")

func _on_button_2_area_entered(_area):
	$"objects/bodys/cave door2/AnimationPlayer".play("open")
func _on_button_2_area_exited(_area):
	$"objects/bodys/cave door2/AnimationPlayer".play("close")

func _on_button_3_area_entered(_area):
	$"objects/bodys/cave door3/AnimationPlayer".play("open")
func _on_button_3_area_exited(_area):
	$"objects/bodys/cave door3/AnimationPlayer".play("close")

func _on_button_4_area_entered(_area):
	$"objects/bodys/cave door4/AnimationPlayer".play("open")

func _on_button_5_area_entered(_area):
	$"objects/bodys/cave door5/AnimationPlayer".play("open")

func _on_button_6_area_entered(_area):
	$"objects/bodys/cave door6/AnimationPlayer".play("open")
func _on_button_6_area_exited(_area):
	$"objects/bodys/cave door6/AnimationPlayer".play("close")

func _on_chekpoint_area_entered(_area):
	save_point()

func _on_door_to_5_area_entered(_area):
	DirAccess.remove_absolute(pointsave)
	$Player.save_collection()
	start_menu_script.level_path = "res://scens/world/level_5.tscn"
	save() 
	$bg/Animation4.play("fade_out")
	$"door open".play()

func _on_animation_4_animation_finished(anim_name):
	if anim_name == "fade_out" :
		get_tree().change_scene_to_file("res://scens/world/level_5.tscn")
		print(254)

#level_6

func _on_button__area_entered(_area):
	$"objects/doors/cave door/AnimationPlayer".play("open")

func _on_button_2__area_entered(_area):
	$"objects/doors/cave door2/AnimationPlayer".play("open")
func _on_button_2__area_exited(_area):
	$"objects/doors/cave door2/AnimationPlayer".play("close")

func _on_button_3__area_entered(_area):
	$"objects/doors/cave door3/AnimationPlayer".play("open")

func _on_up_button_area_entered(_area):
	$objects/button/misad/AnimationPlayer.play("up")
	$"objects/doors/cave door5/AnimationPlayer".play("open")
	$"objects/doors/cave door4/AnimationPlayer".play("close")
	$objects/button/Camera2D.enabled = true
	$Player/Camera2D.enabled = false

func _on_the_end_area_entered(_area):
	$"objects/CanvasLayer/AnimationPlayer".play("fade")

func _on_light_button_area_entered(_area):
	if $objects/light.visible == true :
		$objects/light.visible = false
	elif $objects/light.visible == false :
		$objects/light.visible = true

func _on_button_visible_area_entered(_area):
	$objects/CanvasLayer/AnimationPlayer.play("button v")


func _on_button_pressed():
	$objects/CanvasLayer/AnimationPlayer.play("fade lesson")


func _on_info_pressed():
	get_tree().change_scene_to_file("res://scens/Demo levels/info.tscn")

func _on_lang_pressed():
	if $objects/paper/AnimationPlayer.is_playing():
		$objects/paper/AnimationPlayer.play("ar")
	else : $objects/paper/AnimationPlayer.play("eng")

#level_5

func _on_door_to_6_area_entered(_area):
	$Player.save_collection()
	start_menu_script.level_path = "res://scens/world/level_6.tscn"
	save()
	$bg/Animation5.play("fade_out")
	$"door open".play()

func _on_animation_5_animation_finished(anim_name):
	if anim_name == "fade_out" :
		get_tree().change_scene_to_file("res://scens/world/level_6.tscn")


func _on_paper_area_entered(_area):
	$objects/paper/letter.visible = true
func _on_next_pressed():
	$"objects/doors/open door/AnimationPlayer".play("open")
	$objects/paper/letter.visible = false
