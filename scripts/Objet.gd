extends Node2D

var objets = ['ailes', 'moteur', 'cockpit']

func _ready():
	pass

func pecher_objet():
	return objets[(rand_range(0,objets.size()))]

