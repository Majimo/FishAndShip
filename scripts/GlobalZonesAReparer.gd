extends Node2D

var modulesAReparer = 3
var modulesRepares = 0

func _process(delta):
	if modulesRepares == modulesAReparer:
		get_tree().change_scene("res://scenes/WinOver.tscn")


func _on_ZoneAReparer_module_repaired():
	modulesRepares += 1


func _on_ZoneAReparer2_module_repaired():
	modulesRepares += 1


func _on_ZoneAReparer3_module_repaired():
	modulesRepares += 1
