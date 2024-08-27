extends Control



var clicks_ammount:int = 1
var clicks:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	$Button.text = str(clicks)
	$Button.set_pivot_offset($Button.get_size()/2)
	$"Buy 1 extra click".set_pivot_offset($"Buy 1 extra click".get_size()/2)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$TimerLBL.text = str(roundf($Timer.time_left)) + " seconds"
	$Extraclickcounter.text = "You have: " + str(clicks_ammount)


func _on_button_pressed():
	clicks+=clicks_ammount
	$Button.text = str(clicks)
	var tween = get_tree().create_tween()
	tween.tween_property($Button, "scale", Vector2(1.2, 1.2), 0)
	tween.tween_property($Button, "scale", Vector2(1.0, 1.0), 1).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)


func _on_buy_1_extra_click_pressed():
	var tween = get_tree().create_tween()
	tween.tween_property($"Buy 1 extra click", "scale", Vector2(1.2, 1.2), 0)
	tween.tween_property($"Buy 1 extra click", "scale", Vector2(1.0, 1.0), 1).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)

	clicks_ammount+=1


func _on_timer_timeout():
	if clicks >= 30000:
		get_tree().change_scene_to_file("res://YOU-WON.tscn")
	else:
		get_tree().change_scene_to_file("res://YOU-LOST.tscn")
		
