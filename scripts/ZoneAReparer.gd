extends Area2D

var isBurning
signal module_repaired

func _ready():
	isBurning = true
	$AnimatedSprite.play('burn')

func _on_Perso2_repairModule():
	$Timer.start(2)
	emit_signal('module_repaired')

func _on_Timer_timeout():
	isBurning = false
	$AnimatedSprite.play('repaired')
