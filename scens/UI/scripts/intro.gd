extends CanvasLayer

var full_screen = false

func _ready(): 
	RenderingServer.set_default_clear_color(Color.BLACK)

func _on_animation_player_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://scens/UI/startmenu.tscn")
	

func _physics_process(_delta):
	if Input.is_action_just_pressed("full screen"):
		if full_screen == false :
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
			full_screen = true
		else : 
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			full_screen = false
