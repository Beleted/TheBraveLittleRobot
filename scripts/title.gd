extends TextureFrame

func _ready():
	set_process(true)
	pass
	
func _process(delta):
   if Input.is_action_pressed("ui_accept"):
      get_tree().change_scene("res://field.tscn")
