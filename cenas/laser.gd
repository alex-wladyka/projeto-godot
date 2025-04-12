extends Area2D
@export var vel = 1000

var height: int

func _ready() -> void:
	height = get_viewport().get_visible_rect().size[1]
	
	var tween = create_tween()
	tween.tween_property($Sprite2D, 'scale', Vector2(1,1), 0.1).from(Vector2(1,0))

func _process(delta: float) -> void:
	position.y -= vel * delta
	
	if position.y < -150:
		queue_free()
