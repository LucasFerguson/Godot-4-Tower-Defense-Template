extends Control

var mapSelectContainer : PanelContainer

func _on_quit_button_pressed():
	get_tree().quit()

func _on_start_button_pressed():
	if not mapSelectContainer:
		var mscScene := preload("res://Scenes/ui/mainMenu/select_map_container.tscn")
		var msc := mscScene.instantiate()
		mapSelectContainer = msc
		add_child(msc)


func _on_start_button_button_down() -> void:
	var v := $VideoStreamPlayer
	v.expand = true
	v.anchor_left = 0.0
	v.anchor_top = 0.0
	v.anchor_right = 1.0
	v.anchor_bottom = 1.0
	v.offset_left = 0.0
	v.offset_top = 0.0
	v.offset_right = 0.0
	v.offset_bottom = 0.0
	v.z_index = 100
	v.visible = true
	v.stream_position = 0.0
	print('Starting video...')
	v.play()
	

#func _on_VideoStreamPlayer_finished() -> void:
	#$VideoStreamPlayer.visible = false
	
@onready var video_stream_player: VideoStreamPlayer = $VideoStreamPlayer

func _on_video_stream_player_finished() -> void:
	video_stream_player.queue_free()
	print('STREAM PLAYER FINISHED...')
	if mapSelectContainer:
		print('Showing Scene UI')
		var mscScene := preload("res://Scenes/ui/mainMenu/select_map_container.tscn")
		var msc := mscScene.instantiate()
		mapSelectContainer = msc
		add_child(msc)
