extends Node2D

var modulesRepares = [0, 0, 0]

func _process(delta):
	if modulesRepares[0] == 1 && modulesRepares[1] == 1 && modulesRepares[2] == 1:
		get_tree().change_scene("res://scenes/WinOver.tscn")


func _on_ZoneAReparer1_module_repaired():
	modulesRepares[0] = 1
	area.remove_from_group('zoneAReparer')


func _on_ZoneAReparer2_module_repaired(area):
	modulesRepares[1] = 1
	area.remove_from_group('zoneAReparer')


func _on_ZoneAReparer3_module_repaired(area):
	modulesRepares[2] = 1
	area.remove_from_group('zoneAReparer')
