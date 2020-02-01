extends Node2D

export (int) var modulesAReparer
var modulesRepares = 0

func _process(delta):
	print('modulesRepares', modulesRepares)
	if modulesRepares == modulesAReparer:
		get_tree().change_scene("res://scenes/WinOver.tscn")


func _on_ZoneAReparer_module_repaired():
	modulesRepares += 1


func _on_ZoneAReparer2_module_repaired():
	modulesRepares += 1


func _on_ZoneAReparer3_module_repaired():
	modulesRepares += 1
