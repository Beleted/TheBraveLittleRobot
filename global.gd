extends Node

var is_moving = false
var is_flipped = false

func _ready():
	set_process(true)
	pass
	
func _process(delta):
   if Input.is_action_pressed("ui_cancel"):
      get_tree().quit()