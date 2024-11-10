extends Button

signal window_restored()

var base_window

func _ready():
	base_window = DisplayServer.window_get_mode()

func restore_window():
	window_restored.emit()
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_pressed():
	restore_window()
	self.visible = false
	$"../Maximize".visible = true
