extends CenterContainer

@onready var start_game = %"start game"

var full_screen = false 
var save_path = "user://level_path.save"
var level_path 


func _ready(): 
	
	if !level_path :
		%"start game".visible = false
		start_game = %"Rest Game"
	
	start_game.grab_focus()
	RenderingServer.set_default_clear_color(Color.BLACK)
	pass

func _physics_process(_delta):
	
	if Input.is_action_just_pressed("full screen"):
		if full_screen == false :
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
			full_screen = true
		else : 
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			full_screen = false
	


func load_level() :
	if FileAccess.file_exists(save_path) :
		var file = FileAccess.open(save_path , FileAccess.READ)
		level_path = file.get_var()





func _on_start_game_pressed():
	load_level()
	get_tree().change_scene_to_file(level_path)


func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.





func _on_info_pressed():
	get_tree().change_scene_to_file("res://scens/UI/controls.tscn")
	pass # Replace with function body.




func _on_delete_save_pressed():
	DirAccess.remove_absolute("user://level_path.save")
	DirAccess.remove_absolute("user://collection.save")
	get_tree().change_scene_to_file("res://scens/Demo levels/tutolevel.tscn")
