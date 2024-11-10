extends Button

signal window_maximized()

func maximize_window():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	window_maximized.emit()

func _on_pressed():
	maximize_window()
	self.visible = false
	$"../Restore".visible = true
