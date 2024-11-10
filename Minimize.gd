extends Button

signal window_minimized()

func minimize_window():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MINIMIZED)
	window_minimized.emit()

func _on_pressed():
	minimize_window()
