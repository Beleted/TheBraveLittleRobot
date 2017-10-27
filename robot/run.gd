extends AnimatedSprite

var tempElapsed = 0

func _ready():
   set_process(true)
   
func _process(delta):
   tempElapsed = tempElapsed + delta
   var myglobal = get_node("/root/global")
   if myglobal.is_flipped:
       self.set_flip_h(true)
   else:
       self.set_flip_h(false)
	
	
   if myglobal.is_moving:
       show()
       if(tempElapsed > 0.1):
         if(get_frame() == self.get_sprite_frames().get_frame_count("default") - 1):
            set_frame(0)
         else:
            self.set_frame(get_frame() + 1)
      
       tempElapsed = 0
   else:
	   hide()