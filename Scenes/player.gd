extends CharacterBody2D

var target_position = Vector2()
var has_target = false
@export var speed = 200

func _ready():
	pass

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		target_position = event.position
		has_target = true

func _process(delta):
	if has_target:
		var direction = (target_position - global_position)
		if direction.length() > 5:
			velocity = direction.normalized() * speed
			move_and_slide()
		else:
			has_target = false
