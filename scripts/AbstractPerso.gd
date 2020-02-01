extends KinematicBody2D

export (int) var speed = 150

func _on_Timer_timeout():
	speed = 150

func actionPersoAvecAttente(action, time = 1):
	print(action)
	speed = 0
	$Timer.start(time)
