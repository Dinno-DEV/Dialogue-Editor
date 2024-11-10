extends Panel

signal starts_resizing()
signal stops_resizing()

var is_mouse_in:bool = false
var is_clicking:bool = false
var is_resizing:bool = false

var clicked_position:Vector2 = Vector2.ZERO
var size_before_clicked:Vector2 = Vector2.ZERO

func _process(delta):
	var current_mouse_position:Vector2 = get_viewport().get_mouse_position()
	
	if is_resizing:
		pass
	elif Input.is_action_just_pressed("left_click"):
		is_clicking = true
		clicked_position = current_mouse_position
		size_before_clicked = get_window().size
	var delta_mouse_position:Vector2 = Vector2i(current_mouse_position - clicked_position)
	if Input.is_action_just_released("left_click"):
		is_clicking = false
		is_resizing = false
	if is_mouse_in && is_clicking:
		is_resizing = true
	if is_resizing:
		if (size_before_clicked.x + delta_mouse_position.x) > DisplayServer.screen_get_size().x:
			get_window().size.x = DisplayServer.screen_get_size().x
			return
		get_window().size.x = size_before_clicked.x + delta_mouse_position.x
		pass

func _on_mouse_entered():
	is_mouse_in = true

func _on_mouse_exited():
	is_mouse_in = false
