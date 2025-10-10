extends Control

var full_screen = false 

func _ready(): 
	%"main menu".grab_focus()
	RenderingServer.set_default_clear_color(Color.BLACK)

func _physics_process(_delta):
	if Input.is_action_just_pressed("full screen"):
		if full_screen == false :
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
			full_screen = true
		else : 
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			full_screen = false

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://scens/UI/startmenu.tscn")


func _on_info_pressed():
	get_tree().change_scene_to_file("res://scens/Demo levels/info.tscn")
	pass # Replace with function body.
