extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	play("default")
	
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	delta*=200
	if Input.is_action_pressed("ui_left"):
		go(-delta,0)
	if Input.is_action_pressed("ui_right"):
		go(delta,0)
	if Input.is_action_pressed("ui_up"):
		go(0,-delta)
	if Input.is_action_pressed("ui_down"):
		go(0,delta)
	pass


	

func go(xx,yy):
	 position += Vector2(xx, yy)
