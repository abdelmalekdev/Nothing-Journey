extends Node2D

func _ready():
	RenderingServer.set_default_clear_color(Color.BLACK)

func _physics_process(_delta):
	turorial()

func turorial() :
	if Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_left") :
		$tutorials/move.visible = false
	if Input.is_action_just_pressed("shift") :
		if $tutorials/shift.visible == true :
			$tutorials/shift.visible = false
			$"tutorials/shift/shift tuto/CollisionShape2D".disabled = true
	pass

func _on_door_area_entered(_area):
	$bg/AnimationPlayer.play("fade out")
	$"objects/areas/door/door open".play()

func _on_button_area_entered(_area):
	$bg/AnimationPlayer.play("fade out")

func _on_animation_player_animation_finished(_anim_name):
	if _anim_name == "fade out" :
		get_tree().change_scene_to_file("res://scens/world/history.tscn")

func _on_touch_screen_button_pressed():
	if $"mob controls".visible == false :
		$"mob controls".visible = true
	else : $"mob controls".visible = false

func _on_shift_tuto_area_entered(_area):
	$tutorials/shift.visible = true
func _on_shift_tuto_area_exited(area):
	$tutorials/shift.visible = false

func _on_walljump_tuto_area_entered(_area):
	$tutorials/walljump.visible = true
func _on_walljump_tuto_area_exited(_area):
	$tutorials/walljump.visible = false

func _on_hazard_tuto_area_entered(_area):
	$tutorials/hazard.visible = true
func _on_hazard_tuto_area_exited(_area):
	$tutorials/hazard.visible = false

func _on_money_tuto_area_entered(_area):
	$tutorials/moneys.visible = true
func _on_money_tuto_area_exited(_area):
	$tutorials/moneys.visible = false

func _on_box_tuto_area_entered(area):
	$"tutorials/slide box".visible = true
func _on_box_tuto_area_exited(area):
	$"tutorials/slide box".visible = false

func _on_area_2d_area_entered(area):
	$"tutorials/speed up".visible = true
func _on_area_2d_area_exited(area):
	$"tutorials/speed up".visible =false

func _on_lang_pressed():
	if $AnimationPlayer.is_playing():
		$AnimationPlayer.play("ar")
	else : $AnimationPlayer.play("eng")
