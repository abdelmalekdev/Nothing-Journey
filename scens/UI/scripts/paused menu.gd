extends CanvasLayer

@onready var resume_game = %"resume game"


var full_screen = false 

func _physics_process(_delta):
	if Input.is_action_just_pressed("full screen"):
		if full_screen == false :
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
			full_screen = true
		else : 
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			full_screen = false



func pause() :
	resume_game.grab_focus()
	visible = true
	get_tree().paused = true

func unpause() :
	visible = false
	get_tree().paused = false

func _on_resume_game_pressed():
	unpause()

func _on_quite_pressed():
	get_tree().quit()

func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scens/UI/startmenu.tscn")

func _on_restart_pressed():
	unpause()
	get_tree().reload_current_scene()
	pass # Replace with function body.
