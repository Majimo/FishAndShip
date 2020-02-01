extends Node2D

var life = 100
var objets = 0

func _ready():
	$Label.text = str(life)

func _process(delta):
	if objets == 5 :
		$Timer.stop()
		print('win')
	if life == 0 :
		print("Game Over")

func _on_Timer_timeout():
	life -= 1
	$Label.text = str(life)

