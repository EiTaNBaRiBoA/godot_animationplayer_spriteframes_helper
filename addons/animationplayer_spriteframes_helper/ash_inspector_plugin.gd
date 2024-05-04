extends EditorInspectorPlugin

var _animation_player: AnimationPlayer

func _can_handle(object):
	return object is AnimationPlayer


func _parse_begin(object):
	if not object is AnimationPlayer:
		return 
	_animation_player = object

func _parse_end(object):
	var control_instance =	preload('res://addons/animationplayer_spriteframes_helper/ash_inspector/ash_inspector.tscn').instantiate()
	control_instance.set("animation_player", _animation_player)
	var ep = EditorProperty.new()
	ep.set_label("Sprite Frame Helper") 
	ep.add_child(control_instance)
	ep.set_bottom_editor(control_instance)
	add_custom_control(ep)
	#EditorInterface.get_inspector()



