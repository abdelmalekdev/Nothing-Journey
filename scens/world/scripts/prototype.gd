extends Node2D

@onready var collision_polygon_2D = $StaticBody2D/CollisionPolygon2D
@onready var polygon_2D = $StaticBody2D/CollisionPolygon2D/Polygon2D

func _ready():
	polygon_2D.polygon = collision_polygon_2D.polygon
	RenderingServer.set_default_clear_color(Color.BLACK)

func _on_door_area_entered(area):
	get_tree().change_scene_to_file("res://scens/world/level_1.tscn")
	pass # Replace with function body.
