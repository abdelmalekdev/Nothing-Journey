extends CanvasLayer

signal next2

var full_screen = false

var lang = "eng"
var next = 1

func _ready(): 
	RenderingServer.set_default_clear_color(Color.BLACK)

func _physics_process(_delta):
	if Input.is_action_just_pressed("full screen"):
		if full_screen == false :
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
			full_screen = true
		else : 
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			full_screen = false


func _on_lang_pressed():
	if next == 1:
		if lang == "eng" :
			$AnimationPlayer.play("p1-fade_ara")
			lang = "ara"
		elif lang == "ara" :
			$AnimationPlayer.play("p1_fade_eng")
			lang = "eng"
	elif next == 2 :
		if lang == "eng" :
			$AnimationPlayer.play("p2_p3_fade_ara")
			lang = "ara"
		elif  lang == "ara" :
			$AnimationPlayer.play("p2-p3-fade-eng")
			lang = "eng"


func _on_next_pressed():
	if next == 1 :
		next = 2
		emit_signal("next2")
	elif next == 2 :
		$AnimationPlayer.play("fade_out")


func _on_next_2():
	if lang == "eng" :
		$AnimationPlayer.play("p2-p3-fade-eng")
	elif lang == "ara":
		$AnimationPlayer.play("p2_p3_fade_ara")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_out" :
		get_tree().change_scene_to_file("res://scens/world/level_0.tscn")
	pass # Replace with function body.
