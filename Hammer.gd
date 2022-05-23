extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var twn = get_parent().get_node("Tween")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Node2D_finished(final_value):
	print(final_value)
	twn.interpolate_property(self, "rect_rotation", 0,
	 float(-60*(final_value/100)), 1.5, Tween.TRANS_BACK, Tween.EASE_IN)
	twn.start()
	print("doing the first")
	print(float(-60*(final_value/100)))
	


func _on_Tween_tween_completed(object, key):
	#yield(get_tree().create_timer(0.3), "timeout")
	if rect_rotation < 0:
		print("doing the new one")
		twn.interpolate_property(self, "rect_rotation", rect_rotation,
		87.0, 1.0, Tween.TRANS_BACK, Tween.EASE_IN)
		twn.start()
