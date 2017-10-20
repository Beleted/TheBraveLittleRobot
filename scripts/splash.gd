extends Node2D

# class member variables go here, for example:
var count = 0
# var b = "textvar"

func _ready():
	set_process(true)
	pass
	
func _process(delta):
   if Input.is_action_pressed("ui_cancel"):
      get_tree().quit()
