extends KinematicBody2D

var direction = Vector2()

const TOP = Vector2(0, -1)
const DOWN = Vector2(0, 1)
const LEFT = Vector2(-1, 0)
const RIGHT = Vector2(1, 0) 

var speed = 0
const MAX_SPEED = 200

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
   var player_input = Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left")
   
   direction = Vector2()

   var myglobal = get_node("/root/global")

   if player_input:
       myglobal.is_moving = true
       if speed < MAX_SPEED:
          speed += 50
       if Input.is_action_pressed("ui_up"):
          direction += TOP
       elif Input.is_action_pressed("ui_down"):
          direction += DOWN
       elif Input.is_action_pressed("ui_right"):
          myglobal.is_flipped = false
          direction += RIGHT
       elif Input.is_action_pressed("ui_left"):
          direction += LEFT
          myglobal.is_flipped = true
   else:
      myglobal.is_moving = false
      speed = 0

   var velocity = direction.normalized() * speed * delta

   if Input.is_action_pressed("ui_select"):
      if is_colliding():
          get_parent().get_node("Crate").get_child(3).hide()
          get_parent().get_node("Crate").get_child(1).show()
          print("maybe")

   #print (velocity)
   move(velocity)