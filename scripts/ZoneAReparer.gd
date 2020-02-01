extends Area2D

func _ready():
	$AnimatedSprite.play('burn')

func _on_Perso2_repairModule():
	$Timer.start(2)

func _on_Timer_timeout():
	$AnimatedSprite.play('repaired')
