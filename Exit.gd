extends Button

signal exitting_editor

func exit_editor():
	get_tree().quit()

func _on_pressed():
	exitting_editor.emit()
	exit_editor()
