extends "res://scripts/AbstractPerso.gd"


func _process(delta):
	var direction = Vector2()
	if Input.is_action_pressed("ui_right2"):
		direction.x += 1
	if Input.is_action_pressed("ui_left2"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down2"):
		direction.y += 1
	if Input.is_action_pressed("ui_up2"):
		direction.y -= 1

	position += (speed * delta) * direction

# warning-ignore:unused_argument
func _on_Perso_area_entered(area):
	pass
		
