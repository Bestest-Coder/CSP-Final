extends Node2D


var count = 0
var started = false
onready var prog = $TextureProgress
onready var timertext = $TimerText
var cont = true
export var time = 5

signal started
signal finished(final_value)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	if started and cont:
		prog.value = prog.value - 1


func _input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_SPACE:
			if !started:
				started = true
				timertext.visible = true
				emit_signal("started")
				count = 1
				$Timer.start()
			elif cont:
				count += 5
				prog.value = count
		if event.pressed and event.scancode == KEY_ESCAPE:
			get_tree().quit()

func _on_Timer_timeout():
	if time > 1:
		time -= 0.5
	elif cont:
		time -= 0.5
		cont = false
		emit_signal("finished", prog.value)
	timertext.text = "Time left: %d" % time 
