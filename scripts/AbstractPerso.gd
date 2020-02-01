extends KinematicBody2D

export (int) var speed = 150

func _on_Timer_timeout():
	speed = 150
	
#func _physics_process(delta):
#	move_and_collide()
