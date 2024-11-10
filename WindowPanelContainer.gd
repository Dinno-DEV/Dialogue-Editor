extends PanelContainer

var click_position:Vector2
var global_click_position:Vector2
var is_mouse_in:bool = false
var is_self_clicked:bool = false
var is_moving:bool = false
var is_resizing:bool = false

func _process(delta):
	if Input.is_action_just_pressed("left_click"):
		is_self_clicked = true
		click_position = get_viewport().get_mouse_position()
	if Input.is_action_just_released("left_click"):
		is_self_clicked = false
		is_moving = false

func _input(event):
	if is_moving:
		pass
	elif !is_mouse_in || !is_self_clicked:
		return
	is_moving = true
	var current_screen_size = DisplayServer.screen_get_size()
	var current_mouse_position = get_viewport().get_mouse_position()
	var current_window_size = get_window().size
	var delta_mouse_position = Vector2i(current_mouse_position - click_position)
	if (get_window().position.x + delta_mouse_position.x) < 0:
		get_window().position.x = 0
	elif (get_window().position.x + delta_mouse_position.x) > current_screen_size.x - current_window_size.x:
		get_window().position.x = current_screen_size.x - current_window_size.x
	else:
		get_window().position.x += delta_mouse_position.x
	
	if (get_window().position.y + delta_mouse_position.y) < 0:
		get_window().position.y = 0
	elif (get_window().position.y + delta_mouse_position.y) > current_screen_size.y - current_window_size.y:
		get_window().position.y = current_screen_size.y - current_window_size.y
	else:
		get_window().position.y += delta_mouse_position.y

func _on_mouse_entered():
	is_mouse_in = true

func _on_mouse_exited():
	is_mouse_in = false
