extends Control

@onready var v1: VideoStreamPlayer = $VideoStreamPlayer
@onready var v2: VideoStreamPlayer = $VideoStreamPlayer2

var v1_holding_last := false

func _on_start_button_button_down() -> void:
	var v := v1
	v.expand = true
	v.anchor_left = 0.0
	v.anchor_top = 0.0
	v.anchor_right = 1.0
	v.anchor_bottom = 1.0
	v.offset_left = 0.0
	v.offset_top = 0.0
	v.offset_right = 0.0
	v.offset_bottom = 0.0
	v.visible = true
	v.paused = false
	v.stream_position = 0.0
	v.play()
	v1_holding_last = false

func _process(_dt: float) -> void:
	if v1.visible and not v1.paused:
		var length: float = v1.get_stream_length()
		if length > 0.0 and v1.stream_position >= length - 0.05:
			v1.paused = true
			v1.stream_position = max(length - 0.001, 0.0)
			v1_holding_last = true

func _unhandled_input(e: InputEvent) -> void:
	if v1_holding_last and ((e is InputEventMouseButton and e.pressed) or e.is_action_pressed("ui_accept")):
		_play_v2()

func _on_VideoStreamPlayer_finished() -> void:
	# connect v1.finished → this in the editor
	var length: float = v1.get_stream_length()
	v1.paused = true
	if length > 0.0:
		v1.stream_position = max(length - 0.001, 0.0)
	v1_holding_last = true

func _play_v2() -> void:
	v1.visible = false
	var v := v2
	v.expand = true
	v.anchor_left = 0.0
	v.anchor_top = 0.0
	v.anchor_right = 1.0
	v.anchor_bottom = 1.0
	v.offset_left = 0.0
	v.offset_top = 0.0
	v.offset_right = 0.0
	v.offset_bottom = 0.0
	v.visible = true
	v.paused = false
	v.stream_position = 0.0
	v.play()
