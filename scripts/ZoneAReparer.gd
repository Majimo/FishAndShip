extends Area2D

export (int) var moduleId

signal module_repaired

func _ready():
	$AnimatedSprite.play('burn')

func _on_Perso2_repairModule():
	$Timer.start(2)
	emit_signal('module_repaired')

func _on_Timer_timeout():
	$AnimatedSprite.play('repaired')
