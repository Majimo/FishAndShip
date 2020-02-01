extends KinematicBody2D

export (int) var speed = 150

func _on_Timer_timeout():
	speed = 150
	
#func _physics_process(delta):
#	move_and_collide()


func _on_Perso_input_event(viewport, event, shape_idx):
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	pass # Replace with function body.
