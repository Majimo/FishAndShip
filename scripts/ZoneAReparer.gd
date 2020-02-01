extends Area2D

export (int) var moduleId

#signal module_repaired

func _ready():
	print('id de départ', moduleId)
	print(self.get_instance_id())
	$AnimatedSprite.play('burn')

func _on_Perso2_repairModule():
	$Timer.start(2)
	print(self.get_instance_id())
	print('id de réparé', moduleId)
	emit_signal('module_repaired', moduleId)

func _on_Timer_timeout():
	$AnimatedSprite.play('repaired')

#func repair_module(id):
#	if moduleId == id:
#		$AnimatedSprite.play('repaired')
