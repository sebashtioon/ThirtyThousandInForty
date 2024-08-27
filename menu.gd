extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$"go button".set_pivot_offset($"go button".get_size()/2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_go_button_pressed():
	var tween = get_tree().create_tween()
	tween.tween_property($"go button", "scale", Vector2(1.2, 1.2), 0)
	tween.tween_property($"go button", "scale", Vector2(1.0, 1.0), 1).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	get_tree().change_scene_to_file("res://world.tscn")


func _on_go_button_2_pressed():
	get_tree().change_scene_to_file("res://Credits.tscn")
