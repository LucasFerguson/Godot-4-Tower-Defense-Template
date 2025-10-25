extends Control

var mapSelectContainer : PanelContainer

func _on_quit_button_pressed():
	get_tree().quit()

# TODO we will need to edit this button to go to a video intro to the game - Lucas

func _on_start_button_pressed():
	if not mapSelectContainer:
		var mscScene := preload("res://Scenes/ui/mainMenu/select_map_container.tscn")
		var msc := mscScene.instantiate()
		mapSelectContainer = msc
		add_child(msc)
