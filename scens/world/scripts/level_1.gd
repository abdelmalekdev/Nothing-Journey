extends Node2D

var start_menu_script = preload("res://scens/UI/scripts/startmenu.gd")

var pointsave = "user://chekpoint3.save"


func _ready(): 
	load_point()
	start_menu_script = start_menu_script.new()
	RenderingServer.set_default_clear_color(Color.BLACK)
	pass

func save() :
	var file = FileAccess.open(start_menu_script.save_path , FileAccess.WRITE)
	file.store_var(start_menu_script.level_path)
	pass


#level_0

func _on_button_area_entered(_area):
	$"objects/cave door/AnimationPlayer".play("open")

func _on_area_2d_area_entered(_area):
	$Player.save_collection()
	start_menu_script.level_path = "res://scens/world/level_1.tscn"
	save()
	$bg/Animation0.play("fade_out")


func _on_button_2_area_entered(_area):
	$objects/buttondoor/AnimationPlayer.play("open")

func _on_cave_area_entered(_area):
	$tuto/the_cave.visible = true
func _on_cave_area_exited(_area):
	$tuto/the_cave.visible = false

func _on_lang_pressed():
	if $tuto/AnimationPlayer.is_playing():
		$tuto/AnimationPlayer.play("ar")
	else : $tuto/AnimationPlayer.play("eng")

func _on_animation_0_animation_finished(anim_name):
	if anim_name == "fade_out" :
		get_tree().change_scene_to_file("res://scens/world/level_1.tscn")

#level_1

func _on_door_area_entered(_area):
	$Player.save_collection()
	start_menu_script.level_path = "res://scens/world/level_2.tscn"
	save()
	$bg/Animation1.play("fade_out")
	$"door open".play()

func _on_animation_1_animation_finished(anim_name):
	if anim_name == "fade_out" :
		get_tree().change_scene_to_file("res://scens/world/level_2.tscn")

func _on_c_area_entered(_area):
	$CanvasLayer/C/C.visible = true
func _on_c_area_exited(_area):
	$CanvasLayer/C/C.visible = false

#level_2
var fadeto = 3

func _on_door_to_3_area_entered(_area):
	fadeto = 3
	$Player.save_collection()
	start_menu_script.level_path = "res://scens/world/level_3.tscn"
	save()
	$bg/Animation2.play("fade_out")
	$"door open".play()


func _on_button_l_2_area_entered(_area):
	$"objects/cave door2/AnimationPlayer2".play("open")

func _on_button_l_2_area_exited(_area):
	$"objects/cave door2/AnimationPlayer2".play("close")

func _on_d_l_door_area_entered(_area):
	fadeto = 5
	$Player.save_collection()
	start_menu_script.level_path = "res://scens/Demo levels/demo_level.tscn"
	save()
	$bg/Animation2.play("fade_out")
	$"door open".play()

func _on_animation_2_animation_finished(anim_name):
	if anim_name == "fade_out" :
		if fadeto == 3 :
			get_tree().change_scene_to_file("res://scens/world/level_3.tscn")
		elif fadeto == 5 :
			get_tree().change_scene_to_file("res://scens/Demo levels/demo_level.tscn")
		

#level_3

func save_point() :
	var file = FileAccess.open(pointsave , FileAccess.WRITE)
	file.store_var($Player.position)

func load_point() :
	if FileAccess.file_exists(pointsave) :
		var file = FileAccess.open(pointsave , FileAccess.READ)
		$Player.position = file.get_var()


func _on_door2_area_entered(_area):
	$Player.position = Vector2(528,328)
	$"door open".play()

func _on_door_3_area_entered(_area):
	DirAccess.remove_absolute(pointsave)
	$Player.save_collection()
	start_menu_script.level_path = "res://scens/world/level_4.tscn"
	save()
	$bg/Animation3.play("fade_out")
	$"door open".play()

func _on_button2_area_entered(_area):
	$"objects/cave door/AnimationPlayer2".play("open")

func _on_button_area_exited(_area):
	$"objects/cave door/AnimationPlayer2".play("close")


func _on_animation_3_animation_finished(anim_name):
	if anim_name == "fade_out" :
		get_tree().change_scene_to_file("res://scens/world/level_4.tscn")

func _on_chekpoint_area_entered(_area):
	save_point()
