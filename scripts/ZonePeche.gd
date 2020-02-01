extends Area2D 

var piecesVaisseau = ['piece1','piece2','piece3','piece4','piece5']

func _ready():
#	print(piecesVaisseau[rand_range(0,piecesVaisseau.size())])
	pass

func pecher():
	return piecesVaisseau[rand_range(0,piecesVaisseau.size())]
