extends KinematicBody2D

export (int) var speed = 150

func _on_Timer_timeout():
	speed = 150
	reset_player_animation()
	

func actionPersoAvecAttente(action, time):
	print(action)
	speed = 0
	$Timer.start(time)

func reset_player_animation():
	print('Reset de l\'animation')


func _on_BibouPeche_finished():
	$BibouContent.play()
