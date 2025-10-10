extends CenterContainer

@onready var resume_game = %"resume game"

func _ready():
	resume_game.grab_focus()
