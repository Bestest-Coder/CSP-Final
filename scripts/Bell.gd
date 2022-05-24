extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var twn = $BellTween
onready var bar = $ColorRect
onready var restart = get_parent().get_node("Restart Button")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Node2D_finished(final_value):
	yield(get_tree().create_timer(2.5), "timeout")
	var vec = $BellRailTop.position -  bar.rect_position
	var start_pos = bar.rect_position
	print(vec)
	twn.interpolate_property(bar, "rect_position", bar.rect_position, bar.rect_position + (vec * (final_value/100)), 1.2,
	Tween.TRANS_QUART, Tween.EASE_OUT)
	twn.start()
	yield(get_tree().create_timer(1.2), "timeout")
	if final_value >= 90:
		$AudioStreamPlayer2D.play()
	twn.interpolate_property(bar, "rect_position", bar.rect_position, start_pos, 1.2,
	Tween.TRANS_QUART, Tween.EASE_OUT)
	twn.start()
	yield(get_tree().create_timer(1.2), "timeout")
	restart.visible = true
