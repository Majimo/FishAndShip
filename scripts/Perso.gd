extends Node2D

export (int) var speed = 150

func _process(delta):
	var direction = Vector2()
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	position += (speed * delta) * direction

func _on_Perso_area_entered(area):
	if area.is_in_group('zonePeche'):
		print('Je pêche grawh !')
		speed = 0
		$Timer.start()

func _on_Timer_timeout():
	speed = 150
