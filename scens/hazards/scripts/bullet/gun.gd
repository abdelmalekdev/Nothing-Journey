extends Area2D

@export var speed = 4

var speedy = 4
var speedx = 0

var visible_time = false

func _ready() -> void:
	visible = false

func _physics_process(delta):
	position += Vector2(speedx , speedy)

func _on_body_entered(body):
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("left") :
		visible = true
		speedy = 0
		speedx = speed * -1
		position.y += -4
	elif area.is_in_group("right") :
		visible = true
		speedy = 0
		speedx = speed
		position.y += -4
	elif area.is_in_group("shootmon") :
		visible = true
		speedy = speed * -1
		speedx = 0

func _on_area_exited(area: Area2D) -> void:
	if visible_time : return
	if area.is_in_group("visibility") :
		visible = true
		position.y += -4
		visible_time
