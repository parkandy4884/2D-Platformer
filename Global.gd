extends Node

var starting_in = 0

var default_starting_in = 4

func reset():
	starting_in = default_starting_in

func _unhandled_input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()
		if event.is_action_pressed("menu"):
			var Pause_Menu = get_node_or_null("/root/Game/UI/Pause_Menu")
			if Pause_Menu == null or starting_in > 0:
				get_tree().quit()
			else:
				if Pause_Menu.visible:
					Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
					get_tree().paused = false
					Pause_Menu.hide()
				else:
					Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
					get_tree().paused = true
					Pause_Menu.show()

func end_game(success):
	if success:
		var _scene = get_tree().change_scene("res://End_Game.tscn")
	else:
		var _scene = get_tree().change_scene("res://End_Game.tscn")
